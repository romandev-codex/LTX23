#!/bin/bash
set -e
COMFYUI_DIR=/workspace/ComfyUI
VENV_PYTHON="$COMFYUI_DIR/.venv/bin/python"
echo "------------Comfyui V1.1 - Starting"
# ── Launch Jupyter Lab ───────────────────────────────────────────
echo "  → Starting Jupyter Lab on port 8888..."
jupyter lab \
    --allow-root \
    --notebook-dir=/ \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --ServerApp.token='12345' \
    --ServerApp.allow_origin='*' \
    > /workspace/jupyter.log 2>&1 &
# ── Launch ComfyUI ───────────────────────────────────────────────
echo "  → Launching ComfyUI on port 8188..."
echo ""
exec $VENV_PYTHON "$COMFYUI_DIR/main.py" \
    --listen 0.0.0.0 \
    --port 8188 \
    --use-sage-attention
