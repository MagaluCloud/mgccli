# Restore a snapshot of a Virtual Machine with the current tenant which is logged in. </br>
A Snapshot is ready for restore when it's in available state.

## Usage:
```bash
#### Notes
- You can verify the state of snapshot using the snapshot list command.
- Use machine-types list to see all machine types available.
```

## Product catalog:
- #### Rules
- - To restore a snapshot  you have to inform the new virtual machine information.
- - You can choose a machine-type that has a disk equal or larger
- than the original virtual machine type.

## Other commands:
- Usage:
- ./mgc virtual-machine snapshots restore [id] [flags]

## Flags:
```bash
Examples:
  ./mgc virtual-machine snapshots restore --machine-type.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --machine-type.name="some_resource_name" --network.associate-public-ip=true --network.interface.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --network.interface.security-groups='[{"id":"9ec75090-2872-4f51-8111-53d05d96d2c6"}]' --network.vpc.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --network.vpc.name="some_resource_name"
```

