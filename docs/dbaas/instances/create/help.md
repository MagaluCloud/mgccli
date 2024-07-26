# Creates a new database instance asynchronously for a tenant.

## Usage:
```bash
Usage:
  ./mgc dbaas instances create [flags]
```

## Product catalog:
- Examples:
- ./mgc dbaas instances create --volume.size=30

## Other commands:
- Flags:
- --backup-retention-days integer   Backup Retention Days: The number of days that a particular backup is kept until its deletion. (default 7)
- --backup-start-at time            Backup Start At: Start time (UTC timezone) which is allowed to start the automated backup process. (default "04:00:00")
- --cli.list-links enum[=table]     List all available links for this command (one of "json", "table" or "yaml")
- --datastore-id uuid               Datastore Id (Deprecated): **Deprecated**: This property is being deprecated in favor of 'engine_id'. Please update your requests to use 'engine_id' for improved functionality and future compatibility.
- 
- --engine-id uuid                  Engine Id
- --flavor-id uuid                  Flavor Id (required)
- -h, --help                            help for create
- --name string                     Name (max character count: 100) (required)
- --parameters array(object)        Use --parameters=help for more details (default [])
- --password string                 Password (max character count: 50) (required)
- --user string                     User (max character count: 25) (required)
- -v, --version                         version for create
- --volume object                   Instance Volume Request (properties: size and type)
- Use --volume=help for more details (required)
- --volume.size integer             Instance Volume Request: The size of the volume (in GiB). (range: 10 - 50000)
- This is the same as '--volume=size:integer'.
- --volume.type enum                Instance Volume Request: The type of the volume. (one of "CLOUD_HDD", "CLOUD_NVME" or "CLOUD_NVME_15K")
- This is the same as '--volume=type:enum'. (default "CLOUD_NVME_15K")

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

