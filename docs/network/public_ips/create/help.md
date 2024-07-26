# Create async Public IP in a VPC with provided vpc_id and x_tenant_id

## Usage:
```bash
Usage:
  ./mgc network public-ips create [vpc-id] [flags]
```

## Product catalog:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --description string            Description
- -h, --help                          help for create
- --validate-quota                validateQuota: Validate the quota before creating the Public IP (default true)
- -v, --version                       version for create
- --vpc-id string                 Vpc ID: Id of the VPC to create the Public IP in (required)
- --wait                          The request will be asynchronous. The wait parameter tells the API that you want the request to simulate synchronous behavior (to maintain endpoint compatibility). You can set an approximate timeout with the waitTimeout parameter (default true)
- --wait-timeout integer          waitTimeout: the approximate time in seconds you want to wait when simulating the request as synchronous (only works with wait=true) (default 120)

## Other commands:
- Global Flags:
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use

## Flags:
```bash

```

