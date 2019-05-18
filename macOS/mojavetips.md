# macOS Mojave

## 深色主题下使用浅色窗口

```bash
defaults write -g NSRequiresAquaSystemAppearance -bool Yes
```

注销重新登录即可

恢复

```bash
defaults write -g NSRequiresAquaSystemAppearance -bool No
```
