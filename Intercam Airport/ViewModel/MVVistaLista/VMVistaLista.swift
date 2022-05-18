import Foundation

class VMVistaLista: ObservableObject{
    @Published var aeropuertos: [MLista] = []
    
    func recuperarAeropuertos(lat: Double, long: Double, radio: Double){
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
                    self.aeropuertos = resp
                }
            }catch let error as NSError{
                print("Error al construir los datos para la lista: \(error.localizedDescription)")
            }
        }.resume()
    }
}
