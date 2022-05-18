import SwiftUI

struct VistaContenedor: View {
    @EnvironmentObject var mostrar: VMVistaPrincipal
    @EnvironmentObject var ubic: VMVistaMapas
    
    var body: some View {
        ZStack{
            VStack{
                //Implentación del tabBar para la navegación
                TabView{
                    VistaMapa(radio: mostrar.radio)
                        .tabItem{
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.white)
                        }
                    
                    VistaLista(lat: ubic.lat, long: ubic.long, radio: mostrar.radio)
                        .tabItem{
                            Image(systemName: "list.dash")
                                .foregroundColor(.white)
                        }
                }
                .accentColor(.black)
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
