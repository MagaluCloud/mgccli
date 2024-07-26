# Create a Security Group

## Usage:
```bash
Usage:
  ./mgc network vpcs security-groups create [vpc-id] [flags]
```

## Product catalog:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --description string            Description
- -h, --help                          help for create
- --name string                   Name (between 5 and 100 characters) (required)
- -v, --version                       version for create
- --vpc-id string                 VPC Id: Id of the vpc to create the security group in (required)
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

