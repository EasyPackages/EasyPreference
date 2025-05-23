import Foundation

public protocol PreferenceSetterProvider {
    func set(_ value: Any?, forKey key: String)
}

public struct UserDefaultPreferenceSetterAdapter: PreferenceSetter {
    private let provider: PreferenceSetterProvider
    
    public init(provider: PreferenceSetterProvider = UserDefaults.standard) {
        self.provider = provider
    }
    
    public func setBool(_ key: String, value: Bool) {
        provider.set(value, forKey: key)
    }
    
    public func setInt(_ key: String, value: Int) {
        provider.set(value, forKey: key)
    }
    
    public func setDouble(_ key: String, value: Double) {
        provider.set(value, forKey: key)
    }
    
    public func setData(_ key: String, value: Data) {
        provider.set(value, forKey: key)
    }
    
    public func setDict(_ key: String, value: [String : Any]) {
        provider.set(value, forKey: key)
    }
}
