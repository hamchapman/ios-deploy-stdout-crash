# ios-deploy stdout Crash Reproduction

## Prerequisites

- Physical iOS device (successfully reproduced with iPhone 11 Pro, iPhone 12, iPhone 13 Pro)
- [`ios-deploy`](https://github.com/ios-control/ios-deploy) (successfully reproduced with version 1.12.2 and a manually built version from tip of `master` branch)
- Xcode (successfully reproduced with 14.3.1)

## Steps to Reproduce

1. Clone this repository
2. Run `make build`
3. Run `ios-deploy` with the `--justlaunch` flag, so a command like this:

```sh
ios-deploy \
    --id "00008030-000618513E20802E" \
    --bundle "ios/DerivedData/Build/Products/Debug-iphoneos/ios-deploy-stdout-crash.app" \
    --justlaunch
```

## Commentary

This seems to be related to the timing between when:

- the process detaches (because of the `--justlaunch` flag), and
- the iOS app first tries to print to stdout (see `App.swift`)

The app will not crash if you do any of the following:

- comment out the line where the app tries to write to stdout, or
- launch the app via a method other than `ios-deploy`
- launch the app via `ios-deploy` without the `--justlaunch` flag
- use a build of `ios-deploy` that adds a `time.sleep(10)` call above [this line](https://github.com/ios-control/ios-deploy/blob/33f282645fe8325ac3e8269c9d7928cbd9cafa43/src/scripts/lldb.py#L78)
