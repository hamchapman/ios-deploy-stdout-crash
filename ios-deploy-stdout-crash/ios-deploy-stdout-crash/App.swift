import SwiftUI

@main
struct iOSDeployCrashApp: App {

    init() {
        try_to_print_to_stdout()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
