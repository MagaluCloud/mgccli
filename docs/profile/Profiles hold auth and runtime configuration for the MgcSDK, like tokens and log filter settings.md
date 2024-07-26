# Profiles hold auth and runtime configuration for the MgcSDK, like tokens and log filter settings.
Users can create as many profiles as they choose to. Auth and config operations will affect only the
current profile, so users can alter and switch between profiles without loosing the previous configuration

## Usage:
```bash
Usage:
  ./mgc profile [flags]
  ./mgc profile [command]
```

## Product catalog:
- Commands:
- create      Creates a new profile
- delete      Deletes the profile with the specified name
- get         Get current profile.
- list        List all available profiles
- set         Sets profile to be used

## Other commands:
- Additional Commands:
- select      call "list", prompt selection and then "set"

## Flags:
```bash
Flags:
  -h, --help   help for profile
```

