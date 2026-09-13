import 'package:pigeon/pigeon.dart';

class BatteryRequest {}

class BatteryReply {
  final int level;

  BatteryReply({required this.level});
}

@HostApi()
abstract class BatteryApi {
  @async
  BatteryReply getBatteryLevel(BatteryRequest request);
}
