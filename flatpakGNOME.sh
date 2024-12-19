#!/bin/bash

# Definición de colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

# Capturar el tiempo de inicio
start_time=$(date +%s)

echo -e "${CYAN}🚀 Initiating configuration ...${NC}"

echo -e "${CYAN}🚀 Upgrading System ...${NC}"
sudo apt update
sudo apt install nala -y
sudo nala upgrade -y
echo -e "${GREEN}🚀 System upgraded ...${NC}"


echo -e "${CYAN}🚀 Installing flastpak support ...${NC}"

sudo nala update
sudo nala install flatpak gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo -e "${GREEN}🚀 Flastpak integrated ...${NC}"



echo -e "${CYAN}🚀 Installing Flastpak applications ...${NC}"

## Add Water: Keep Firefox in fashion ❌❌
#flatpak install flathub dev.qwery.AddWater

## AdwSteamGtk: Give Steam the Adwaita treatment
flatpak install flathub io.github.Foldex.AdwSteamGtk -y

## Alpaca: Chat with local AI models ✨
#flatpak install flathub com.jeffser.Alpaca -y

## Anki: flatpak install flathub net.ankiweb.Anki
flatpak install flathub net.ankiweb.Anki -y

## Apostrophe: Edit Markdown in style ✨
#flatpak install flathub org.gnome.gitlab.somas.Apostrophe -y

## Audacity: Audacity is the world's most popular audio editing and recording app
flatpak install flathub org.audacityteam.Audacity -y

## Audio Sharing: Share your computer audio
flatpak install flathub de.haeckerfelix.AudioSharing -y

## Shortwave: Listen to internet radio
flatpak install flathub de.haeckerfelix.Shortwave -y

## Bitwarden: A secure and free password manager for all of your devices
flatpak install flathub com.bitwarden.desktop -y

## Blanket: Listen to ambient sounds
flatpak install flathub com.rafaelmardojai.Blanket -y

## BleachBit: Cleans files to free disk space and to maintain privacy
flatpak install flathub org.bleachbit.BleachBit -y

## Bottles: Run Windows Software
flatpak install flathub com.usebottles.bottles -y

## Boxes: Virtualization made simple
flatpak install flathub org.gnome.Boxes -y

## Bruno: Fast and Git-Friendly API Client
flatpak install flathub com.usebruno.Bruno -y

## Calculator: Perform arithmetic, scientific or financial calculations ✨
#flatpak install flathub org.gnome.Calculator -y

## Cameractrls: Camera controls for Linux
flatpak install flathub hu.irl.cameractrls -y

## Calibre: The one stop solution to all your e-book needs
flatpak install flathub com.calibre_ebook.calibre -y

## Cartridges: Launch all your games ✨
#flatpak install flathub page.kramo.Cartridges

## Celeste: Sync your cloud files
flatpak install flathub com.hunterwittenborn.Celeste -y

## Cheese: Take photos and videos with your webcam, with fun graphical effects
flatpak install flathub org.gnome.Cheese -y

## Cozy:Listen to audio books
flatpak install flathub com.github.geigi.cozy -y

## Czkawka: Multi functional app to find duplicates, empty folders, similar images, broken files etc.
flatpak install flathub com.github.qarmin.czkawka -y

## DBeaver Community: Universal Database Manager
flatpak install flathub io.dbeaver.DBeaverCommunity -y

## Disk Usage Analyzer: Check folder sizes and available disk space ✨
#flatpak install flathub org.gnome.baobab -y

## Discord: Messaging, voice and video client ❌❌
#flatpak install flathub com.discordapp.Discord

## DL: language lessons: Unofficial desktop client for the language-learning app Duolingo ❌❌
#flatpak install flathub ro.go.hmlendea.DL-Desktop

## draw.io: Create and share diagrams
flatpak install flathub com.jgraph.drawio.desktop -y

## Drawing: Edit screenshots or memes ❌❌
#flatpak install flathub com.github.maoschanz.drawing

### easyeffects for better microphone and speackers: Audio Effects for PipeWire Applications
flatpak install flathub com.github.wwmm.easyeffects -y

## Echo: Ping websites (NU) ❌❌
#flatpak install flathub io.github.lo2dev.Echo

## Extension Manager by Matthew Jakeman: Browse, install, and manage GNOME Shell Extensions
flatpak install flathub com.mattjakeman.ExtensionManager

## Extensions by The GNOME Project: Manage your GNOME Extensions ❌❌
#flatpak install flathub org.gnome.Extensions

## fan-control: Control your fans with different behaviors (BI) ❌❌
#flatpak install flathub io.github.wiiznokes.fan-control

## Ferdium: Messenger for the desktop
flatpak install flathub org.ferdium.Ferdium -y

## Filelight: Show disk usage and delete unused files
flatpak install flathub org.kde.filelight -y

## Firefox: Fast, Private & Safe Web Browser ✨
#flatpak install flathub org.mozilla.firefox -y

## Flatseal: Manage Flatpak permissions
flatpak install flathub com.github.tchx84.Flatseal -y

## Flatsweep: Flatpak leftover cleaner
flatpak install flathub io.github.giantpinkrobots.flatsweep -y

## Foliate: Read e-books in style
flatpak install flathub com.github.johnfactotum.Foliate -y

## Frog: Extract text from images
flatpak install flathub com.github.tenderowl.frog -y

