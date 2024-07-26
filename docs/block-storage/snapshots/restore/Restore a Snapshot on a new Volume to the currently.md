# Restore a Snapshot on a new Volume to the currently
 authenticated tenant.

## Usage:
```bash
The restored Volume can be used when it reaches the "available" state and the
 "completed" status.
```

## Product catalog:
- #### Notes
- - To obtain the ID of the Snapshot you wish to restore, you can use the
- **block-storage snapshots list** command to list all Snapshots.
- - Check the state and status of your Volume using the
- **block-storage volume get --id [uuid]** command.

## Other commands:
- Usage:
- ./mgc block-storage snapshots restore [snapshot-id] [flags]

## Flags:
```bash
Flags:
      --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
      --cli.watch                     Wait until the operation is completed by calling the 'get' link and waiting until termination. Akin to '! get -w'
  -h, --help                          help for restore
      --name string                   Name (min character count: 1) (required)
      --snapshot-id uuid              Snapshot Id (required)
  -v, --version                       version for restore
```

