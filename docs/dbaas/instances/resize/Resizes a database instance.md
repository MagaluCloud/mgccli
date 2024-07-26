# Resizes a database instance.

## Usage:
```bash
Usage:
  ./mgc dbaas instances resize [instance-id] [flags]
```

## Product catalog:
- Examples:
- ./mgc dbaas instances resize --volume.size=30

## Other commands:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --flavor-id uuid                Flavor Id
- -h, --help                          help for resize
- --instance-id uuid              Value referring to instance Id. (required)
- -v, --version                       version for resize
- --volume object                 Instance Volume Request (properties: size and type)
- Use --volume=help for more details
- --volume.size integer           Instance Volume Request: The size of the volume (in GiB). (range: 10 - 50000)
- This is the same as '--volume=size:integer'.
- --volume.type enum              Instance Volume Request: The type of the volume. (one of "CLOUD_HDD", "CLOUD_NVME" or "CLOUD_NVME_15K")
- This is the same as '--volume=type:enum'. (default "CLOUD_NVME_15K")

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

