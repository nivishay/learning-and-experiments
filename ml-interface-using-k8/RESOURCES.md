# Kubernetes Resources

## Knowledge

- [Kubernetes Official Documentation](https://kubernetes.io/docs/home/)
  The authoritative source. Use for: exact field semantics, API reference, concepts pages. Concepts section is especially good.

- [Kubernetes: Up and Running (3rd ed.) — Burns, Beda, Hightower (O'Reilly)](https://www.oreilly.com/library/view/kubernetes-up-and/9781098110192/)
  The canonical book by the original Kubernetes authors. Use for: deep conceptual understanding of every core object and the reasoning behind design decisions.

- [Kubernetes the Hard Way — Kelsey Hightower](https://github.com/kelseyhightower/kubernetes-the-hard-way)
  Bootstraps a full cluster manually — no automation. Use for: understanding what every component does at the binary level. Interview gold.

- [CNCF Blog — Kubernetes](https://www.cncf.io/blog/?_sft_post_tag=kubernetes)
  Engineering posts from the community. Use for: production patterns, war stories, deep dives into specific subsystems.

- [Kubernetes Scheduler Deep Dive — official blog](https://kubernetes.io/blog/2017/03/advanced-scheduling-in-kubernetes/)
  Covers the scheduler's extension points (affinity, taints, tolerations). Critical for GPU workloads at NVIDIA.

## Wisdom (Communities)

- [Kubernetes Slack — #kubernetes-users, #sig-scheduling](https://slack.k8s.io/)
  The most active community. Direct access to core maintainers. Use for: unclear behavior, edge cases, "why does it work this way."

- [r/kubernetes](https://reddit.com/r/kubernetes)
  Good for operational questions and production patterns. Signal-to-noise is decent.

## Gaps

- No resource yet specifically covering GPU resource management (`nvidia.com/gpu` resource type, device plugins). Needs to be found before the interview.
