# Updates a database instance.

## Usage:
```bash
Usage:
  ./mgc dbaas instances update [instance-id] [flags]
```

## Product catalog:
- Examples:
- ./mgc dbaas instances update --backup-retention-days=7 --backup-start-at="04:00:00" --status="ACTIVE"

## Other commands:
- Flags:
- --backup-retention-days integer   Backup Retention Days: The number of days that a particular backup is kept until its deletion.
- --backup-start-at time            Backup Start At: Start time (UTC timezone) which is allowed to start the automated backup process.
- --cli.list-links enum[=table]     List all available links for this command (one of "json", "table" or "yaml")
- -h, --help                            help for update
- --instance-id uuid                Value referring to instance Id. (required)
- --status enum                     Instance Status Update (one of "ACTIVE" or "STOPPED")
- -v, --version                         version for update

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
```

