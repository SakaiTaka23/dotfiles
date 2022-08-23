if [ $(uname) != "Darwin" ] ; then
	echo "Not MacOS!"
	exit 0
fi

# ファインダーの拡張子表示
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# バッテリーのパーセンテージ表示
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
# タップでクリック判定
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool "true"
# トラックパッドの方向
defaults write -g com.apple.swipescrolldirection -bool "false"
# 文字を勝手に大文字にしない
defaults write -g NSAutomaticCapitalizationEnabled -bool false
# 勝手に綴を直さない
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
# .DS_Store周り
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool "true"
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool "true"
# クラッシュレポートは送らない
defaults write com.apple.CrashReporter DialogType none
