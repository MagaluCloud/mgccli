# Detach a Volume from a Virtual Machine instance for the
 currently authenticated tenant.

## Usage:
```bash
The Volume detachment will be completed when the Volume state returns to
 "available," and the status becomes "completed".
```

## Product catalog:
- #### Rules
- - The Volume and the Virtual Machine must belong to the same tenant.
- - Both the Volume and Virtual Machine must have the status "completed".
- - The Volume's state must be "in-use".
- - The Virtual Machine's state must be "stopped".

## Other commands:
- #### Notes
- - Verify the state and status of your Volume using the
- **block-storage volume get --id [uuid]** command.
- - Verify the state and status of your Virtual Machine using the
- **virtual-machine instances get --id [uuid]** command.
- - Ensure that any file systems on the device within your operating system are
- unmounted before detaching the Volume.

## Flags:
```bash
#### Troubleshooting
- A failure during detachment can result in the Volume becoming stuck in the
 busy state. If this occurs, detachment may be delayed indefinitely until you
 unmount the Volume, force detachment, reboot the instance, or perform all
 three.
```

