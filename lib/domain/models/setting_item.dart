import 'package:freezed_annotation/freezed_annotation.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if User was not serializable, we could skip it.

part 'setting_item.freezed.dart';

@freezed
class SettingItem with _$SettingItem {
  const factory SettingItem(String icon, String title) = _SettingItem;
}
