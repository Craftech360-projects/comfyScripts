#!/bin/bash

# Define the base path for models and custom nodes
BASE_PATH="$HOME/ComfyUI/models"
CUSTOM_NODES_PATH="$HOME/ComfyUI/custom_nodes"

# Create necessary directories if they don't exist
mkdir -p "$BASE_PATH/checkpoints"
mkdir -p "$BASE_PATH/facerestore_models"
mkdir -p "$BASE_PATH/facedetection"
mkdir -p "$BASE_PATH/insightface"
mkdir -p "$BASE_PATH/loras"
mkdir -p "$CUSTOM_NODES_PATH"

# Function to download file if it doesn't exist
download_if_not_exist() {
    local file_path="$1"
    local url="$2"
    
    if [ ! -f "$file_path" ]; then
        echo "Downloading: $file_path"
        curl -L -o "$file_path" "$url"
    else
        echo "File already exists: $file_path"
    fi
}

# Function to clone or update a custom node repository
clone_or_update_repo() {
    local repo_url="$1"
    local folder_name="$2"
    local repo_path="$CUSTOM_NODES_PATH/$folder_name"

    if [ ! -d "$repo_path" ]; then
        echo "Cloning repository: $repo_url into $repo_path"
        git clone "$repo_url" "$repo_path"
    else
        echo "Repository already exists: $repo_path. Updating..."
        cd "$repo_path" && git pull origin main
    fi
}

# Download Stable Diffusion models
download_if_not_exist "$BASE_PATH/facerestore_models/codeformer-v0.1.0.pth" "https://huggingface.co/ziixzz/codeformer-v0.1.0.pth/resolve/main/codeformer-v0.1.0.pth"

download_if_not_exist "$BASE_PATH/facedetection/retinaface_resnet50.onnx" "https://huggingface.co/OWG/resnet-50/resolve/main/onnx/model.onnx"

download_if_not_exist "$BASE_PATH/insightface/inswapper_128.onnx" "https://huggingface.co/ezioruan/inswapper_128.onnx/resolve/main/inswapper_128.onnx"

download_if_not_exist "$BASE_PATH/checkpoints/ahxl_v1.safetensors" "https://huggingface.co/nahuiyang/custom/resolve/88ce5013c565938aa33daa9cf4ce7cba446a85e2/ahxl_v1.safetensors"

download_if_not_exist "$BASE_PATH/checkpoints/realistic.safetensors" "https://civitai.com/api/download/models/353332?type=Model&format=SafeTensor&size=pruned&fp=fp32"

download_if_not_exist "$BASE_PATH/loras/cap.safetensors" "https://civitai.com/api/download/models/87011?type=Model&format=SafeTensor"

# Clone or update the required custom nodes
clone_or_update_repo "https://github.com/pythongosssss/ComfyUI-ReActor.git" "ComfyUI-ReActor"
clone_or_update_repo "https://github.com/ltdrdata/comfyui-saveimage-plus.git" "comfyui-saveimage-plus"

# Install dependencies for the custom nodes
echo "Installing dependencies for ComfyUI..."
pip install -r "$CUSTOM_NODES_PATH/comfyui-saveimage-plus/requirements.txt"
pip install -r "$CUSTOM_NODES_PATH/ComfyUI-ReActor/requirements.txt"

# Completion message
echo "Installation complete! Models and custom nodes are installed."
