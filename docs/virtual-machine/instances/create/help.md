# Create a Virtual Machine instance

## Usage:
```bash
Usage:
  ./mgc virtual-machine instances create [flags]
```

## Product catalog:
- Examples:
- ./mgc virtual-machine instances create --image.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --image.name="some_resource_name" --machine-type.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --machine-type.name="some_resource_name" --network.associate-public-ip=true --network.interface.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --network.interface.security-groups='[{"id":"9ec75090-2872-4f51-8111-53d05d96d2c6"}]' --network.vpc.id="9ec75090-2872-4f51-8111-53d05d96d2c6" --network.vpc.name="some_resource_name"

## Other commands:
- Flags:
- --availability-zone string                  Availability Zone (between 1 and 255 characters)
- --cli.list-links enum[=table]               List all available links for this command (one of "json", "table" or "yaml")
- --cli.watch                                 Wait until the operation is completed by calling the 'get' link and waiting until termination. Akin to '! get -w'
- -h, --help                                      help for create
- --image object                              Image (at least one of: single property: id or single property: name)
- Use --image=help for more details (required)
- --image.id string                           Image: Id (between 1 and 255 characters)
- This is the same as '--image=id:string'.
- --image.name string                         Image: Name (between 1 and 255 characters)
- This is the same as '--image=name:string'.
- --machine-type object                       Machine Type (at least one of: single property: id or single property: name)
- Use --machine-type=help for more details (required)
- --machine-type.id string                    Machine Type: Id (between 1 and 255 characters)
- This is the same as '--machine-type=id:string'.
- --machine-type.name string                  Machine Type: Name (between 1 and 255 characters)
- This is the same as '--machine-type=name:string'.
- --name string                               Name (between 1 and 255 characters) (required)
- --network object                            (properties: associate_public_ip, interface and vpc)
- Use --network=help for more details
- --network.associate-public-ip boolean       network's associate_public_ip property: Associate Public Ip
- This is the same as '--network=associate_public_ip:boolean'. (default true)
- --network.interface object                  network's interface property: Interface (at least one of: single property: id or single property: security_groups)
- Use --network.interface=help for more details
- This is the same as '--network=interface:object'.
- --network.interface.id string               Interface: Id (between 1 and 255 characters)
- This is the same as '--network.interface=id:string'.
- --network.interface.security-groups array   Interface: Security Groups
- Use --network.interface.security-groups=help for more details
- This is the same as '--network.interface=security_groups:array'. (default [])
- --network.vpc object                        network's vpc property: Vpc (at least one of: single property: id or single property: name)
- Use --network.vpc=help for more details
- This is the same as '--network=vpc:object'. (default {"name":"default"})
- --network.vpc.id string                     Vpc: Id (between 1 and 255 characters)
- This is the same as '--network.vpc=id:string'.
- --network.vpc.name string                   Vpc: Name (between 1 and 255 characters)
- This is the same as '--network.vpc=name:string'.
- --ssh-key-name string                       Ssh key Name (required)
- --user-data string                          Used to perform automated configuration tasks. (between 1 and 65000 characters)
- -v, --version                                   version for create

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

