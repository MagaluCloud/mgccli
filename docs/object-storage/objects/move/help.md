# Moves one object from a source to a destination.
It can be either local or remote but not both local (Local -> Remote, Remote -> Local, Remote -> Remote)

## Usage:
```bash
Usage:
  ./mgc object-storage objects move [src] [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects move --dst="s3://my-bucket/test.txt" --src="./hello.txt"

## Other commands:
- Flags:
- --dst uri   Destination to put the file into (required)
- -h, --help      help for move
- --src uri   A file to move to the Destination (required)

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

