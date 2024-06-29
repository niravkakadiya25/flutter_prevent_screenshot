import Flutter
import UIKit
import ScreenProtectorKit


public class SwiftFlutterPreventScreenshotPlugin: NSObject, FlutterPlugin {
    private var screenProtectorKit: ScreenProtectorKit? = nil
    private static var channel: FlutterMethodChannel? = nil
    static private var preventScreenShot: Bool = false

    init(screenProtectorKit: ScreenProtectorKit) {
        self.screenProtectorKit = screenProtectorKit
    }


    public static func register(with registrar: FlutterPluginRegistrar) {
        SwiftFlutterPreventScreenshotPlugin.channel = FlutterMethodChannel(name: "com.app_master.disable_screenshots", binaryMessenger: registrar.messenger())
        let window = UIApplication.shared.delegate?.window

        let screenProtectorKit = ScreenProtectorKit(window: window as? UIWindow)
        screenProtectorKit.configurePreventionScreenshot()

        let instance = SwiftFlutterPreventScreenshotPlugin(screenProtectorKit: screenProtectorKit)
        registrar.addMethodCallDelegate(instance, channel: SwiftFlutterPreventScreenshotPlugin.channel!)
        registrar.addApplicationDelegate(instance)
    }


    public func applicationWillResignActive(_ application: UIApplication) {
        if SwiftFlutterPreventScreenshotPlugin.preventScreenShot == true {
            screenProtectorKit?.enabledPreventScreenshot()
        } else if SwiftFlutterPreventScreenshotPlugin.preventScreenShot == false {
            screenProtectorKit?.disablePreventScreenshot()
        }
    }

    public func applicationDidBecomeActive(_ application: UIApplication) {
        if SwiftFlutterPreventScreenshotPlugin.preventScreenShot == true {
            screenProtectorKit?.enabledPreventScreenshot()
        } else if SwiftFlutterPreventScreenshotPlugin.preventScreenShot == false {
            screenProtectorKit?.disablePreventScreenshot()
        }
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if (call.method == "screenshotOff") {
            SwiftFlutterPreventScreenshotPlugin.preventScreenShot = false
            shotOff()

        } else if (call.method == "screenshotOn") {
            SwiftFlutterPreventScreenshotPlugin.preventScreenShot = true
            shotOn()
        } else if (call.method == "toggleScreenshot") {
            SwiftFlutterPreventScreenshotPlugin.preventScreenShot = !SwiftFlutterPreventScreenshotPlugin.preventScreenShot;
            SwiftFlutterPreventScreenshotPlugin.preventScreenShot ? shotOn() : shotOff()
        }
        result(true)
    }

    private func shotOff() {
        screenProtectorKit?.enabledPreventScreenshot()
    }

    private func shotOn() {

        screenProtectorKit?.disablePreventScreenshot()
    }

    deinit {
        screenProtectorKit?.removeAllObserver()
    }
}
