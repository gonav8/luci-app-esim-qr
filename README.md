# luci-app-esim-qr (v1.1)

Enhanced eSIM Management for OpenWRT 25.12.2 (APK format).

## New Features
- **Profile Management**: List all profiles with provider names, ICCID, and status.
- **One-Click Actions**: Activate, Deactivate, or Delete profiles directly from LuCI.
- **QR Code Upload**: Upload eSIM QR images directly from LuCI; the system automatically extracts the LPA code and adds the profile via `lpac`.
- **Modem Monitoring**: Integrated with `luci-app-3ginfo-lite` for real-time modem status.
- **Data Usage**: Basic data usage monitoring and limit setup.
- **WAN Integration**: Optimized for modems like Quectel RM520N-EU.

## UI Preview
### eSIM Manager
![eSIM Manager](ui_sketch_manager.png)

### QR Upload
![QR Upload](ui_sketch_upload.png)

## Requirements
- `lpac`
- `zbar-tools`
- `libcurl`
- `vnstat`
- `luci-app-3ginfo-lite` (forked in your account)

## Installation

### Method 1: Build from Source (Recommended)
1. Add both `luci-app-esim-qr` and `luci-app-3ginfo-lite` to your OpenWRT SDK `package` directory.
2. Select them in `make menuconfig` under `LuCI -> 3. Applications`.
3. Build the packages: `make package/luci-app-esim-qr/compile`.
4. Install the resulting `.apk` files.

### Method 2: Manual Installation via SSH
If you have the `.apk` files, you can install them and their dependencies directly:

1. **Update package list**:
   ```bash
   apk update
   ```
2. **Install dependencies**:
   ```bash
   apk add lpac zbar-tools libcurl vnstat
   ```
3. **Download and install the package**:
   ```bash
   wget https://github.com/gonav8/luci-app-esim-qr/releases/download/v1.1-beta/luci-app-esim-qr_1.1-1_all.apk
   apk add ./luci-app-esim-qr_1.1-1_all.apk
   ```
4. **Install the monitoring tool (Optional)**:
   ```bash
   wget https://github.com/gonav8/luci-app-3ginfo-lite/releases/latest/download/luci-app-3ginfo-lite_all.apk
   apk add ./luci-app-3ginfo-lite_all.apk
   ```

## Credits
- [lpac](https://github.com/estkme-group/lpac)
- [4IceG/luci-app-3ginfo-lite](https://github.com/4IceG/luci-app-3ginfo-lite)
