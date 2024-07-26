# Retrieve a list of images allowed for the current region.

## Usage:
```bash
Usage:
  ./mgc virtual-machine images list [flags]
```

## Product catalog:
- Flags:
- --control.limit integer     Limit (max: 2147483647) (default 50)
- --control.offset integer    Offset (max: 2147483647)
- --control.sort string       Sort (pattern: ^(^[\w-]+:(asc|desc)(,[\w-]+:(asc|desc))*)?$) (default "platform:asc,end_life_at:desc")
- -h, --help                     help for list
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

