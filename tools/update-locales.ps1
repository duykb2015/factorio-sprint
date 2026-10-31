$ErrorActionPreference='Stop'
$root=Split-Path $PSScriptRoot -Parent
$vi='Bật/tắt chạy nhanh không giới hạn bằng Ctrl trái. Mặc định x4 tốc độ di chuyển hiện tại, bao gồm bonus từ trang bị và mod khác. Chỉnh hệ số ngay trong game, không cần khởi động lại.'
$en='Toggle unlimited sprint with Left Ctrl. Default 4x your current movement speed, including equipment and other mod bonuses. Adjust the multiplier instantly in-game without restarting.'
$infoPath=Join-Path $root 'sprint/info.json'
$info=Get-Content $infoPath -Raw | ConvertFrom-Json
$info.version='0.1.2'
$info.description=$vi+"`n`n"+$en
$info | ConvertTo-Json -Depth 5 | Set-Content $infoPath -Encoding utf8
$translations=@{
'en'=@(($vi+'\n\n'+$en),'Toggle sprint','Sprint: __1__','ON','OFF','Left-click to toggle sprint. Right-click to show/hide speed controls. Default hotkey: Left Ctrl. Remap in Settings > Controls > Mods.','Speed multiplier','Apply','Enter a multiplier from 1 to 100.')
'vi'=@(($vi+'\n\n'+$en),'Bật/tắt chạy nhanh','Chạy nhanh: __1__','BẬT','TẮT','Nhấp trái để bật/tắt chạy nhanh. Nhấp phải để hiện/ẩn phần chỉnh tốc độ. Phím mặc định: Ctrl trái. Đổi phím trong Cài đặt > Điều khiển > Mod.','Hệ số tốc độ','Áp dụng','Nhập hệ số từ 1 đến 100.')
'zh-CN'=@('按左 Ctrl 开启或关闭无限冲刺。默认速度为当前移动速度的 4 倍，包含装备和其他模组的加成。可在游戏内即时调整倍率，无需重启。','切换冲刺','冲刺：__1__','开启','关闭','左键切换冲刺，右键显示或隐藏速度设置。默认快捷键：左 Ctrl。可在设置 > 控制 > 模组中修改。','速度倍率','应用','请输入 1 到 100 之间的倍率。')
'es-ES'=@('Activa o desactiva el esprint ilimitado con Ctrl izquierdo. Por defecto, multiplica por 4 tu velocidad actual, incluidas las bonificaciones del equipo y otros mods. Ajusta el multiplicador al instante sin reiniciar.','Activar/desactivar esprint','Esprint: __1__','ACTIVADO','DESACTIVADO','Clic izquierdo para alternar el esprint. Clic derecho para mostrar u ocultar los controles de velocidad. Tecla predeterminada: Ctrl izquierdo. Puedes cambiarla en Ajustes > Controles > Mods.','Multiplicador de velocidad','Aplicar','Introduce un multiplicador entre 1 y 100.')
'de'=@('Unbegrenzten Sprint mit der linken Strg-Taste ein- oder ausschalten. Standardmäßig 4-fache aktuelle Bewegungsgeschwindigkeit, einschließlich Boni durch Ausrüstung und andere Mods. Den Faktor direkt im Spiel ohne Neustart ändern.','Sprint umschalten','Sprint: __1__','AN','AUS','Linksklick schaltet Sprint um. Rechtsklick zeigt oder verbirgt die Geschwindigkeitseinstellungen. Standardtaste: linke Strg-Taste. Änderbar unter Einstellungen > Steuerung > Mods.','Geschwindigkeitsfaktor','Anwenden','Gib einen Faktor zwischen 1 und 100 ein.')
'ru'=@('Включайте и выключайте неограниченный спринт левым Ctrl. По умолчанию текущая скорость передвижения увеличивается в 4 раза с учётом бонусов снаряжения и других модов. Меняйте множитель прямо в игре без перезапуска.','Переключить спринт','Спринт: __1__','ВКЛ','ВЫКЛ','Левая кнопка мыши переключает спринт. Правая показывает или скрывает настройки скорости. Клавиша по умолчанию: левый Ctrl. Изменить её можно в Настройки > Управление > Моды.','Множитель скорости','Применить','Введите множитель от 1 до 100.')
}
foreach($lang in $translations.Keys) {
 $t=$translations[$lang]
 $dir=Join-Path $root "sprint/locale/$lang"
 New-Item -ItemType Directory -Force $dir | Out-Null
 $lines=@('[mod-name]','sprint=Sprint','[mod-description]',('sprint='+$t[0]),'[controls]',('sprint-toggle-ctrl='+$t[1]),'[sprint]',('toggle='+$t[2]),('on='+$t[3]),('off='+$t[4]),('hint='+$t[5]),('multiplier='+$t[6]),('apply='+$t[7]),('invalid='+$t[8]))
 $lines | Set-Content (Join-Path $dir 'sprint.cfg') -Encoding utf8
}

