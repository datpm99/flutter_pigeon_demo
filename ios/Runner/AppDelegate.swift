import Flutter
import UIKit

private class BatteryApiImpl: BatteryApi {
  func getBatteryInfo() throws -> BatteryInfo {
      let device = UIDevice.current
      device.isBatteryMonitoringEnabled = true
      if device.batteryState == UIDevice.BatteryState.unknown {
          return BatteryInfo(level: -1)
      } else {
          return BatteryInfo(level: Int64(device.batteryLevel * 100))
      }
  }
}

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    if let controller = window?.rootViewController as? FlutterViewController {
      BatteryApiSetup.setUp(
        binaryMessenger: controller.binaryMessenger,
        api: BatteryApiImpl()
      )
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
