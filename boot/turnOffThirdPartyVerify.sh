#关闭第三方软件验证
sudo spctl --master-disable
defaults write com.apple.LaunchServices LSQuarantine -bool false