# Attach a Volume to a Virtual Machine instance for the currently
 authenticated tenant.

## Usage:
```bash
The Volume attachment will be completed when the Volume status returns to
"completed", and the state becomes "in-use".
```

## Product catalog:
- #### Rules
- - The Volume and the Virtual Machine must belong to the same tenant.
- - Both the Volume and Virtual Machine must have the status "completed".
- - The Volume's state must be "available".
- - The Virtual Machine's state must be "stopped" or "running".

## Other commands:
- #### Notes
- - Verify the state and status of your Volume using the
- **block-storage volume get --id [uuid]** command.
- - Verify the state and status of your Virtual Machine using the
- **virtual-machine instances get --id [uuid]** command".

## Flags:
```bash
Usage:
  ./mgc block-storage volumes attach [id] [virtual-machine-id] [flags]
```

