import Foundation

public protocol PreferenceSetter {
    func setBool(_ key: String, value: Bool)
    func setInt(_ key: String, value: Int)
    func setDouble(_ key: String, value: Double)
    func setData(_ key: String, value: Data)
    func setDict(_ key: String, value: [String: Any])
}