## Gapless: Play your music elegantly
flatpak install flathub com.github.neithern.g4music -y

## Gear Lever: Manage AppImages
flatpak install flathub it.mijorus.gearlever -y

## guiscrcpy: Android Screen Mirroring Software
flatpak install flathub in.srev.guiscrcpy -y

## HandBrake: Video Transcoder ✨
#flatpak install flathub fr.handbrake.ghb -y

## Heroic Games Launcher: An Open Source Epic Games, GOG and Amazon Prime Games Launcher. ✨
#flatpak install flathub com.heroicgameslauncher.hgl

## Impression: Create bootable drives
flatpak install flathub io.gitlab.adhami3310.Impression -y

## Insomnia: Open-source API client (not really open) ❌
#flatpak install flathub rest.insomnia.Insomnia


## Kate: Advanced Text Editor (Already installed) ❌❌
#flatpak install flathub org.kde.kate

## Kdenlive: Video editor
flatpak install flathub org.kde.kdenlive -y

## Keypunch: Practice your typing skills
flatpak install flathub dev.bragefuglseth.Keypunch -y

## Komikku: Discover and read manga & comics
flatpak install flathub info.febvre.Komikku -y

## LibreOffice: The LibreOffice productivity suite
flatpak install flathub org.libreoffice.LibreOffice -y

## LocalSend: Share files to nearby devices
flatpak install flathub org.localsend.localsend_app -y

## LosslessCut: Save space by quickly and losslessly trimming video and audio files ✨
#flatpak install flathub no.mifi.losslesscut

## Lutris: Video game preservation platform (Not yet) ❌❌
#flatpak install flathub net.lutris.Lutris

## Memorize flaskcards - Not really usefull ❌❌
#flatpak install flathub io.github.david_swift.Flashcards

## Mattermost: An open source platform for developer collaboration (it needs a server) ❌❌
#flatpak install flathub com.mattermost.Desktop

## Metadata Cleaner: View and clean metadata in files
flatpak install flathub fr.romainvigier.MetadataCleaner -y

## Mission Center Logo: Monitor system resource usage (Looks like windows, can't be pinned) ❌❌
#flatpak install flathub io.missioncenter.MissionCenter

## MongoDB Compass: The MongoDB GUI
flatpak install flathub com.mongodb.Compass -y

## Mousai: Identify songs in seconds
flatpak install flathub io.github.seadve.Mousai -y

## Newsflash: Keep up with your feeds
flatpak install flathub io.gitlab.news_flash.NewsFlash -y

## Notesnook: A fully open source & end-to-end encrypted note taking alternative to Evernote ❌❌
#flatpak install flathub com.notesnook.Notesnook

## OBS Studio: Live stream and record videos
flatpak install flathub com.obsproject.Studio -y

## Obsidian: Markdown-based knowledge base
flatpak install flathub md.obsidian.Obsidian -y

## OnionShare: Securely and anonymously share files, host websites, and chat with friends ✨
#flatpak install flathub org.onionshare.OnionShare -y

## OpenDeck: Use stream controllers, need the hardware ❌
#flatpak install flathub me.amankhanna.opendeck

## Peek: Simple screen recorder with an easy to use interface
flatpak install flathub com.uploadedlobster.peek -y

## Pinta: Edit images and paint digitally ❌❌
#flatpak install flathub com.github.PintaProject.Pinta

## Piper: Gaming mouse configuration utility (My mouse is not compatible, it cant be detected) ❌❌
#flatpak install flathub org.freedesktop.Piper

## Pitivi: Create and edit your own movies
flatpak install flathub org.pitivi.Pitivi -y

## Planify: Forget about forgetting things ✨
#flatpak install flathub io.github.alainm23.planify

## ProtonPlus: Modern compatibility tools manager (not yet) ❌❌
#flatpak install flathub com.vysp3r.ProtonPlus

## Resources: Keep an eye on system resources
flatpak install flathub net.nokyan.Resources -y

## Shortwave: Listen to internet radio
flatpak install flathub de.haeckerfelix.Shortwave -y

## Spider: Install Web Apps with Ease ❌❌
#flatpak install flathub io.github.zaedus.spider

## Spotube:Freedom of music
flatpak install flathub com.github.KRTirtho.Spotube -y

## Steam: Launcher for the Steam software distribution service
flatpak install flathub com.valvesoftware.Steam -y

## StreamController: Control your Elgato Stream Decks with plugin support ❌❌
#flatpak install flathub com.core447.StreamController

## SyncThingy: SyncThingy = Syncthing + simple tray indicator ❌❌
#flatpak install flathub com.github.zocker_160.SyncThingy

## Text Pieces: Developer's scratchpad ✨
#flatpak install flathub io.gitlab.liferooter.TextPieces

## Thunderbird: Thunderbird is a free and open source email, newsfeed, chat, and calendaring client ❌❌
#flatpak install flathub org.mozilla.Thunderbird

## VLC: VLC media player, the open-source multimedia player
flatpak install flathub org.videolan.VLC -y

## VSCodium: VSCodium is a free and open source, telemetry-less code editing
flatpak install flathub com.vscodium.codium -y

## Zeal: Documentation browser. (I have internet) ❌❌
#flatpak install flathub org.zealdocs.Zeal

flatpak update -y

echo -e "${GREEN}🎉 Flastpak applications installed ...${NC}"


# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$(( end_time - start_time ))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Total execution time: ${total_time} seconds.${NC}"
