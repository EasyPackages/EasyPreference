import Foundation

public protocol PreferenceGetterProvider {
    func value(forKey key: String) -> Any?
}

public struct UserDefaultPreferenceGetterAdapter: PreferenceGetter {
    private let provider: PreferenceGetterProvider
    
    public init(provider: PreferenceGetterProvider = UserDefaults.standard) {
        self.provider = provider
    }
    
    public func getBool(_ key: String) -> Bool? {
        provider.value(forKey: key) as? Bool
    }
    
    public func getInt(_ key: String) -> Int? {
        provider.value(forKey: key) as? Int
    }
    
    public func getDouble(_ key: String) -> Double? {
        provider.value(forKey: key) as? Double
    }
    
    public func getData(_ key: String) -> Data? {
        provider.value(forKey: key) as? Data
    }
    
    public func getDict(_ key: String) -> [String : Any]? {
        provider.value(forKey: key) as? [String: Any]
    }
}
