# Returns a database instance detail.

## Usage:
```bash
Usage:
  ./mgc dbaas instances get [instance-id] [flags]
```

## Product catalog:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --control.expand enum           Instance extra attributes or relations to show with the main query. When available, more than one value can be informed using commas. e.g: '--control.expand="replicas"' (must be "replicas")
- -h, --help                          help for get
- --instance-id uuid              Value referring to instance Id. (required)
- -v, --version                       version for get

## Other commands:
- Global Flags:
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use

## Flags:
```bash

```

