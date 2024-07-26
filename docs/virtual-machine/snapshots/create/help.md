# Create a snapshot of a Virtual Machine in the current tenant which is logged in. </br>
A Snapshot is ready for restore when it's in available state.

## Usage:
```bash
#### Notes
- You can verify the state of snapshot using the snapshot get command,
- To create a snapshot it's mandatory inform a valid and unique name.
```

## Product catalog:
- #### Rules
- - It's only possible to create a snapshot of a valid virtual machine.
- - It's not possible to create 2 snapshots with the same name.
- - You can inform ID or Name from a Virtual Machine if both informed the priority will be ID.

## Other commands:
- Usage:
- ./mgc virtual-machine snapshots create [flags]

## Flags:
```bash
Examples:
  ./mgc virtual-machine snapshots create --virtual-machine.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --virtual-machine.name="some_resource_name"
```

