#!/bin/sh

# Ask for permissions
sudo -v


# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Open Finders in list view.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Hella fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Set up Safari for development.
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Privacy: don’t send search queries to Apple
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false



# Activity Monitor

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sets columns for all tabs
# defaults read com.apple.ActivityMonitor "UserColumnsPerTab v5.0" -dict \
#   '0' '( Command, CPUUsage, CPUTime, Threads, PID, UID, Ports )' \
#   '1' '( Command, ResidentSize, Threads, Ports, PID, UID,  )' \
#   '2' '( Command, PowerScore, 12HRPower, AppSleep, UID, powerAssertion )' \
#   '3' '( Command, bytesWritten, bytesRead, Architecture, PID, UID, CPUUsage )' \
#   '4' '( Command, txBytes, rxBytes, PID, UID, txPackets, rxPackets, CPUUsage )'

# Set sort column
# defaults write com.apple.ActivityMonitor UserColumnSortPerTab -dict \
#   '0' '{ direction = 0; sort = CPUUsage; }' \
#   '1' '{ direction = 0; sort = ResidentSize; }' \
#   '2' '{ direction = 0; sort = 12HRPower; }' \
#   '3' '{ direction = 0; sort = bytesWritten; }' \
#   '4' '{ direction = 0; sort = rxBytes; }'
defaults write com.apple.ActivityMonitor SortDirection -int 0

# Show Data in the Disk graph (instead of IO)
defaults write com.apple.ActivityMonitor DiskGraphType -int 1

# Show Data in the Network graph (instead of packets)
defaults write com.apple.ActivityMonitor NetworkGraphType -int 1

