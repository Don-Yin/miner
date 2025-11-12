# Dropbox Ignore Command
to make Dropbox ignore a folder/file and all its contents:

```bash
# Set ignore attribute
xattr -w com.dropbox.ignored 1 /path/to/folder

# Restart Dropbox to apply changes
killall Dropbox 2>/dev/null; sleep 1; open -a Dropbox
```

**Verify:**
```bash
xattr -l /path/to/folder | grep dropbox.ignored
```

**Remove ignore (if needed):**
```bash
xattr -d com.dropbox.ignored /path/to/folder
```

**Notes:**
- works on both files and folders
- folders: ignores all current and future contents recursively
- dropbox restart is required for changes to take effect
- no sync icon/green checkmark = working correctly
- **IMPORTANT:** does NOT remove already synced files from Dropbox cloud
- already synced files remain in Dropbox - must delete manually from dropbox.com if needed

