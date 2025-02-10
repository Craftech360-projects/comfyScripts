#!/bin/bash

# Define the base directory of ComfyUI
BASE_DIR=$(pwd)

# Custom Nodes Installation Directory
CUSTOM_NODES_DIR="$BASE_DIR/custom_nodes"

# Models Directory
CHECKPOINTS_DIR="$BASE_DIR/models/checkpoints"
LORAS_DIR="$BASE_DIR/models/loras"

# Ensure directories exist
mkdir -p "$CUSTOM_NODES_DIR"
mkdir -p "$CHECKPOINTS_DIR"
mkdir -p "$LORAS_DIR"

echo "Installing Custom Nodes..."

# Clone Custom Nodes repositories (Add your required nodes here)
cd $CUSTOM_NODES_DIR

# Example: Add or replace the GitHub repositories with your preferred nodes
git clone https://github.com/djbielejeski/a-person-mask-generator || echo "mask-generator Pack already exists"
git clone https://github.com/LykosAI/ComfyUI-Inference-Core-Nodes || echo "Inference-Core-Nodes-Evolved already exists"
git clone https://github.com/jags111/efficiency-nodes-comfyui || echo "efficiency-nodes-comfyui already exists"
git clone https://github.com/EllangoK/ComfyUI-post-processing-nodes || echo "post-processing-nodes already exists"
git clone https://github.com/cubiq/ComfyUI_IPAdapter_plus || echo "IPAdapter_plus already exists"
git clone https://github.com/BadCafeCode/masquerade-nodes-comfyui || echo "masquerade-nodes-comfyuialready exists"
git clone https://github.com/WASasquatch/was-node-suite-comfyui || echo "was-node-suite-comfyui already exists"



# Install dependencies for each custom node
for d in */; do
    if [ -f "$d/requirements.txt" ]; then
        echo "Installing dependencies for $d..."
        pip install -r "$d/requirements.txt"
    fi
done

echo "Downloading Models..."

# Download Checkpoints
cd "$CHECKPOINTS_DIR"
wget -c "https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/blob/main/sd_xl_base_1.0.safetensors" -O sd_xl_base_1.0.safetensors
wget -c "https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/blob/main/sd_xl_refiner_1.0.safetensors" -O sd_xl_refiner_1.0.safetensors
wget -c "https://huggingface.co/runwayml/stable-diffusion-v1-5/blob/main/v1-5-pruned.ckpt" -O v1-5-pruned.ckpt

# Download LoRAs
cd "$LORAS_DIR"
wget -c "https://huggingface.co/artificialguybr/StudioGhibli.Redmond-V2/blob/main/StudioGhibli.Redmond-StdGBRRedmAF-StudioGhibli.safetensors" -O StudioGhibli.Redmond-StdGBRRedmAF-StudioGhibli.safetensors
wget -c "https://civitai.com/api/download/models/912623?type=Model&format=SafeTensor" -O Yoji_Shinkawa_Art_Style_Flux.safetensors

# Move back to ComfyUI directory
cd "$BASE_DIR"

echo "Installation Completed. Restart ComfyUI for changes to take effect."

