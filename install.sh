#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Minikube
echo "Installing Minikube..."
brew install minikube

# Install Hyperkit driver for Minikube
echo "Installing Hyperkit driver..."
brew install hyperkit

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=hyperkit

# Install Helm
echo "Installing Helm..."
brew install helm

# Add Helm repository
echo "Adding Helm repository..."
helm repo add stable https://charts.helm.sh/stable

# Update Helm repositories
echo "Updating Helm repositories..."
helm repo update

echo "Installation completed successfully!"

#start minikube 
minikube start

