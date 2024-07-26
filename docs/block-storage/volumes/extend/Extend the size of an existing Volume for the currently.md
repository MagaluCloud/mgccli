# Extend the size of an existing Volume for the currently
 authenticated tenant.

## Usage:
```bash
The Volume extension will be completed when the Volume status returns to
 "completed".
```

## Product catalog:
- #### Rules
- - The Volume state must be "available".
- - The Volume status must be "completed" or "extend_error".
- - The new Volume size must be larger than the current size.

## Other commands:
- #### Notes
- - Utilize the block-storage volume list command to retrieve a list of all
- Volumes and obtain the ID of the Volume you want to extend.
- - Storage quotas are managed internally. If the operation fails due to quota
- restrictions, please contact our support team for assistance.

## Flags:
```bash
Usage:
  ./mgc block-storage volumes extend [id] [flags]
```

