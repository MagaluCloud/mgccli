# List all snapshots in the current tenant which is logged in.

## Usage:
```bash
#### Notes
- You can use the **expand** argument to get more details from the inner objects
like image and machine types.
```

## Product catalog:
- Usage:
- ./mgc virtual-machine snapshots list [flags]

## Other commands:
- Flags:
- --control.limit integer     Limit: limit the number of the results (max: 2147483647) (default 50)
- --control.offset integer    Offset: pagination for the results limited (max: 2147483647)
- --control.sort string       Sort: order of the results using informed fields (pattern: ^(^[\w-]+:(asc|desc)(,[\w-]+:(asc|desc))*)?$) (default "created_at:asc")
- --expand array(string)     Expand: You can get more detailed info about: ['image', 'machine-type']  (default [])
- -h, --help                     help for list
- -v, --version                  version for list

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

