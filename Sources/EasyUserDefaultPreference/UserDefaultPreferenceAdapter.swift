import EasyPrefence

import Foundation

public struct UserDefaultPreferenceAdapter: Preference {
    private let getter: PreferenceGetter
    private let setter: PreferenceSetter
    
    public init(
        getter: PreferenceGetter = UserDefaultPreferenceGetterAdapter(),
        setter: PreferenceSetter = UserDefaultPreferenceSetterAdapter()
    ) {
        self.getter = getter
        self.setter = setter
    }
    
    public func getBool(_ key: String) -> Bool? {
        getter.getBool(key)
    }
    
    public func getInt(_ key: String) -> Int? {
        getter.getInt(key)
    }
    
    public func getDouble(_ key: String) -> Double? {
        getter.getDouble(key)
    }
    
    public func getData(_ key: String) -> Data? {
        getter.getData(key)
    }
    
    public func getDict(_ key: String) -> [String: Any]? {
        getter.getDict(key)
    }
    
    public func setBool(_ key: String, value: Bool) {
        setter.setBool(key, value: value)
    }
    
    public func setInt(_ key: String, value: Int) {
        setter.setInt(key, value: value)
    }
    
    public func setDouble(_ key: String, value: Double) {
        setter.setDouble(key, value: value)
    }
    
    public func setData(_ key: String, value: Data) {
        setter.setData(key, value: value)
    }
    
    public func setDict(_ key: String, value: [String: Any]) {
        setter.setDict(key, value: value)
    }
}
