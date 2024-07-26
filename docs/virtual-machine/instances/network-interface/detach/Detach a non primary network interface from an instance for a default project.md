# Detach a non primary network interface from an instance for a default project

## Usage:
```bash
Usage:
  ./mgc virtual-machine instances network-interface detach [flags]
```

## Product catalog:
- Examples:
- ./mgc virtual-machine instances network-interface detach --instance.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --instance.name="some_resource_name" --network.interface.id="9ec75090-2872-4f51-8111-53d05d96d2c6"

## Other commands:
- Flags:
- -h, --help                          help for detach
- --instance object               Instance (at least one of: single property: id or single property: name)
- Use --instance=help for more details (required)
- --instance.id string            Instance: Id (between 1 and 255 characters)
- This is the same as '--instance=id:string'.
- --instance.name string          Instance: Name (between 1 and 255 characters)
- This is the same as '--instance=name:string'.
- --network object                NICRequestInterfaceField (single property: interface)
- Use --network=help for more details (required)
- --network.interface object      NICRequestInterfaceField: ID (single property: id)
- Use --network.interface=help for more details
- This is the same as '--network=interface:object'.
- --network.interface.id string   ID: Id (between 1 and 255 characters)
- This is the same as '--network.interface=id:string'.
- -v, --version                       version for detach

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

