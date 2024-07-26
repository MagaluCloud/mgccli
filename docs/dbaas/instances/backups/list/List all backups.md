# List all backups.

## Usage:
```bash
Usage:
  ./mgc dbaas instances backups list [instance-id] [flags]
```

## Product catalog:
- Flags:
- --control.limit integer    The maximum number of items per page. (range: 1 - 50) (default 10)
- --control.offset integer   The number of items to skip before starting to collect the result set. (min: 0)
- -h, --help                     help for list
- --instance-id uuid         Value referring to instance Id. (required)
- --mode enum                Value referring to backup mode. (one of "FULL" or "INCREMENTAL")
- --status enum              Value referring to backup status. (one of "CREATED", "CREATING", "DELETED", "DELETING", "ERROR", "ERROR_DELETING" or "PENDING")
- --type enum                Value referring to backup type. (one of "AUTOMATED" or "ON_DEMAND")
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

