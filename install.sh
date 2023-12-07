#!/bin/bash

check() {
    command -v $1 &> /dev/null
}

# Check if Curl is installed
if ! check "curl"; then
    echo "Installing Curl.."
    if command -v apt &> /dev/null; then
        sudo apt update && sudo apt install -y curl
    elif command -v pacman &> /dev/null; then
        sudo pacman -Sy --noconfirm curl
    elif command -v yum &> /dev/null || command -v dnf &> /dev/null; then
        sudo yum -y install curl
    else
        echo "System not supported. Install curl manually."
        exit 1
    fi
fi

# Check if age is installed
if ! check "age"; then
    echo "Installing age encryption tool.."
    sudo curl -s https://api.github.com/repos/FiloSottile/age/releases/latest | grep "browser_download_url.*linux-amd64.tar.gz" | cut -d : -f 2,3 | tr -d \" | wget -qi - -O - | tar -xz -C /tmp
    sudo mv /tmp/age/age /usr/bin/
    sudo mv /tmp/age/age-keygen /usr/bin/
    echo "age installed successfully."
fi

# Copy files to their respective directories.
# .desktop files are copied to ServiceMenus dir for context menu on Dolphin
# and an XML file to MIME dir for files with .age extension to distinguish with an icon and a description.
echo "Copying files.."
cp age-encrypt.desktop ~/.local/share/kservices5/ServiceMenus/
cp age-decrypt.desktop ~/.local/share/kservices5/ServiceMenus/
xdg-mime install --mode user --novendor age-mime.xml

# Create age key for current user at home folder .age-key
echo "Generating age key.."
mkdir -p ~/.age-key && age-keygen -o ~/.age-key/"$(whoami).age-key"
sed -n '2p' ~/.age-key/"$(whoami).age-key" > ~/.age-key/"$(whoami).pk" && sed 's/# public key: //' ~/.age-key/"$(whoami).pk" > ~/.age-key/"$(whoami)" && rm -f ~/.age-key/"$(whoami).pk" && sed -i '1i\# '$(whoami) ~/.age-key/"$(whoami)"
echo "Installation completed."
