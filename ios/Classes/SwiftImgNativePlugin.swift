import Flutter
import UIKit

public class SwiftImgNativePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "img_native", binaryMessenger: registrar.messenger())
    let instance = SwiftImgNativePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
