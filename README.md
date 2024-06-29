<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

🚀 Introducing flutter_prevent_screenshot: Enhance Your Flutter App's Security! 📱

I'm thrilled to announce the release of our new Flutter package, flutter_prevent_screenshot! This package is designed to help developers protect sensitive information in their Flutter applications by preventing screenshots and screen recordings on both Android and iOS platforms.
## Features
Block Screenshots: Prevent users from capturing screenshots of your app's content.
Block Screen Recording: Disable screen recording to protect sensitive information.

## Platform Support
Compatible with both Android and iOS.

## Getting started

Add the following dependency to your pubspec.yaml file:

```flutter
flutter_prevent_screenshot: ^0.0.1+4
import 'package:flutter_prevent_screenshot/flutter_prevent_screenshot.dart';
```

## Usage

```dart
final _noScreenshot = NoScreenshot.instance;
turnoffScreenshot() async {
  final result = await _noScreenshot.screenshotOff();
  if (kDebugMode) {
    print(result);
  }
}

@override
void initState() {
  turnoffScreenshot();
  super.initState();
}

@override
void dispose() {
  _noScreenshot.screenshotOn();

  super.dispose();
}

@override
Widget build(BuildContext context) {
  return Container(
    color: Colors.transparent,
  );
}
```

## Additional information

contribute to the package, how to file issues, what response they can expect
from the package authors, and more.

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas.