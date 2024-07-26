# Create a Port with provided vpc_id and x-tenant-id. You can provide a list of security_groups_id or subnets

## Usage:
```bash
Usage:
  ./mgc network ports create [vpc-id] [flags]
```

## Product catalog:
- Flags:
- --cli.list-links enum[=table]        List all available links for this command (one of "json", "table" or "yaml")
- --has-pip                            Has Pip (default true)
- --has-sg                             Has Sg (default true)
- -h, --help                               help for create
- --name string                        Name (between 5 and 100 characters) (required)
- --security-groups-id array(string)   Security Groups Id (default [])
- --subnets array(string)              Subnets (default [])
- -v, --version                            version for create
- --vpc-id string                      vpc_id: ID of the VPC to create port (required)

## Other commands:
- Global Flags:
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use
- --x-zone string          X-Zone

## Flags:
```bash

```

