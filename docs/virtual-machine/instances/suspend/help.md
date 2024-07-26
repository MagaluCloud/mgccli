# Suspends a Virtual Machine instance with the id provided in the current tenant which is logged in.

## Usage:
```bash
#### Notes
- You can use the virtual-machine list command to retrieve all instances, so you can get the id of
the instance that you want to suspend.
```

## Product catalog:
- #### Rules
- - The instance must be in the running state.

## Other commands:
- Usage:
- ./mgc virtual-machine instances suspend [id] [flags]

## Flags:
```bash
Flags:
      --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
      --cli.watch                     Wait until the operation is completed by calling the 'get' link and waiting until termination. Akin to '! get -w'
  -h, --help                          help for suspend
      --id uuid                       Id (required)
  -v, --version                       version for suspend
```

