# Upload a file to a bucket

## Usage:
```bash
Usage:
  ./mgc object-storage objects upload [src] [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects upload --dst="my-bucket/dir/file.txt" --src="./file.txt" --storage-class="cold"

## Other commands:
- Flags:
- --dst uri              Full destination path in the bucket with desired filename (required)
- -h, --help                 help for upload
- --src file             Source file path to be uploaded (required)
- --storage-class enum   Type of Storage in which to store object (one of "", "cold", "cold_instant", "glacier_ir" or "standard") (default "")

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

