# Renames a Snapshot with the id provided in the current tenant which is logged in.

## Usage:
```bash
#### Notes
- You can use the snapshots list command to retrieve all snapshots, so you can get the id of
the snapshot that you want to rename.
```

## Product catalog:
- Usage:
- ./mgc virtual-machine snapshots rename [id] [flags]

## Other commands:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --cli.watch                     Wait until the operation is completed by calling the 'get' link and waiting until termination. Akin to '! get -w'
- -h, --help                          help for rename
- --id string                     Id (required)
- --name string                   Name (between 1 and 255 characters) (required)
- -v, --version                       version for rename

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

