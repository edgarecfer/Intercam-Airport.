import Foundation

struct MLista: Decodable {
    let iataCode: String
    let icaoCode: String
    let name: String
    let alpha2countryCode: String
    let latitude: Double
    let longitude: Double
}
