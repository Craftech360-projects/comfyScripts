#!/bin/bash

# Define the base path for the Stable Diffusion models
BASE_PATH="./"

# Create directories if they don't exist
mkdir -p "$BASE_PATH/checkpoints"
mkdir -p "$BASE_PATH/controlnet"
mkdir -p "$BASE_PATH/ip-adapter"
mkdir -p "$BASE_PATH/clip"
mkdir -p "$BASE_PATH/insightface"

# Download and move files to their respective folders using curl

# Stable Diffusion Checkpoint
curl -L -o "$BASE_PATH/checkpoints/picxReal_10.safetensors" "https://huggingface.co/kris142/kris10/resolve/main/picxReal_10.safetensors"

# ControlNet Inpaint
curl -L -o "$BASE_PATH/controlnet/control_v11p_sd15_inpaint_fp16.safetensors" "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_inpaint_fp16.safetensors"

# Face Swapper (InsightFace)
curl -L -o "$BASE_PATH/insightface/inswapper_128.onnx" "https://huggingface.co/ezioruan/inswapper_128.onnx/resolve/main/inswapper_128.onnx"

# IP-Adapter Face ID
curl -L -o "$BASE_PATH/ip-adapter/ip-adapter-faceid-plusv2_sd15.bin" "https://huggingface.co/h94/IP-Adapter-FaceID/resolve/main/ip-adapter-faceid-plusv2_sd15.bin"

# CLIP Model
curl -L -o "$BASE_PATH/clip/model.safetensors" "https://huggingface.co/laion/CLIP-ViT-H-14-laion2B-s32B-b79K/resolve/main/model.safetensors"

# ControlNet OpenPose
curl -L -o "$BASE_PATH/controlnet/control_v11p_sd15_openpose_fp16.safetensors" "https://huggingface.co/comfyanonymous/ControlNet-v1-1_fp16_safetensors/resolve/main/control_v11p_sd15_openpose_fp16.safetensors"

echo "Download complete! Files are stored in the appropriate folders."
