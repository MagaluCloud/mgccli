# This command uploads any file from the local path to the bucket if it is not already present or has modified time changed.

## Usage:
```bash
Usage:
  ./mgc object-storage objects sync [local] [bucket] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects sync --bucket="my-bucket/dir/" --local="./"

## Other commands:
- Flags:
- --batch-size integer   Limit of items per batch to delete (range: 1 - 1000) (default 1000)
- --bucket uri           Bucket path (required)
- --delete               Deletes any item at the bucket not present on the local
- -h, --help                 help for sync
- --local uri            Local path (required)

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

