# Ask for the administrator password upfront.
sudo -v

xcode-select --install &

##############################
### Software Installations ###
##############################

echo '*** install homebrew ***'
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

echo '*** install brew cask ***'
brew install caskroom/cask/brew-cask

echo '*** install node/npm ***'
brew install node

echo '*** install mongo ***'
brew install mongo

echo '*** install tree ***'
brew install tree

echo '*** install wget ***'
brew install wget

echo '*** install nodemon ***'
npm install -g nodemon

echo '*** install git ***'
brew install git

echo '*** install google chrome ***'
brew cask install google-chrome

echo '*** install dropbox ***'
brew cask install dropbox

echo '*** install transmission ***'
brew cask install transmission

echo '*** iterm2 ***'
brew cask install iterm2

echo '*** install slack ***'
brew cask install slack

echo '*** install skype ***'
brew cask install skype

echo '*** install sublime text 3 ***'
brew cask install sublime-text

echo '*** install poker stars ***'
brew cask install pokerstars

echo '*** install steam ***'
brew cask install steam

echo '*** install league of legends ***'
brew cask install league-of-legends

echo '*** install open emu ***'
brew cask install openemu

echo '*** install alfred ***'
brew cask install alfred

echo '*** install flux ***'
brew cask install flux

echo '*** install hyperswitch ***'
brew cask install hyperswitch

echo '*** install keka ***'
brew cask install keka

echo '*** install scroll reverser ***'
brew cask install scroll-reverser

echo '*** install razer synapse ***'
brew cask install razer-synapse

echo '*** install spotify ***'
brew cask install spotify

echo '*** install spotify notifications ***'
brew cask install spotify-notifications

echo '*** install spotifree ***'
brew cask install spotifree

echo '*** install vlc ***'
brew cask install vlc

echo '*** install ohmyzsh ***'
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"



#########################
### Computer Settings ###
#########################

# Set computer name
sudo scutil --set ComputerName "avisamloff"
sudo scutil --set HostName "avisamloff"
sudo scutil --set LocalHostName "avisamloff"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "avisamloff"

# Set standby delay to 24 hours
sudo pmset -a standbydelay 86400

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Show the ~/Library folder
chflags nohidden ~/Library

# Remove Dropbox’s green checkmark icons in Finder
file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
[ -e "${file}" ] && mv -f "${file}" "${file}.bak"

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.2

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Add the keyboard shortcut ⌘ + Enter to send an email in Mail.app
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" -string "@\\U21a9"

# Disable prompt when quitting iterm2
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Menu bar: hide the Time Machine and User icons
for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
  defaults write "${domain}" dontAutoLoad -array \
    "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
    "/System/Library/CoreServices/Menu Extras/User.menu"
done

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# hide spotlight icon
sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

# expand save prompt
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# quit printer app when there are no pending jobs
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# save to disk instead of iCloud by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# check for updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# disable smart quotes and smart dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# prevent Photos from opening when inserting external media
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# disable hibernate
sudo pmset -a hibernatemode 0

# disable sudden motion sensor
sudo pmset -a sms 0

# increase Bluetooth sound quality
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# disable press-and-hold for special keys
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# increase key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# disable auto-brightness on keyboard and screen
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Keyboard Enabled" -bool false
sudo defaults write /Library/Preferences/com.apple.iokit.AmbientLightSensor "Automatic Display Enabled" -bool false

# create folder for screenshots on desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop/screenshots"

# enable hidpi mode
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# enable font rendering on non-apple displays
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# show full path in finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# disable warning when changing file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# disable .DS_Store on network drives
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# enable quick look text selection
defaults write com.apple.finder QLEnableTextSelection -bool true

# enable snap to grid for desktop and icon view
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# set column view as default
defaults write com.apple.finder FXPreferredViewStyle Clmv

# set dock icons to 36px
defaults write com.apple.dock tilesize -int 36

# disable focus ring
defaults write NSGlobalDomain NSUseAnimatedFocusRing -bool false

# reformat copying email addresses
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#disable gatekeeper
sudo spctl --master-disable

# disable npm progress bar (doubles install speed)
npm set progress=false

# set tap-to-click
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1

# change crash reporter to notification
defaults write com.apple.CrashReporter UseUNC 1

# download sublime package manager
curl https://sublime.wbond.net/Package%20Control.sublime-package > /Users/avisamloff/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/Package\ Control.sublime-package

# download .gitconfig
curl -O https://raw.githubusercontent.com/nicolashery/mac-dev-setup/master/.gitconfig > ~/.gitconfig

# create global .gitignore
echo '
# Folder view configuration files
.DS_Store
Desktop.ini

# Thumbnail cache files
._*
Thumbs.db

# Files that might appear on external disks
.Spotlight-V100
.Trashes

# Compiled Python files
*.pyc

# Compiled C++ files
*.out

# Application specific files
venv
node_modules
.sass-cache
' > ~/.gitignore

# set git user info and credentials
git config --global user.name "Avi Samloff"
git config --global user.email "avi.samloff@gmail.com"
git config --global credential.helper osxkeychain


# update PATH
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

# set sublime packages
echo '
{
  "bootstrapped": true,
  "in_process_packages":
  [
  ],
  "installed_packages":
  [
    "BracketHighlighter",
    "Color Highlighter",
    "GitGutter",
    "HTML-CSS-JS Prettify",
    "Package Control",
    "Predawn",
    "SideBarEnhancements",
    "SublimeLinter",
    "SublimeLinter-jshint",
    "Theme - Spacegray"
  ]
}
' > /Users/avisamloff/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

# Disable local Time Machine snapshots
sudo tmutil disablelocal


#############################
### Transmission Settings ###
#############################

# setup folder for incomplete torrents
mkdir -p ~/Downloads/Incomplete
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

# hide donate message
defaults write org.m0k.transmission WarningDonate -bool false

# hide legal warning
defaults write org.m0k.transmission WarningLegal -bool false

# auto resize window
defaults write org.m0k.transmission AutoSize -bool true

# setting block-list
defaults write org.m0k.transmission EncryptionRequire -bool true
defaults write org.m0k.transmission BlocklistAutoUpdate -bool true
defaults write org.m0k.transmission BlocklistNew -bool true
defaults write org.m0k.transmission BlocklistURL -string "http://john.bitsurge.net/public/biglist.p2p.gz"



#############################
### Sublime Text Settings ###
#############################

# set sublime as default text editor in git
git config --global core.editor "subl -n -w"

#set sublime as default text editor os-wide
defaults write com.apple.LaunchServices/com.apple.launchservices.secure LSHandlers -array-add \
'{LSHandlerContentType=public.plain-text;LSHandlerRoleAll=com.sublimetext.3;}'
