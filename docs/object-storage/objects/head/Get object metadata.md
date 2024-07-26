# Get object metadata

## Usage:
```bash
Usage:
  ./mgc object-storage objects head [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects head --dst="bucket1/file.txt"

## Other commands:
- Flags:
- --dst uri              Path of the object to be get metadata from (required)
- -h, --help                 help for head
- --obj-version string   Version of the object to be get metadata from

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

