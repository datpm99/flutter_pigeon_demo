import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/messages.g.dart',
    kotlinOut:
        'android/app/src/main/kotlin/com/example/flutter_pigeon_demo/Messages.g.kt',
    swiftOut: 'ios/Runner/Messages.g.swift',
  ),
)
class BatteryInfo {
  BatteryInfo({required this.level});

  final int level;
}

@HostApi()
abstract class BatteryApi {
  BatteryInfo getBatteryInfo();
}
