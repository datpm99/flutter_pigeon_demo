import Flutter
import UIKit

private class BatteryApiImpl: BatteryApi {
  func getBatteryInfo() throws -> BatteryInfo {
    return BatteryInfo(level: 80)
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
