# Changes a Virtual Machine instance machine type with the id provided in the current tenant
which is logged in.

## Usage:
```bash
#### Notes
- You can use the virtual-machine list command to retrieve all instances, so you can get
the id of the instance that you want to change the machine type.
```

## Product catalog:
- #### Rules
- - The instance must be in the running or stopped state.
- - The new machine type must be compatible with the current machine type.
- - The new machine type must be available in the same region as the current machine type.
- - You must provide either the machine type id or the machine type name, if you provide both,
- the machine type id will be used.

## Other commands:
- Usage:
- ./mgc virtual-machine instances retype [id] [flags]

## Flags:
```bash
Examples:
  ./mgc virtual-machine instances retype --machine-type.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --machine-type.name="some_resource_name"
```

