# **Deprecated**: This endpoint is being phased out. Please use the `/v1/engines` endpoint to retrieve the list of available engines instead.

## Usage:
```bash
Returns a list of available datastores. It is recommended to update your integration to use the newer `/v1/engines` endpoint for improved functionality and future compatibility.
```

## Product catalog:
- Usage:
- ./mgc dbaas datastores list [flags]

## Other commands:
- Flags:
- --control.limit integer    The maximum number of items per page. (range: 1 - 50) (default 10)
- --control.offset integer   The number of items to skip before starting to collect the result set. (min: 0)
- -h, --help                     help for list
- --status enum              Value referring to engine status. (one of "ACTIVE" or "DEPRECATED")
- -v, --version                  version for list

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

