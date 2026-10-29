import SwiftData
import Foundation

@Model
final class Nota {
    var titulo: String
    var contenido: String
    var fechaCreacion: Date
    var fechaModificacion: Date

    init(titulo: String, contenido: String = "") {
        self.titulo = titulo
        self.contenido = contenido
        self.fechaCreacion = .now
        self.fechaModificacion = .now
    }
}
