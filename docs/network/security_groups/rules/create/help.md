# Create a Rule async, returning its ID. To monitor the creation progress, please check the status in the service message or implement polling.Either a remote_ip_prefix or a remote_group_id can be specified.With remote_ip_prefix, all IPs that match the criteria will be allowed.With remote_group_id, only the specified security group is allowed to communicatefollowing the specified protocol, direction and port_range_min/max

## Usage:
```bash
Usage:
  ./mgc network security-groups rules create [security-group-id] [flags]
```

## Product catalog:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --direction string              Direction
- --ethertype string              Ethertype
- -h, --help                          help for create
- --port-range-max integer        Port Range Max
- --port-range-min integer        Port Range Min
- --protocol string               Protocol
- --remote-group-id string        Remote Group Id
- --remote-ip-prefix string       Remote Ip Prefix
- --security-group-id string      Security Group ID: Id of the Security Group (required)
- --validate-quota                validateQuota: Validate the quota before creating Rule (default true)
- -v, --version                       version for create
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

