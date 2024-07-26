# Generate a pre-signed URL for accessing an object

## Usage:
```bash
Usage:
  ./mgc object-storage objects presign [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects presign --dst="bucket1/file.txt" --expires-in="2h"

## Other commands:
- Flags:
- --dst uri             Path of the object to generate pre-signed URL for (required)
- --expires-in string   Expiration time for the pre-signed URL. Valid time units are 'ns, 'us' (or 'µs'), 'ms', 's',  'm', and 'h'.default=5m
- -h, --help                help for presign
- --method enum         (one of "GET" or "PUT") (required) (default "GET")

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

