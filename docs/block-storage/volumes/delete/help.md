# Delete a Volume for the currently authenticated tenant.

## Usage:
```bash
#### Rules
- The Volume cannot be attached to a Virtual Machine, i.e., its state cannot
 be "in-use". If necessary, detach the Volume from the Virtual Machine before
 proceeding with deletion.
- The Volume must not have any snapshots. If necessary, delete the Volume's
  snapshots before proceeding with deletion.
- The Volume must have the status "completed", i.e., must not have any
  actions in progress.
```

## Product catalog:
- #### Notes
- - Check the state and status of your Volume using the
- **block-storage volume get --id [uuid]** command".

## Other commands:
- Usage:
- ./mgc block-storage volumes delete [id] [flags]

## Flags:
```bash
Flags:
  -h, --help      help for delete
      --id uuid   Id (required)
  -v, --version   version for delete
```

