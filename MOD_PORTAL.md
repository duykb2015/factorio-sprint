# Mod Portal fields

Title: Sprint
Internal name: sprint
Summary: Bật/tắt chạy nhanh không giới hạn bằng Ctrl trái. Mặc định x4 tốc độ di chuyển hiện tại, bao gồm bonus từ trang bị và mod khác. Chỉnh hệ số ngay trong game, không cần khởi động lại. / Toggle unlimited sprint with Left Ctrl. Default 4x your current movement speed, including equipment and other mod bonuses. Adjust the multiplier instantly in-game without restarting.
Category: Utilities
Tags: Cheats (movement speed gameplay advantage). Do not select Character: that tag is for appearance changes.
License: MIT
Source Code URL: https://github.com/duykb2015/factorio-sprint
Release: sprint_0.1.2.zip
Thumbnail: Included as thumbnail.png inside the ZIP.
Gallery: Optional; use the thumbnail artwork or real gameplay screenshots later.

## Description (paste the following)

# Sprint

## Tiếng Việt

Chạy nhanh khắp nhà máy với hệ số tùy chỉnh, không giới hạn thể lực.

- Nhấn **Ctrl trái** để bật/tắt chạy nhanh. Có thể đổi phím trong Cài đặt > Điều khiển > Mod.
- Mặc định **x4 tốc độ di chuyển hiện tại**.
- Nhấp trái nút **Sprint** để bật/tắt. **Nhấp phải** để mở phần chỉnh tốc độ, nhập hệ số **1–100**, rồi nhấn **Áp dụng**.
- Thay đổi có hiệu lực ngay, không cần khởi động lại. Mỗi người chơi có cấu hình riêng.
- Không tốn thể lực, nhiên liệu hoặc năng lượng. Chỉ áp dụng khi nhân vật đi bộ.

### Tương thích

Sprint nhân tốc độ di chuyển sau khi game tính các bonus từ nhân vật, phe, trang bị như Exoskeleton và mod khác như RPGsystem. Mod chỉ gỡ phần tăng tốc của chính nó khi tắt.

Các mod ghi đè hoặc tính lại hệ số tốc độ theo cách phi tuyến vẫn có thể xung đột; chưa bảo đảm tương thích với mọi bộ mod.

### Phím điều khiển

Mod dùng cơ chế nhấn để bật/tắt. API custom input không cung cấp sự kiện thả phím để thực hiện giữ phím chạy một cách tin cậy. **Shift + F** không kích hoạt Sprint. Ctrl trái vẫn được dùng trong các tổ hợp phím gốc; nếu bị kích hoạt ngoài ý muốn, hãy đổi sang phím riêng hoặc **Ctrl + G**.

### Ngôn ngữ

Hỗ trợ tiếng Việt, Anh, Trung giản thể, Tây Ban Nha, Đức và Nga. Giao diện theo ngôn ngữ của Factorio. Mô tả chính và mô tả trong bản Anh/Việt hiển thị tiếng Việt trước, tiếng Anh sau.

### Gỡ mod

Tắt chạy nhanh và lưu game trước khi gỡ mod để loại bỏ phần bonus Sprint khỏi nhân vật.

## English

Cross your factory faster with an unlimited, configurable sprint.

- Press **Left Ctrl** to toggle sprint on or off. You can remap the control, for example to **Ctrl + G**.
- Default sprint speed: **4x** your current movement speed.
- Click the **Sprint** button to toggle. **Right-click** it to open the multiplier controls, enter a value from **1 to 100**, and click **Apply**.
- Change speed instantly while playing: no startup setting and no restart.
- Each player has their own multiplier and toggle state.
- No stamina, fuel or energy cost. Only affects your character on foot.

### Compatibility

Designed to work with speed bonuses from other mods, including RPGsystem, and equipment such as Exoskeletons. Sprint measures the resulting character movement speed and multiplies that result, rather than inserting a fixed bonus before other bonuses.

Mods that overwrite or nonlinearly recalculate the same running-speed modifier may conflict. Full mod-pack compatibility is not guaranteed.

### Controls

This release uses toggle sprint. Factorio custom inputs do not expose a key-release event for reliable hold-to-sprint. Shift shortcuts such as Shift + F do not trigger sprint. Left Ctrl participates in vanilla Ctrl shortcuts; remap Sprint to a dedicated key or Ctrl + G alone if unwanted toggles occur.

### Removing the mod

Turn sprint off and save before uninstalling, so its contribution is removed from your character.




### Languages

English, Vietnamese, Simplified Chinese, Spanish, German and Russian. The UI follows Factorio's language setting. Main and English/Vietnamese locale descriptions show Vietnamese first, followed by English.


