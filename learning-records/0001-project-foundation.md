# Built a complete ML inference service on Kubernetes from scratch

The user built a FastAPI sentiment-analysis service (DistilBERT via HuggingFace) and deployed it to Minikube using three Kubernetes objects: a Deployment (2 replicas, CPU/memory requests and limits, liveness and readiness probes), a LoadBalancer Service (port 80 → 8000), and an HPA (2–6 replicas, 60% CPU target). They also wrote a production-quality multi-stage Dockerfile that bakes the model into the image to avoid runtime downloads.

Evidence: the YAML files and Dockerfile exist in the project and show correct field usage and meaningful comments demonstrating understanding of *why* each field is there.

Implications: the user can write Kubernetes YAML and understands the purpose of the main objects. The next step is to explain *what actually happens inside the cluster* when those manifests are applied — the control plane architecture. Without this, their knowledge is "recipe-following" rather than deep understanding, which will not hold up in a senior NVIDIA interview.
