# Create a Volume for the currently authenticated tenant.

## Usage:
```bash
The Volume can be used when it reaches the "available" state and "completed"
 status.
```

## Product catalog:
- #### Rules
- - The Volume name must be unique; otherwise, the creation will be disallowed.
- - The Volume type must be available to use.

## Other commands:
- #### Notes
- - Utilize the **block-storage volume-types list** command to retrieve a list
- of all available Volume Types.
- - Verify the state and status of your Volume using the
- **block-storage volume get --id [uuid]** command".

## Flags:
```bash
Usage:
  ./mgc block-storage volumes create [flags]
```

