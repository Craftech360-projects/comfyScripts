#!/bin/bash

# Define the base path where models should be downloaded
BASE_PATH="$HOME/ComfyUI/models"

# Create necessary directories
mkdir -p "$BASE_PATH/facerestore_models"
mkdir -p "$BASE_PATH/facedetection"
mkdir -p "$BASE_PATH/insightface"

# Download Stable Diffusion models
curl -L -o "$BASE_PATH/facerestore_models/codeformer-v0.1.0.pth" "https://huggingface.co/ziixzz/codeformer-v0.1.0.pth/resolve/main/codeformer-v0.1.0.pth"

curl -L -o "$BASE_PATH/facedetection/retinaface_resnet50.onnx" "https://huggingface.co/OWG/resnet-50/resolve/main/onnx/model.onnx"

# Download YOLO detection model
curl -L -o "$BASE_PATH/insightface/inswapper_128.onnx" "https://huggingface.co/ezioruan/inswapper_128.onnx/resolve/main/inswapper_128.onnx"

# Completion message
echo "Download complete! Files are stored in $BASE_PATH."
