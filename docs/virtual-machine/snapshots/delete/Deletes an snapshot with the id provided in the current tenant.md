# Deletes an snapshot with the id provided in the current tenant
which is logged in.

## Usage:
```bash
#### Notes
- You can use the Snapshots list command to retrieve all snapshots, so
- you can get the id of the snapshot that you want to delete.
```

## Product catalog:
- Usage:
- ./mgc virtual-machine snapshots delete [id] [flags]

## Other commands:
- Flags:
- -h, --help      help for delete
- --id uuid   Id (required)
- -v, --version   version for delete

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

