library flutter_prevent_screenshot;

import 'disable_screenshots_platform_interface.dart';

class FlutterPreventScreenshot implements FlutterPreventScreenshotPlatform {
  final _instancePlatform = FlutterPreventScreenshotPlatform.instance;

  FlutterPreventScreenshot._();

  /// Made `NoScreenshot` class a singleton
  static FlutterPreventScreenshot get instance => FlutterPreventScreenshot._();

  /// Return `true` if screenshot capabilities has been successfully disabled
  /// or is currently disabled and `false` otherwise. throw `UnmimplementedError` if not implement
  @override
  Future<bool> screenshotOff() {
    return _instancePlatform.screenshotOff();
  }

  /// Return `true` if screenshot capabilities has been successfully enable
  /// or is currently enable and `false` otherwise. throw `UnmimplementedError` if not implement
  @override
  Future<bool> screenshotOn() {
    return _instancePlatform.screenshotOn();
  }

  ///Return `true` if screenshot capabilities has been successfully toggle from it previous state and
  ///`false` if the attempt to toggle failed. throw `UnmimplementedError` if not implement
  @override
  Future<bool> toggleScreenshot() {
    return _instancePlatform.toggleScreenshot();
  }
}
