import SwiftUI

struct VistaContenedor: View {
    @EnvironmentObject var mostrar: VMVistaPrincipal
    
    var body: some View {
        ZStack{
            VStack{
                //Implentación del tabBar para la navegación
                TabView{
                    VistaMapa()
                        .tabItem{
                            Label("Mapa", systemImage: "person")
                        }
                    
                    VistaLista()
                        .tabItem{
                            Label("Lista", systemImage: "person")
                        }
                }
            }
            
            VStack{
                HStack{
                    Button(action: {
                        mostrar.avanzar.toggle()
                    }){
                        Image(systemName: "arrow.left.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(Color("Azul"))
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct VistaContenedor_Previews: PreviewProvider {
    static var previews: some View {
        VistaContenedor()
    }
}