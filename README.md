# Dolphin Context Menu for age

A KDE Dolphin context menu for automating the encryption of files & folders using [age encryption tool](https://github.com/FiloSottile/age).

## Installation

> Just run the ***install.sh*** file.

## What this script does

> * Checks if [age](https://github.com/FiloSottile/age) & [curl](https://github.com/curl/curl) are installed and if not it tries to install them.
> * Copies the context menu entries to ***~/.local/share/kservices5/ServiceMenus***
> * Adds MIME type for .age extension.
> * Generates and saves your AGE key in ***~/.age-key*** so it can be used by the context menu

## Screenshots

### Encryption
![encrypt](https://github.com/maevius669/dolphin-age/assets/16948665/37b6bf44-3383-48af-9c85-db2bc169894c)
### Decryption
![decrypt](https://github.com/maevius669/dolphin-age/assets/16948665/40a9da8a-b6a7-4c74-98e2-0b605753a5f1)
## License

[MIT](https://choosealicense.com/licenses/mit/)
