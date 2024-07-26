# List all objects from a bucket

## Usage:
```bash
Usage:
  ./mgc object-storage objects list [dst] [flags]
```

## Product catalog:
- Examples:
- ./mgc object-storage objects list --dst="bucket1" --max-items=1000

## Other commands:
- Flags:
- --continuation-token string   Token of result page to continue from
- --dst uri                     Path of the bucket to list objects from (required)
- --filter array(object)        File name pattern to include or exclude
- Use --filter=help for more details
- -h, --help                        help for list
- --max-items integer           Limit of items to be listed (min: 1) (default 1000)
- --recursive                   List folders and subfolders

## Flags:
```bash
Global Flags:
      --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
      --cli.show-cli-globals   Show all CLI global flags on usage text
      --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
      --server-url uri         Manually specify the server to use
      --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)
```

