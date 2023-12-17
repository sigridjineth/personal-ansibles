#!/bin/bash

# Settings for macOS
#
# TODO: make it run automatically on setup, for now it's just a dump file
#
# For now run:
# curl -sSL https://raw.githubusercontent.com/sitek94/mac-setup/main/macos.todo.sh | bash

# Credits:
# https://github.com/kentcdodds/dotfiles/blob/master/.macos
# https://github.com/mathiasbynens/dotfiles/blob/main/.macos

echo "Setting up macOS..."
# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off > /dev/null

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# # Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# # Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# # Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# # Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false


# ###############################################################################
# # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
# ###############################################################################

# # Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# # Enable full keyboard access for all controls
# # (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# # Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# # Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10


# ###############################################################################
# # Screen                                                                      #
# ###############################################################################

# # Require password immediately after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

# # Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# # Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


# ###############################################################################
# # Finder                                                                      #
# ###############################################################################

# # Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons
# defaults write com.apple.finder QuitMenuItem -bool true

# # Finder: disable window animations and Get Info animations
# # defaults write com.apple.finder DisableAllAnimations -bool true

# # Set Desktop as the default location for new Finder windows
# # For other paths, use `PfLo` and `file:///full/path/here/`
# defaults write com.apple.finder NewWindowTarget -string "PfDe"
# defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

# # Show icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
# defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# # Finder: show hidden files by default
# #defaults write com.apple.finder AppleShowAllFiles -bool true

# # Finder: show all filename extensions
# defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# # Finder: show status bar
# defaults write com.apple.finder ShowStatusBar -bool true

# # Finder: show path bar
# defaults write com.apple.finder ShowPathbar -bool true

# # Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# # Keep folders on top when sorting by name
# defaults write com.apple.finder _FXSortFoldersFirst -bool true

# # When performing a search, search the current folder by default
# defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# # Disable the warning when changing a file extension
# defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# # Enable spring loading for directories
# defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# # Reduce the spring loading delay for directories
# defaults write NSGlobalDomain com.apple.springing.delay -float 0.2

# # Avoid creating .DS_Store files on network or USB volumes
# defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
# defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# # Disable disk image verification
# # defaults write com.apple.frameworks.diskimages skip-verify -bool true
# # defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# # defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# # Automatically open a new Finder window when a volume is mounted
# defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
# defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
# defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

# # Show item info near icons on the desktop and in other icon views
# # /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# # /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# # /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# # Show item info to the right of the icons on the desktop
# # /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# # Enable snap-to-grid for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# # Increase grid spacing for icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# # Increase the size of icons on the desktop and in other icon views
# # /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
# # /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist
# # /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 56" ~/Library/Preferences/com.apple.finder.plist

# # Use column view in all Finder windows by default
# # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`, `Nlsv`
# defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# # Disable the warning before emptying the Trash
# defaults write com.apple.finder WarnOnEmptyTrash -bool false

# # Enable AirDrop over Ethernet and on unsupported Macs running Lion
# # defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# # Show the ~/Library folder
# # chflags nohidden ~/Library

# # Show the /Volumes folder
# # sudo chflags nohidden /Volumes

# # Remove Dropbox’s green checkmark icons in Finder
# # file=/Applications/Dropbox.app/Contents/Resources/emblem-dropbox-uptodate.icns
# # [ -e "${file}" ] && mv -f "${file}" "${file}.bak"

# # Expand the following File Info panes:
# # “General”, “Open with”, and “Sharing & Permissions”
# # defaults write com.apple.finder FXInfoPanesExpanded -dict \
# #   General -bool true \
# #   OpenWith -bool true \
# #   Privileges -bool true


# ###############################################################################
# # Dock, Dashboard, and hot corners                                            #
# ###############################################################################

# # Enable highlight hover effect for the grid view of a stack (Dock)
# defaults write com.apple.dock mouse-over-hilite-stack -bool true

# # Set the icon size of Dock items to 16 pixels
defaults write com.apple.dock tilesize -int 16

# # Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# # Minimize windows into their application’s icon
defaults write com.apple.dock minimize-to-application -bool true

# # Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# # Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# # Wipe all (default) app icons from the Dock
# # This is only really useful when setting up a new Mac, or if you don’t use
# # the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# # Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# # Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# # Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1

# # Don’t group windows by application in Mission Control
# # (i.e. use the old Exposé behavior instead)
# # defaults write com.apple.dock expose-group-by-app -bool false

# # Disable Dashboard
# # defaults write com.apple.dashboard mcx-disabled -bool true

# # Don’t show Dashboard as a Space
# # defaults write com.apple.dock dashboard-in-overlay -bool true

# # Don’t automatically rearrange Spaces based on most recent use
# # defaults write com.apple.dock mru-spaces -bool false

# # Remove the auto-hiding Dock delay
# # defaults write com.apple.dock autohide-delay -float 0
# # Remove the animation when hiding/showing the Dock
# # defaults write com.apple.dock autohide-time-modifier -float 0

# # Automatically hide and show the Dock
# defaults write com.apple.dock autohide -bool true

# # Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true

# # Disable the Launchpad gesture (pinch with thumb and three fingers)
# defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

prompt_context() {
  # Custom (Random emoji)
  emojis=("🐿H" "🤍" "💛" "🐰" "🐥" "🦋" "🌈" "🍻" "🚀" "🍒" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "Sigrid ${emojis[$RAND_EMOJI_N]} "
}

alias python=python3

# Download the image
curl -o ~/Desktop/sigrid-howtoletgo.jpg "https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/476dbc149934431.62f0fa707f422.jpg"

# Set the downloaded image as the desktop background
osascript -e 'tell application "System Events" to tell every desktop to set picture to "~/Desktop/sigrid-howtoletgo.jpg"'

# Scroll direction: Unnatural (content tracks finger movement)
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo -e "- Trackpad, mouse, keyboard, Bluetooth accessories, and input …"

# Trackpad: enable tap to click for this user and for the login screen
# https://github.com/bramus/freshinstall/blob/master/steps/1.macos-settings.sh
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Trackpad: enable right click with two fingers
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.AppleMultitouchTrackpad TrackpadRightClick -bool true

# Function to set the default web browser which is not working at the moment
# https://github.com/raycast/script-commands/blob/master/commands/system/default-browser-front-most-app.applescript
# https://www.felixparadis.com/posts/how-to-set-the-default-browser-from-the-command-line-on-a-mac/


# Reset Launchpad, but keep the desktop wallpaper intact
# find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

# Add iOS & Watch Simulator to Launchpad
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
# sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

# Add a spacer to the left side of the Dock (where the applications are)
#defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'
# Add a spacer to the right side of the Dock (where the Trash is)
#defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}'

# 🌶️ Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 1048576 is ⌘ I think
# Top left screen corner → Desktop
# defaults write com.apple.dock wvous-tl-corner -int 4
# defaults write com.apple.dock wvous-tl-modifier -int 1048576
# Top right screen corner → Desktop
# defaults write com.apple.dock wvous-tr-corner -int 4
# defaults write com.apple.dock wvous-tr-modifier -int 1048576
# Bottom left screen corner → Start screen saver
# defaults write com.apple.dock wvous-bl-corner -int 5
# defaults write com.apple.dock wvous-bl-modifier -int 1048576
# Bottom right screen corner → Put display to sleep
# defaults write com.apple.dock wvous-br-corner -int 10
# defaults write com.apple.dock wvous-br-modifier -int 1048576
