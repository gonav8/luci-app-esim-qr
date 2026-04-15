# luci-app-esim-qr

Simple LuCI page to upload eSIM QR code image, decode with `zbar`, and add profile via `lpac`. Designed for OpenWRT 25.12.2 and newer (APK package format).

## Features
- Upload eSIM QR code image directly from LuCI.
- Automated decoding using `zbarimg`.
- Profile download using `lpac`.
- Optimized for 5G travel routers (e.g., Quectel RM520N-EU).

## Requirements
- `lpac`
- `zbar-tools`
- `libcurl`

## Installation (OpenWRT 25.12.2+)
Since OpenWRT 25.12.2 uses the APK package manager, you can install the `.apk` package directly if available, or build it using the OpenWRT SDK.

### Building with OpenWRT SDK
1. Clone this repo into your SDK `package` directory:
   ```bash
   git clone https://github.com/gonav8/luci-app-esim-qr package/luci-app-esim-qr
   ```
2. Select the package in `make menuconfig` (LuCI -> 3. Applications -> luci-app-esim-qr).
3. Build the package:
   ```bash
   make package/luci-app-esim-qr/compile
   ```
4. Find the `.apk` file in `bin/packages/.../luci/`.

## Configuration
The script defaults to using `/dev/ttyUSB2` for AT commands. You can modify this in `/usr/lib/luci/luci-app-esim-qr/qr-upload.sh` if your modem uses a different port.

## Credits
- [lpac](https://github.com/estkme-group/lpac)
- OpenWRT Community
