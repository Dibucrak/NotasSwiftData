import SwiftUI
import SwiftData

struct EditarNotaView: View {
    @Bindable var nota: Nota

    var body: some View {
        Form {
            TextField("Título", text: $nota.titulo)
            TextEditor(text: $nota.contenido).frame(minHeight: 200)
        }
        .navigationTitle("Editar nota")
        .onChange(of: nota.titulo) { nota.fechaModificacion = .now }
        .onChange(of: nota.contenido) { nota.fechaModificacion = .now }
    }
}
