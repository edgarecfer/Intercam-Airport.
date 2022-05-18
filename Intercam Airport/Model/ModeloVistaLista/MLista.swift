import Foundation
import CoreLocation

struct MLista: Decodable {
    let iataCode: String?
    let icaoCode: String?
    let name: String?
    let alpha2countryCode: String?
    let latitude: Double?
    let longitude: Double?
}

extension MLista: Identifiable {
    var id: String {return name ?? "NA"}
}
