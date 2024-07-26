# List all images in container registry repository

## Usage:
```bash
Usage:
  ./mgc container-registry images list [registry-id] [repository-name] [flags]
```

## Product catalog:
- Flags:
- --control.limit integer    Limit (min: 1)
- --control.offset integer   Offset (min: 0)
- --control.sort string      Fields to use as reference to sort. (pattern: (^[\w-]+:(asc|desc)(,[\w-]+:(asc|desc))*)?$) (default "pushed_at:desc")
- --expand array(string)     You can get more detailed info about: ['tags_details', 'extra_attr', 'manifest_media_type', 'media_type']
- -h, --help                     help for list
- --registry-id uuid         Container Registry's UUID. (required)
- --repository-name string   Repository's name. (required)
- -v, --version                  version for list

## Other commands:
- Global Flags:
- --cli.show-cli-globals   Show all CLI global flags on usage text
- --env enum               Environment to use (one of "pre-prod" or "prod") (default "prod")
- --region enum            Region to reach the service (one of "br-mgl1", "br-ne1" or "br-se1") (default "br-se1")
- --server-url uri         Manually specify the server to use

## Flags:
```bash

```

