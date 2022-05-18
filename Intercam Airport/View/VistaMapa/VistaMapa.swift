import SwiftUI
import MapKit

struct VistaMapa: View {
    @StateObject var mapa = VMVistaMapas()
    var radio: Double
    
    var body: some View {
        ZStack{
            Color("GrisFondo")
            
            VStack{
                Map(coordinateRegion: $mapa.localizacion, showsUserLocation: true,annotationItems: mapa.respuesta) { lugares in
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: lugares.latitude ?? 0.0, longitude: lugares.longitude ?? 0.0), content: {
                        VStack{
                            Image(systemName: "location.north.circle.fill")
                                .foregroundColor(.red)
                            Text(lugares.name ?? "NA")
                                .bold()
                        }
                    })
                }
                .onChange(of: mapa.lat){ nuevoValor in
                    mapa.radio = radio
                    mapa.recuperarAeropuertosMapa()
                }
                
                if mapa.localizacionActiva {
                    Link("✅ Localización activada. Pulse para cambiar autorización.", destination: URL(string: UIApplication.openSettingsURLString)!)
                        .padding()
                        .foregroundColor(.black)
                } else {
                    Link("❌ Localización desactivada. Pulse para cambiar autorización.", destination: URL(string: UIApplication.openSettingsURLString)!)
                        .padding()
                        .foregroundColor(.black)
                }
            }
        }
    }
}
