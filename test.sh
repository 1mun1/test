#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    [ -f ./RobloxPlayer.zip ] && rm ./RobloxPlayer.zip
    curl "https://setup.rbxcdn.com/mac/version-3b0126187faf4c64-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading libFBICIA"
    curl -LJO "https://github.com/xgladius/studious-octo-computing-machine/raw/main/libFBICIA.dylib"

    echo -e "Downloading insert_dylib"
    curl -LJO "https://github.com/xgladius/studious-octo-computing-machine/raw/main/insert_dylib"

    chmod +x "./insert_dylib"

    echo -e "Patching Roblox"
    mv ./libFBICIA.dylib "/Applications/Roblox.app/Contents/MacOS/libFBICIA.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/libFBICIA.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"

    chmod +x "/Applications/Roblox.app/Contents/MacOS/libFBICIA.dylib"

    echo -e "Install Complete! libFBICIA by xgladius"
}

main
