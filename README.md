# Sprint

## Tiếng Việt

Mod cho Factorio 2.1. Nhấn **Ctrl trái** để bật/tắt chạy nhanh không giới hạn, mặc định **x4 tốc độ hiện tại**. Nhấp phải nút Sprint để mở phần chỉnh hệ số **1–100**, sau đó nhấn **Áp dụng**. Cấu hình có hiệu lực ngay, riêng cho từng người chơi.

Có tính bonus từ trang bị, phe và các mod tốc độ dạng cộng thêm như RPGsystem. Các mod ghi đè tốc độ vẫn có thể xung đột. Shift + F không kích hoạt Sprint; Ctrl trái vẫn có thể kích hoạt khi dùng tổ hợp Ctrl khác. Có thể đổi phím trong phần điều khiển của mod.

Cài đặt: chép `sprint_0.1.3.zip` vào `%APPDATA%\Factorio\mods` và khởi động lại game. Tắt Sprint và lưu trước khi gỡ mod.

Hỗ trợ **Việt, Anh, Trung giản thể, Tây Ban Nha, Đức và Nga**, theo ngôn ngữ game. Lịch sử thay đổi ở [CHANGELOG.md](CHANGELOG.md) và `sprint/changelog.txt` (được đóng gói trong mod).

## English

Factorio 2.1 mod. Press **Left Ctrl** to toggle unlimited sprint. Rebind under Settings > Controls > Mods.

- Default multiplier: **4x** your current character movement speed.
- Top-left Sprint button: left-click toggles sprint; right-click opens speed controls.
- Enter **1-100** and click Apply. Takes effect immediately, per player, with no restart.
- Walking only. Vehicles and remote controllers are excluded.
- Additive character bonuses (including RPGsystem), force bonuses, equipment and terrain are included in the engine speed measurement.

Shift shortcuts such as Shift + F no longer trigger sprint. Ctrl is also a vanilla modifier: pressing Left Ctrl for a Ctrl shortcut can toggle sprint. Rebind to Ctrl + G alone or a dedicated key if this is inconvenient. True hold/release sprint is not implemented because custom inputs expose press events, not release state.

Compatibility: designed for speed bonuses from other mods; sprint scales the resulting engine movement speed and removes only its own contribution. This is not a universal compatibility guarantee: mods that overwrite the same modifier or clamp/recalculate it nonlinearly can conflict. Extremely large multipliers are subject to engine movement limits. Turn sprint off and save before uninstalling to remove its persisted modifier.

## Install

Copy `sprint_0.1.3.zip` into `%APPDATA%\Factorio\mods`, then enable Sprint and restart Factorio to load the new mod. Runtime multiplier changes do not require restart. The package script reads info.json and includes the required version in both the ZIP filename and its internal folder, ready for installation and Mod Portal upload.

## Build and test

Run `./tools/package.ps1` from this repository. Output: `sprint_<version>.zip` (currently `sprint_0.1.3.zip`). Git tracks source; build output is ignored.

An engine scenario is included in source under `sprint/scenarios/sprint-test`. It checks measured 4x scaling, character/force/equipment bonuses, additive changes while active, live multiplier changes, disable/restore, vehicle exclusion and destroyed characters. Run with an isolated mod directory using `--test-scenario sprint/sprint-test --test-ticks 2 --disable-audio` and check for `SPRINT TESTS PASSED` in the log. No automated interactive GUI/keyboard or full mod-pack session has been validated.

## Artwork

Thumbnail generated with the built-in ImageGen tool. Prompt: Original engineer in weathered orange armored spacesuit sprinting with orange speed trails, dark industrial factory and gear backdrop; square, high contrast, readable at small sizes; no text or logos.





## Localization

Supported locale folders: en, vi, zh-CN, es-ES, de, ru. UI language follows Factorio. Main and English/Vietnamese descriptions use Vietnamese first, then English. Translation sources are maintained in tools/update-locales.ps1. See CHANGELOG.md for release history.



