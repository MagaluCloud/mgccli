# Change the Volume Type of an existing Volume for the currently
 authenticated tenant.

## Usage:
```bash
The Volume retype will be completed when the Volume status returns to
 "completed".
```

## Product catalog:
- #### Rules
- - The Volume state must be "available".
- - The Volume status must be "completed" or "retype_error".
- - The new Volume Type must belong to the same region as the Volume.

## Other commands:
- #### Notes
- - Utilize the **block-storage volume list** command to retrieve a list of all
- Volumes and obtain the ID of the Volume you want to retype.
- - Utilize the **block-storage volume-types list** command to retrieve a list of
- all Volume Types and obtain the ID of the Volume Type you want to use.

## Flags:
```bash
Usage:
  ./mgc block-storage volumes retype [id] [flags]
```

