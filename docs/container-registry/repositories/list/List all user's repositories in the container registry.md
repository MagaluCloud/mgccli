# List all user's repositories in the container registry.

## Usage:
```bash
Usage:
  ./mgc container-registry repositories list [registry-id] [flags]
```

## Product catalog:
- Flags:
- --control.limit integer    Limit (min: 1)
- --control.offset integer   Offset (min: 0)
- --control.sort string      Fields to use as reference to sort. (pattern: (^[\w-]+:(asc|desc)(,[\w-]+:(asc|desc))*)?$) (default "created_at:desc")
- -h, --help                     help for list
- --registry-id uuid         Container Registry's UUID. (required)
- -v, --version                  version for list

## Other commands:
- Global Flags:
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use

## Flags:
```bash

```

