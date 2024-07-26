# Buckets are "containers" that are able to store various Objects inside

## Usage:
```bash
Usage:
  ./mgc object-storage buckets create [bucket] [flags]
```

## Product catalog:
- Flags:
- --bucket string                 Name of the bucket to be created (required)
- --cli.list-links enum[=table]   List all available links for this command (one of "json", "table" or "yaml")
- --enable-versioning             Enable versioning for this bucket (default true)
- --grant-write array(object)     Allows grantees to create objects in the bucket
- Use --grant-write=help for more details
- -h, --help                          help for create
- --private                       Owner gets FULL_CONTROL. Delegated users have access. No one else has access rights
- --public-read                   Owner gets FULL_CONTROL. Everyone else has READ rights

## Other commands:
- Global Flags:
- --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use
- --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)

## Flags:
```bash

```

