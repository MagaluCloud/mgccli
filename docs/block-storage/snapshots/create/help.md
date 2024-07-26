# Create a Snapshot for the currently authenticated tenant.

## Usage:
```bash
The Snapshot can be used when it reaches the "available" state and the
 "completed" status.
```

## Product catalog:
- #### Rules
- - The Snapshot name must be unique; otherwise, the creation will be disallowed.
- - Creating Snapshots from restored Volumes may lead to future conflicts as
- you can't delete a Volume with an Snapshot and can't delete a Snapshot with a
- restored Volume, so we recommend avoiding it.

## Other commands:
- #### Notes
- - Use the **block-storage volume list** command to retrieve a list of all
- Volumes and obtain the ID of the Volume that will be used to create the
- Snapshot.

## Flags:
```bash
Usage:
  ./mgc block-storage snapshots create [flags]
```

