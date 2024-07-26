# Get ACL information for the specified object

## Usage:
```bash
Usage:
  ./mgc object-storage objects acl get [dst] [flags]
```

## Product catalog:
- Flags:
- --dst uri   The full object URL to get the ACL information from (required)
- -h, --help      help for get

## Other commands:
- Global Flags:
- --chunk-size integer     Chunk size to consider when doing multipart requests. Specified in Mb (range: 8 - 5120) (default 8)
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use
- --workers integer        Number of routines that spawn to do parallel operations within object_storage (min: 1) (default 5)

## Flags:
```bash
** object = "id:" (require tenant ID) - Example:id="a4900b57-7dbb-4906-b7e8-efed938e325c"
```

