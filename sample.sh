#!/bin/bash

# Define the base path for models
BASE_PATH="$HOME/ComfyUI/models"

# Create necessary directories if they don't exist
mkdir -p "$BASE_PATH/checkpoints"
mkdir -p "$BASE_PATH/facerestore_models"
mkdir -p "$BASE_PATH/facedetection"
mkdir -p "$BASE_PATH/insightface"

# Download Stable Diffusion models
curl -L -o "$BASE_PATH/facerestore_models/codeformer-v0.1.0.pth" "https://huggingface.co/ziixzz/codeformer-v0.1.0.pth/resolve/main/codeformer-v0.1.0.pth"

curl -L -o "$BASE_PATH/facedetection/retinaface_resnet50.onnx" "https://huggingface.co/OWG/resnet-50/resolve/main/onnx/model.onnx"

# Download YOLO detection model
curl -L -o "$BASE_PATH/insightface/inswapper_128.onnx" "https://huggingface.co/ezioruan/inswapper_128.onnx/resolve/main/inswapper_128.onnx"

# Download ahxl_v1.safetensors model into checkpoints
curl -L -o "$BASE_PATH/checkpoints/ahxl_v1.safetensors" "https://huggingface.co/nahuiyang/custom/resolve/88ce5013c565938aa33daa9cf4ce7cba446a85e2/ahxl_v1.safetensors"

# Completion message
echo "Download complete! Files are stored in $BASE_PATH."
