import SwiftUI

struct vistaPrincipal: View {
    @StateObject var vPrincipal = VMVistaPrincipal()
    
    var body: some View {
        VStack{
            Spacer()
            
            Text("AIRPORT")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 40))
            Text("finder")
                .bold()
                .foregroundColor(.white)
                .font(.system(size: 40))
            
            Spacer()
            
            Text(String(format: "%.0f", vPrincipal.valorSlider))
                .bold()
                .foregroundColor(Color("GrisOscuro"))
                .font(.system(size: 40))
            
            Slider(value: $vPrincipal.valorSlider, in: 1...1000, step: 1)
                .accentColor(Color("Azul"))
            
            Text("RADIUS IN KM")
                .foregroundColor(Color("GrisClaro"))
            Spacer()
            
            Button(action: {
                print("Buscar")
            }){
                Text("SEARCH")
                    .bold()
                    .foregroundColor(Color.white)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("Azul"))
            .cornerRadius(20)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color("GrisFondo"))
    }
}

struct vistaPrincipal_Previews: PreviewProvider {
    static var previews: some View {
        vistaPrincipal()
    }
}
