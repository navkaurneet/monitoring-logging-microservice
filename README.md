## Deployment Steps:

Build and Push Docker Images: Run the Ansible playbook:

    ansible-playbook ansible/playbook.yaml

Verify Kubernetes Deployments: Check if all pods are running:

    kubectl get pods

Access the Application:

Frontend: Exposed on NodePort or LoadBalancer.
Microservices communicate internally using Kubernetes services.

# Project Structure:

observable-microfrontend-project/
├── ansible/
│   ├── ansible.cfg
│   ├── inventory.yaml
│   ├── playbook.yaml
├── k8s-manifests/
│   ├── frontend-deployment.yaml
│   ├── service1-deployment.yaml
│   ├── service2-deployment.yaml
│   ├── postgres-deployment.yaml
│   ├── otel-collector-deployment.yaml
│   ├── services.yaml
│   ├── configmaps.yaml
├── frontend/
│   ├── Dockerfile
│   ├── app.js
│   └── package.json
├── service1/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── service2/
│   ├── Dockerfile
│   ├── app.py
│   └── requirements.txt
├── shared-backend/
│   └── Dockerfile
├── otel-collector-config.yaml


# Deployment Steps

Follow these steps to deploy the project seamlessly:

**Step 1**: Prepare the Environment
Run the requirements.sh script to install all necessary tools:

    chmod +x requirements.sh
    ./requirements.sh

Note: After running the script, log out and log back in to ensure Docker permissions are updated for your user.

**Step 2**: Build and Push Docker Images
Use the Ansible playbook to automate this process:

    ansible-playbook ansible/playbook.yaml

**Step 3**: Verify Kubernetes Deployments
Check if all pods are running:
 
    kubectl get pods

**Step 4**: Access the Application
Frontend: Access via NodePort or LoadBalancer service. Retrieve the external IP and port:

    kubectl get services

Backend Services: Communicate internally via Kubernetes service DNS (e.g., http:/service1:5000).

4. Notes for Smooth Operation
Ensure that Kubernetes is properly configured (e.g., kubeadm init for a single-node cluster).
Use a container registry like Docker Hub for external Docker image hosting. Update the Ansible playbook and Kubernetes manifests with appropriate image paths if needed.
This setup ensures a fully automated deployment with minimal manual intervention. Let me know if you'd like further help with testing or debugging!