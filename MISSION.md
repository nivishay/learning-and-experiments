# Mission: Kubernetes

## Why
Pass a technical interview at NVIDIA that will test deep Kubernetes knowledge. NVIDIA runs large-scale ML infrastructure on Kubernetes (GPU clusters, distributed training, inference serving), so the interview is likely to probe both operational knowledge and the ability to reason about what happens under the hood.

## Success looks like
- Explain what happens step-by-step when you run `kubectl apply -f deployment.yaml`
- Describe the Kubernetes control plane components and what each one does
- Reason about scheduling, resource management, and autoscaling under load
- Explain how Pods communicate with each other and with the outside world
- Identify the right workload type (Deployment vs StatefulSet vs DaemonSet vs Job) for a given ML use case
- Speak confidently about GPU resource management, taints, and tolerations

## Constraints
- Interview-driven: depth matters more than breadth — it's better to really understand the core than to skim 20 topics
- No prior Kubernetes experience before this project — starting from zero
- Already built a real project: FastAPI ML inference service with Deployment, Service, HPA on Minikube

## Out of scope
- Kubernetes operators / custom resource definitions (CRDs) — too advanced for now
- Helm chart authoring — operational detail not needed for the interview
- Multi-cluster federation
- Kubernetes security hardening in depth (RBAC is in scope, mTLS/service mesh is not)
