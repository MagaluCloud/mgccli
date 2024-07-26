# Delete an object from a bucket

## Usage:
```bash
Usage:
  ./mgc object-storage objects delete [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects delete --dst="bucket1/file.txt"

## Other commands:
- Flags:
- --dst uri              Path of the object to be deleted (required)
- -h, --help                 help for delete
- --obj-version string   Version of the object to be deleted

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

