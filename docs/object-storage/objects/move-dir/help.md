# Moves objects from a source to a destination.
They can be either local or remote but not both local (Local -> Remote, Remote -> Local, Remote -> Remote)

## Usage:
```bash
Usage:
  ./mgc object-storage objects move-dir [src] [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects move-dir --dst="s3://my-bucket/dir" --src="./dir"

## Other commands:
- Flags:
- --batch-size integer   Limit of items per batch to process (range: 1 - 1000) (default 1000)
- --dst uri              Destination to put files into (required)
- -h, --help                 help for move-dir
- --src uri              Source path or uri to move files from (required)

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

