import Foundation
import CoreLocation
import MapKit

class VMVistaMapas: NSObject, ObservableObject {
    
    @Published var respuesta: [MLista] = []
    @Published var localizacion: MKCoordinateRegion = .init()
    @Published var localizacionActiva: Bool = false
    
    @Published var lat: Double = 0
    @Published var long: Double = 0
    @Published var radio: Double = 0
    
    private let manager: CLLocationManager = .init()
    
    override init(){
        super.init()
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        manager.delegate = self
        localizacion = .init(center: CLLocationCoordinate2D(latitude: -54.81, longitude: -68.315), span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }

    //Funcion para recuperar datos de la API
    func recuperarAeropuertosMapa(){
        guard let url = URL(string: "https://aviation-reference-data.p.rapidapi.com/airports/search?lat=\(lat)&lon=\(long)&radius=\(Int(radio))") else {return}
        let headers = [
            "X-RapidAPI-Host": "aviation-reference-data.p.rapidapi.com",
            "X-RapidAPI-Key": "6e59a191c2msh864c4bff9dd96e4p15f155jsn181853f6485e"
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request){data,_,_ in
            guard let data = data else {
                return
            }

            do{
                let resp = try JSONDecoder().decode([MLista].self, from: data)
                DispatchQueue.main.async {
                    self.respuesta = resp
                }
            }catch let error as NSError{
                print("Error al construir los datos para la lista: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    //Funcion para saber el estado de los permisos
    func autorizacionUsuario() {
            let status = manager.authorizationStatus
            switch status {
            case .authorized, .authorizedAlways, .authorizedWhenInUse:
                localizacionActiva = true
                break
            case .denied, .notDetermined, .restricted:
                localizacionActiva = false
            @unknown default:
                print("Estado desconocido")
            }
        }
    
}

extension VMVistaMapas: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let ubicacion = locations.last else {
            return
        }
        localizacion = .init(center: ubicacion.coordinate, span: .init(latitudeDelta: 0.1, longitudeDelta: 0.1))
        localizacionActiva = true
        lat = ubicacion.coordinate.latitude
        long = ubicacion.coordinate.longitude
        manager.stopUpdatingLocation()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        autorizacionUsuario()
    }
}
