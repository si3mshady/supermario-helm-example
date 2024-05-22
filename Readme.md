## Step 1: Start Minikube

Before we begin, make sure you have Minikube installed and running on your machine. If you haven't started Minikube yet, open a terminal and run the following command:

```bash
minikube start
```

This command will start a local Kubernetes cluster using Minikube.

## Step 2: Install Helm

Helm is a package manager for Kubernetes that helps you create, install, upgrade, and manage applications on your cluster. If you haven't installed Helm yet, follow these steps:

1. Download the latest Helm release from the official website: https://github.com/helm/helm/releases
2. Unpack the downloaded archive.
3. Move the `helm` binary to a directory that's included in your system's `PATH` environment variable.

Alternatively, you can use a package manager like Homebrew (for macOS) or Chocolatey (for Windows) to install Helm.

## Step 3: Create a New Helm Chart

To create a new Helm chart for the Super Mario game, run the following command:

```bash
helm create supermario
```

This command will create a new directory named `supermario` with the basic structure and files required for a Helm chart.

## Step 4: Customize the Helm Chart

Now, you need to customize the Helm chart to deploy the Super Mario game. Navigate to the `supermario` directory and open the `values.yaml` file in a text editor. This file contains the configuration values for your chart.

In the `values.yaml` file, you'll need to add the following configuration:

```yaml
image:
  repository: nirmalnaveen/supermario
  tag: "latest"
  pullPolicy: IfNotPresent

service:
  type: LoadBalancer
  port: 80
```

This configuration specifies the Docker image for the Super Mario game (`nirmalnaveen20/supermario`), the service type (`LoadBalancer`), and the port on which the game will be accessible (`80`).

Save the changes to the `values.yaml` file.

## Step 5: Deploy the Helm Chart

Now that you've customized the Helm chart, you can deploy it to your Minikube cluster using the following command:

```bash
helm install supermario-release supermario
```

Here's what this command does:

- `helm install` tells Helm to install a new chart.
- `supermario-release` is the release name, which is an arbitrary name you choose for this installation.
- `supermario` is the name of the chart directory you created in Step 3.

Helm will create a new Kubernetes deployment and service for the Super Mario game based on the chart's configuration.

## Step 6: Access the Game

To access the Super Mario game, you need to find the IP address or hostname of the service that Helm created. Run the following command:

```bash
kubectl get service supermario-release-supermario
```

This command will display the service details, including the external IP or hostname. Make a note of the IP/hostname.

Open a web browser and enter the IP/hostname in the address bar. You should see the Super Mario game running in your browser!

## Step 7: Upgrade/Rollback (Optional)

If you need to make changes to the Helm chart (e.g., update the Docker image version), you can upgrade your installation using the following command:

```bash
helm upgrade supermario-release supermario
```

This command will upgrade your existing installation with the latest changes to the chart.

If you need to roll back to the previous version, you can use the following command:

```bash
helm rollback supermario-release
```

## Step 8: Uninstall (Optional)

When you're done playing the game and want to remove it from your Kubernetes cluster, you can uninstall the release using the following command:

```bash
helm uninstall supermario-release
```

---

To access the Super Mario game running on Minikube locally, you can use the `minikube service` command along with the service name. Based on the output you provided, the service name is `supermario-release`.

Follow these steps:

1. Run the following command to open the service in your default web browser:

```
minikube service supermario-release
```

This command will automatically open a web browser window and navigate to the URL where the Super Mario game is accessible.

2. If the command doesn't open the browser automatically, you can get the URL by running:

```
minikube service supermario-release --url
```

This will print the URL, which you can then copy and paste into your web browser.

The URL will typically look something like this: `http://192.168.99.100:30968` (the IP address and port may vary).

3. If you encounter any issues accessing the game, you can try running the following command to check the status of the Minikube cluster and the service:

```
minikube status
kubectl describe service supermario-release
```

The `minikube status` command will show you if the Minikube cluster is running correctly, and the `kubectl describe service` command will provide more details about the service, including the external IP address and port mappings.

By following these steps, you should be able to access the Super Mario game running on your local Minikube cluster through the exposed service[1]. If you continue to face issues, you may need to troubleshoot further by checking the logs of the deployment or inspecting the Kubernetes resources.

# supermario-helm-example
# supermario-helm-example
# supermario-helm-example
# supermario-helm-example
