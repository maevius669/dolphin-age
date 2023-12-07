# Dolphin Context Menu for age

A KDE Dolphin context menu for automating the encryption of files & folders using [age encryption tool](https://github.com/FiloSottile/age).

## Installation

> Just run the ***install.sh*** file.

## What this script does

> * Checks if [age](https://github.com/FiloSottile/age) & [curl](https://github.com/curl/curl) are installed and if not it tries to install them.
> * Copies the context menu entries to ***~/.local/share/kservices5/ServiceMenus***
> * Adds MIME type for .age extension.
> * Generates and saves your age key in ***~/.age-key*** so it can be used by the context menu

## License

[MIT](https://choosealicense.com/licenses/mit/)
