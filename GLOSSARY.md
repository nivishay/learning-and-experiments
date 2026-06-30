# Kubernetes Glossary

Canonical terminology for this teaching workspace. All explainers and exercises use these definitions.

## Core objects

**Pod**:
The smallest deployable unit in Kubernetes — one or more containers that share a network namespace (same IP, same ports) and can share storage volumes. Pods are ephemeral: they are not rescheduled if they die, they are replaced.
_Avoid_: container (a Pod wraps containers), instance, server

**Deployment**:
A Kubernetes object that declares the desired state of a set of identical Pods (replica count, container image, resource limits). The Deployment controller continuously reconciles actual state toward desired state.
_Avoid_: service (entirely different concept), app

**ReplicaSet**:
The object a Deployment creates to maintain a stable count of Pod replicas. Usually not managed directly — Deployments manage ReplicaSets.

**Service**:
A stable virtual IP and DNS name that load-balances traffic across a dynamic set of Pods matched by a label selector.
_Avoid_: load balancer (LoadBalancer is a Service *type*, not the same as Service)

**HorizontalPodAutoscaler (HPA)**:
A controller that adjusts a Deployment's replica count up or down based on observed metrics (CPU, memory, or custom).

## Labels and selectors

**Label**:
A key-value metadata tag attached to any Kubernetes object. Labels are the primary mechanism for objects to find and relate to each other.

**Selector**:
A filter that matches objects by their labels. A Service selector finds its target Pods this way; a Deployment selector links it to its ReplicaSet.

## Resources

**Resource request**:
The minimum amount of CPU or memory a container is guaranteed. The scheduler uses requests to decide which Node can host a Pod.

**Resource limit**:
The maximum CPU or memory a container may consume. Exceeding the CPU limit causes throttling; exceeding the memory limit causes the container to be killed (OOMKilled).

**Millicore (m)**:
One-thousandth of a CPU core. `250m` = 0.25 cores. The unit Kubernetes uses for CPU requests and limits.

## Health

**Liveness probe**:
A periodic check that tells Kubernetes whether a container is alive. Failure triggers a container restart.

**Readiness probe**:
A periodic check that tells Kubernetes whether a container is ready to receive traffic. Failure removes the Pod from the Service's endpoint list — no traffic is sent to it — but the container is not restarted.
