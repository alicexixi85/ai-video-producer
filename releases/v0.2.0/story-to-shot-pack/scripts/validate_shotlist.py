#!/usr/bin/env python3
"""Validate an offline shotlist.json without networking or changing files."""
import json, sys
from pathlib import Path

def validate(d):
    issues=[]
    if not isinstance(d,dict) or not isinstance(d.get("shots"),list) or not d["shots"]:
        return ["shots must be a nonempty list"]
    try:
        target=float(d["target_duration_s"]);fps=int(d["fps"])
        if target<=0 or fps<=0: raise ValueError()
    except (KeyError,ValueError,TypeError): return ["target duration and fps must be positive"]
    identities={x.get("cast_id") for x in d.get("continuity",{}).get("cast",[]) if isinstance(x,dict)}
    seen=set();previous=0.
    for n,s in enumerate(d["shots"]):
        if not isinstance(s,dict): issues.append("shot must be an object");continue
        ident=s.get("id")
        if not ident or ident in seen:issues.append(f"shot {n}: missing/duplicate ID")
        seen.add(ident)
        try:
            start=float(s["start_s"]);duration=float(s["duration_s"])
            if duration<=0 or abs(start-previous)>0.00001:issues.append(f"shot {n}: gap/overlap")
            end=start+duration
            if s.get("start_frame")!=round(start*fps) or s.get("end_frame")!=round(end*fps):
                issues.append(f"shot {n}: wrong frame range")
            previous=end
        except (KeyError,TypeError,ValueError): issues.append(f"shot {n}: invalid timing")
        for field in ("scene","action","framing","camera","light","image_prompt","video_prompt"):
            if not isinstance(s.get(field),str) or not s[field].strip():issues.append(f"shot {n}: missing {field}")
        if not isinstance(s.get("dialogue"),str):issues.append(f"shot {n}: invalid dialogue")
        for cid in s.get("cast_ids",[]):
            if cid not in identities:issues.append(f"shot {n}: unknown cast {cid}")
    if abs(previous-target)>0.00001:issues.append("total duration mismatch")
    return issues

if __name__=="__main__":
    if len(sys.argv)!=2:sys.exit("Usage: python validate_shotlist.py shotlist.json")
    try:doc=json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
    except (OSError,ValueError) as error:sys.exit(str(error))
    errors=validate(doc)
    for item in errors:print("FAIL:",item)
    if errors:sys.exit(1)
    print("PASS: shotlist format and timing")
