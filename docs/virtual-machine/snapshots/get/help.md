# Get an snapshot details for the current tenant which is logged in.

## Usage:
```bash
#### Notes
- You can use the snapshots list command to retrieve all snapshots,
so you can get the id of the snapshot that you want to get details.
```

## Product catalog:
- - You can use the **expand** argument to get more details from the inner objects
- like image or type.

## Other commands:
- Usage:
- ./mgc virtual-machine snapshots get [id] [flags]

## Flags:
```bash
Flags:
      --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
      --expand array(string)          Expand: You can get more detailed info about: ['image', 'machine-type']  (default [])
  -h, --help                          help for get
      --id string                     Id (required)
  -v, --version                       version for get
```

