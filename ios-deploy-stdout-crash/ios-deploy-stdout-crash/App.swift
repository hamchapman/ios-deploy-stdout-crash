import SwiftUI

@main
struct iOSDeployCrashApp: App {

    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            print("This will crash when launching with ios-deploy --justlaunch!")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
