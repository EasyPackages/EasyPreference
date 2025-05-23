import Foundation

public protocol PreferenceGetter {
    func getBool(_ key: String) -> Bool?
    func getInt(_ key: String) -> Int?
    func getDouble(_ key: String) -> Double?
    func getData(_ key: String) -> Data?
}
