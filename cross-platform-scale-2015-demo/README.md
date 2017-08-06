# Cross Platform Demo

This sample shows how to build applications in both iOS and Android
with Buck with shared native code.

## Installing

Make sure you've [installed Buck](https://buckbuild.com/setup/install.html),
and if you want to use the Android code, make sure you've [setup your
environment properly](https://buckbuild.com/setup/install.html#locate-android-sdk).

## Building

You can build the demo applications from the command line!

### Android

For Android, build the demo with:

    buck install -r demo_app_android

### iOS

    buck install -r demo_app_ios

## Project Generation

You can create projects for IntelliJ (Android) and Xcode (iOS) so you
can use your IDE to make changes to your project still.  This is
unnecessary if you happen to be using [Nuclide](http://nuclide.io/).

### Android

    buck project demo_app_android

If you are on Windows, you'll want to run:

    buck project demo_app_android --experimental-ij-generation

### iOS

    buck project demo_app_ios

### React Native (iOS only)

To run demo:
1. `buck project demo_app_ios`
1. `open ios/BuckDemoApp.xcworkspace`
1. Workaround: You'll need to change your application's build settings in Xcode so that `Build Active Architecture Only` is set to `Yes`. Not sure of the implications of this for release builds. Be warned.
1. `npm install` (assumes you have Node installed)
1. Start React Native packager: `npm start`
1. Run app.

Steps for linking React Native:
1. Build an Xcode project created from `react-native init`
1. Find the DerivedData folder for the project. It will be something like /Users/<your-user>/Library/Developer/Xcode/DerivedData/<some-project>/Build/Products/Debug-iphonesimulator
1. Copy the `include` folder and all the .a files to your Buck project. You'll find it under the `react-native` folder in this repo.
1. Workaround: Copy the .a files into a new `ios/react-native` folder. You'll otherwise get otherwise when generating Xcode project via Buck. If anyone knows how to not require this workaround, please let me know.
1. Create `BUCK` file per `react-native/BUCK` file in this repo. Note the `apple_library` must be named `React` for headers like `<React/...>` to work.
1. In your App's `BUCK` file add `'//react-native:React'` to `deps`.
1. Generate project via `buck project demo_app_ios`.
1. `open ios/BuckDemoApp.xcworkspace`
1. Workaround: You'll need to change your application's build settings in Xcode so that `Build Active Architecture Only` is set to `Yes`. Not sure of the implications of this for release builds. Be warned.