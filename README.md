# Flutter Pigeon Demo

Demo Flutter app dùng **Pigeon** để giao tiếp type-safe giữa Dart và native code (Android/iOS), với use case đọc phần trăm pin thiết bị.

## Mục tiêu

- Khai báo API một lần trong `pigeons/messages.dart`.
- Generate code cho 3 phía: Dart, Kotlin, Swift.
- Gọi native API từ Flutter qua class `BatteryApi`.

## Kiến trúc nhanh

```text
Flutter UI (lib/main.dart)
  -> BatteryApi (lib/src/messages.g.dart)
    -> Pigeon channel
      -> Android: BatteryApiImpl (Kotlin)
      -> iOS: BatteryApiImpl (Swift)
```

## Cấu trúc file chính

- `pigeons/messages.dart`: nguồn định nghĩa API/data model cho Pigeon.
- `lib/src/messages.g.dart`: Dart code generated.
- `android/app/src/main/kotlin/com/example/flutter_pigeon_demo/Messages.g.kt`: Kotlin code generated.
- `ios/Runner/Messages.g.swift`: Swift code generated.
- `android/app/src/main/kotlin/com/example/flutter_pigeon_demo/BatteryApiImpl.kt`: implement host API Android.
- `android/app/src/main/kotlin/com/example/flutter_pigeon_demo/MainActivity.kt`: đăng ký API Android vào binary messenger.
- `ios/Runner/AppDelegate.swift`: implement + đăng ký API iOS.
- `lib/main.dart`: UI demo và nút gọi `getBatteryInfo()`.

## Yêu cầu

- Flutter SDK (khuyến nghị stable mới nhất).
- Xcode (cho iOS).
- Android Studio / Android SDK (cho Android).

## Cài đặt và chạy

```bash
flutter pub get
flutter run
```

## Generate lại code Pigeon

Khi chỉnh sửa `pigeons/messages.dart`, chạy:

```bash
dart run pigeon --input pigeons/messages.dart
```

Lệnh này sẽ cập nhật:

- `lib/src/messages.g.dart`
- `android/app/src/main/kotlin/com/example/flutter_pigeon_demo/Messages.g.kt`
- `ios/Runner/Messages.g.swift`

## Lưu ý triển khai native

- Android trả `Long` cho `BatteryInfo.level`.
- iOS trả `Int64` cho `BatteryInfo.level`.
- Nếu gặp lỗi kiểu dữ liệu ở iOS, đảm bảo mapping đúng `Int64` trong `AppDelegate.swift`.
- Nếu gặp lỗi `Cannot find type 'BatteryApi' in scope` trên iOS, kiểm tra `Messages.g.swift` đã được add vào target `Runner` trong Xcode chưa.

## Demo flow

1. Mở app.
2. Nhấn **Get Battery Level**.
3. App gọi `BatteryApi.getBatteryInfo()` và hiển thị `% pin` từ native.
