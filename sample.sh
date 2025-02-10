#!/bin/bash

# Define the base path for the Stable Diffusion models
BASE_PATH="/home/runner/ComfyUI/models"

# Create necessary directories if they don't exist
mkdir -p "$BASE_PATH/checkpoints"
mkdir -p "$BASE_PATH/detection/bbox"
mkdir -p "$BASE_PATH/sam"

# Download Stable Diffusion models
curl -L -o "$BASE_PATH/checkpoints/albedobaseXL_v13.safetensors" "https://huggingface.co/frankjoshua/albedobaseXL_v13/resolve/5770b538c319a7445d628c96fe7e2d80713346b0/albedobaseXL_v13.safetensors"

curl -L -o "$BASE_PATH/checkpoints/realisticVisionV20_v20.safetensors" "https://huggingface.co/ckpt/realistic-vision-v20/resolve/main/realisticVisionV20_v20.safetensors"

# Download YOLO detection model
curl -L -o "$BASE_PATH/detection/bbox/face_yolov8m.pt" "https://huggingface.co/datasets/Gourieff/ReActor/resolve/main/models/detection/bbox/face_yolov8m.pt"

# Download SAM model
curl -L -o "$BASE_PATH/sam/sam_vit_h_4b8939.pth" "https://huggingface.co/spaces/abhishek/StableSAM/resolve/main/sam_vit_h_4b8939.pth"

# Completion message
echo "Download complete! Files are stored in the appropriate folders."
