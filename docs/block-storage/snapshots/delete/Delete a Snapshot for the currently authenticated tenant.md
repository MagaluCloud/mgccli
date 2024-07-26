# Delete a Snapshot for the currently authenticated tenant.

## Usage:
```bash
#### Rules
- The Snapshot's status must be "completed".
- The Snapshot's state must be "available".
- Deleting a Snapshot that has been restored is not possible. If necessary,
 delete the restored Volume first and then proceed to delete the Snapshot.
```

## Product catalog:
- #### Notes
- - Utilize the **block-storage snapshots** list command to retrieve a list of
- all Snapshots and obtain the ID of the Snapshot you wish to delete.
- - If needed, you can use the **block-storage volume list** command to retrieve
- a list of all Volumes and obtain the ID of the restored Volume.

## Other commands:
- Usage:
- ./mgc block-storage snapshots delete [id] [flags]

## Flags:
```bash
Flags:
  -h, --help      help for delete
      --id uuid   Id (required)
  -v, --version   version for delete
```

