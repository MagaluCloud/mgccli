# Returns a list of database instances for a x-tenant-id.

## Usage:
```bash
Usage:
  ./mgc dbaas instances list [flags]
```

## Product catalog:
- Examples:
- ./mgc dbaas instances list --status="ACTIVE"

## Other commands:
- Flags:
- --control.expand enum       Instance extra attributes or relations to show with the main query. When available, more than one value can be informed using commas. e.g: '--control.expand="replicas"' (must be "replicas")
- --control.limit integer     The maximum number of items per page. (range: 1 - 25) (default 10)
- --control.offset integer    The number of items to skip before starting to collect the result set. (min: 0)
- --engine-id uuid            Engine Id unique identifier
- -h, --help                      help for list
- --status enum               Value referring to instance status. (one of "ACTIVE", "BACKING_UP", "CREATING", "DELETED", "DELETING", "ERROR", "ERROR_DELETING", "MAINTENANCE", "PENDING", "REBOOT", "RESIZING", "RESTORING", "STARTING", "STOPPED" or "STOPPING")
- -v, --version                   version for list
- --volume.size integer       Volume Size exact size
- --volume.size-gt integer    Volume Size greater than
- --volume.size-gte integer   Volume Size greater than or equal
- --volume.size-lt integer    Volume Size less than
- --volume.size-lte integer   Volume Size less than or equal

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

