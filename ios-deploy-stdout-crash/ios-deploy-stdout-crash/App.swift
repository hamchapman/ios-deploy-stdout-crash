import SwiftUI

@main
struct iOSDeployCrashApp: App {

    init() {
        FileHandle.standardOutput.write("lol".data(using: .utf8)!)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
