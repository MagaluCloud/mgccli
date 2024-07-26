# Rename a Snapshot for the currently authenticated tenant.

## Usage:
```bash
#### Rules
- The Snapshot name must be unique; otherwise, renaming will not be allowed.
```

## Product catalog:
- #### Notes
- - Utilize the **block-storage snapshots list** command to retrieve a list of
- all Snapshots and obtain the ID of the Snapshot you wish to rename.

## Other commands:
- Usage:
- ./mgc block-storage snapshots rename [id] [flags]

## Flags:
```bash
Flags:
      --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
      --cli.watch                     Wait until the operation is completed by calling the 'get' link and waiting until termination. Akin to '! get -w'
  -h, --help                          help for rename
      --id uuid                       Id (required)
      --name string                   Name (between 1 and 255 characters) (required)
  -v, --version                       version for rename
```

