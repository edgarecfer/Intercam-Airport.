import SwiftUI

@main
struct Intercam_AirportApp: App {
    var body: some Scene {
        //Propagando en el proyecto la variable para poder observar los cambios
        let mostrar = VMVistaPrincipal()
        WindowGroup {
            ContentView().environmentObject(mostrar)
        }
    }
}
