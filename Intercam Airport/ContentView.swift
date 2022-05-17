import SwiftUI

struct ContentView: View {
    @EnvironmentObject var mostrar: VMVistaPrincipal
    
    var body: some View {
        //Hacemos uso de la variable propagada para cambiar de vistas
        if mostrar.avanzar{
            VistaContenedor()
        } else {
            vistaPrincipal()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
