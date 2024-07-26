# Delete all objects from a bucket

## Usage:
```bash
Usage:
  ./mgc object-storage objects delete-all [bucket] [flags]
```

## Product catalog:
- Flags:
- --batch-size integer     Limit of items per batch to delete (range: 1 - 1000) (default 1000)
- --bucket string          Name of the bucket to delete objects from (required)
- --filter array(object)   File name pattern to include or exclude
- Use --filter=help for more details
- -h, --help                   help for delete-all

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

