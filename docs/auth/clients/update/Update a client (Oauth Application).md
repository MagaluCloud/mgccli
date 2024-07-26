# Update a client (Oauth Application)

## Usage:
```bash
Usage:
  ./mgc auth clients update [id] [name] [description] [redirect-uris] [icon] [access-token-expiration] [always-require-login] [client-privacy-term-url] [terms-of-use] [audiences] [backchannel-logout-session-enabled] [backchannel-logout-uri] [oidc-audiences] [refresh-token-custom-expires-enabled] [refresh-token-expiration] [reason] [flags]
```

## Product catalog:
- Examples:
- ./mgc auth clients update --access-token-expiration=7200 --audiences="public" --description="Client description" --name="Client Name" --refresh-token-expiration=15778476

## Other commands:
- Flags:
- --access-token-expiration integer        Access token expiration (in seconds)
- --always-require-login                   Must ignore active Magalu ID session and always require login
- --audiences string                       Client audiences (separated by space)
- --backchannel-logout-session-enabled     Client requires backchannel logout session
- --backchannel-logout-uri string          Backchannel logout URI
- --client-privacy-term-url string         URL to privacy term
- --description string                     Description of new client
- -h, --help                                   help for update
- --icon string                            URL for client icon
- --id string                              UUID of client (required)
- --name string                            Name of new client
- --oidc-audiences string                  Audiences for ID token
- --reason string                          Note to inform the reason for creating the client. Will help with the application approval process
- --redirect-uris string                   Redirect URIs (separated by space)
- --refresh-token-custom-expires-enabled   Use custom value for refresh token expiration
- --refresh-token-expiration integer       Custom refresh token expiration value (in seconds)
- --terms-of-use string                    URL to terms of use

## Flags:
```bash
Global Flags:
      --cli.show-cli-globals   Show all CLI global flags on usage text
```

