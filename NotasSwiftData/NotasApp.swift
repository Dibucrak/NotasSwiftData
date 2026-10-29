import SwiftUI
import SwiftData

@main
struct NotasApp: App {
    var body: some Scene {
        WindowGroup {
            ListaNotasView()
        }
        .modelContainer(for: Nota.self)
    }
}
