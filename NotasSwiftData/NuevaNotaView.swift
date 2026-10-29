import SwiftUI
import SwiftData

struct NuevaNotaView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    @State private var titulo = ""
    @State private var contenido = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Título", text: $titulo)
                TextEditor(text: $contenido).frame(minHeight: 200)
            }
            .navigationTitle("Nueva nota")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        context.insert(Nota(titulo: titulo, contenido: contenido))
                        dismiss()
                    }
                    .disabled(titulo.isEmpty)
                }
            }
        }
    }
}
