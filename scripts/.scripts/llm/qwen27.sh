#!/bin/sh
    -hf unsloth/Qwen3.6-35B-A3B-MTP-GGUF:UD-Q3_K_M \
    -c 96000 -fa on -np 1 \
    --spec-type draft-mtp --spec-draft-n-max 2 --host 0.0.0.0
