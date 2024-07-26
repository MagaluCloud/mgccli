# Updates nodes from a node pool by nodepool_uuid.

## Usage:
```bash
Usage:
  ./mgc kubernetes nodepool update [cluster-id] [node-pool-id] [flags]
```

## Product catalog:
- Examples:
- ./mgc kubernetes nodepool update --auto-scale.max-replicas=5 --auto-scale.min-replicas=2

## Other commands:
- Flags:
- --auto-scale object                 Object specifying properties for updating workload resources in the Kubernetes cluster.
- (properties: max_replicas and min_replicas)
- Use --auto-scale=help for more details
- --auto-scale.max-replicas integer   Object specifying properties for updating workload resources in the Kubernetes cluster: Maximum number of replicas for autoscaling. If not provided, or if the value is equal to or less than zero, the autoscaler value will be assumed based on the "replicas" field.
- (min: 1)
- This is the same as '--auto-scale=max_replicas:integer'. (default 1)
- --auto-scale.min-replicas integer   Object specifying properties for updating workload resources in the Kubernetes cluster: Minimum number of replicas for autoscaling. If not provided, or if the value is equal to or less than zero, the autoscaler value will be assumed based on the "replicas" field.
- (min: 1)
- This is the same as '--auto-scale=min_replicas:integer'. (default 1)
- --cli.list-links enum[=table]       List all available links for this command (one of "json", "table" or "yaml")
- --cluster-id uuid                   Cluster's UUID. (required)
- -h, --help                              help for update
- --node-pool-id uuid                 Nodepool's UUID. (required)
- --replicas integer                  Number of replicas of the nodes in the node pool.
- -v, --version                           version for update

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

