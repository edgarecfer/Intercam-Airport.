import SwiftUI

struct VistaLista: View {
    @StateObject var lista = VMVistaLista()
    var lat: Double
    var long: Double
    var radio: Double
    
    var body: some View {
        ZStack{
            Color("GrisFondo")
            
            if lista.aeropuertos.isEmpty {
                ProgressView()
            } else {
                VStack(alignment: .leading, spacing: 10){
                    ScrollView{
                        ForEach(lista.aeropuertos, id:\.name){item in
                            Lista(nombre: item.name ?? "NA", codigo: item.alpha2countryCode ?? "NA", latitud: item.latitude ?? 0.0, longitud: item.longitude ?? 0.0)
                        }
                        Spacer()
                    }
                }
                .padding()
            }
        }
        .onAppear{
            lista.recuperarAeropuertos(lat: lat, long: long, radio: radio)
        }
    }
}

//Estructura de la vista en lista
struct Lista: View {
    let nombre: String
    let codigo: String
    let latitud: Double
    let longitud: Double
    
    var body: some View {
        VStack{
            Text("\(nombre) (\(codigo))")
                .bold()
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Latitud: \(latitud)")
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Longitud: \(longitud)")
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding()
        .background(.white)
        .cornerRadius(10)
    }
}
