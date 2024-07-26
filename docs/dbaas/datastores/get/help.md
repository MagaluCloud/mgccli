# **Deprecated**: This endpoint is being phased out. Please use the `/v1/engines/{engine_id}` endpoint to retrieve the list of available engines instead.

## Usage:
```bash
Returns a datastore detail. It is recommended to update your integration to use the newer `/v1/engines/{engine_id}` endpoint for improved functionality and future compatibility.
```

## Product catalog:
- Usage:
- ./mgc dbaas datastores get [engine-id] [flags]

## Other commands:
- Flags:
- --engine-id uuid   Datastore Id (Deprecated): Value referring to datastore Id. (required)
- -h, --help             help for get
- -v, --version          version for get

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

