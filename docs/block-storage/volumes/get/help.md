# Retrieve details of a Volume for the currently authenticated tenant.

## Usage:
```bash
#### Notes
- Use the **expand** argument to obtain additional details about the Volume
 Type.
- Utilize the **block-storage volume list** command to retrieve a list of all
 Volumes and obtain the ID of the Volume for which you want to retrieve
 details.
```

## Product catalog:
- Usage:
- ./mgc block-storage volumes get [id] [flags]

## Other commands:
- Flags:
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --expand array(string)          Expand: You can get more detailed info about: ['volume_type', 'attachment'] (default [])
- -h, --help                          help for get
- --id uuid                       Id (required)
- -v, --version                       version for get

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

