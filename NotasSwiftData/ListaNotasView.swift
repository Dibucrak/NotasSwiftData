import SwiftUI
import SwiftData

struct ListaNotasView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Nota.fechaModificacion, order: .reverse)
    private var notas: [Nota]
    @State private var mostrarNueva = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(notas) { nota in
                    NavigationLink(value: nota) {
                        VStack(alignment: .leading) {
                            Text(nota.titulo).font(.headline)
                            Text(nota.contenido)
                                .lineLimit(1)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
                .onDelete(perform: eliminar)
            }
            .navigationTitle("Notas")
            .navigationDestination(for: Nota.self) { nota in
                EditarNotaView(nota: nota)
            }
            .toolbar {
                Button("Nueva", systemImage: "plus") { mostrarNueva = true }
            }
            .sheet(isPresented: $mostrarNueva) { NuevaNotaView() }
        }
    }

    private func eliminar(en offsets: IndexSet) {
        for i in offsets { context.delete(notas[i]) }
    }
}
