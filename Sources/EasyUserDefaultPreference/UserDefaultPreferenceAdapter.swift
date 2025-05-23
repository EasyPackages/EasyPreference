import EasyPrefence

import Foundation

///
/// `UserDefaultPreferenceAdapter` is a concrete implementation of the `Preference` typealias
/// that combines both `PreferenceGetter` and `PreferenceSetter` functionalities using the `UserDefaults` system.
///
/// This adapter provides a unified interface for reading and writing preferences, leveraging the
/// `UserDefaultPreferenceGetterAdapter` and `UserDefaultPreferenceSetterAdapter` for the actual operations.
///
/// ## Purpose
/// The primary purpose of `UserDefaultPreferenceAdapter` is to simplify preference management by
/// combining getter and setter capabilities into a single structure. It abstracts the underlying
/// storage mechanism (`UserDefaults`) and ensures type safety for various data types.
///
/// ## Supported Value Types
/// - `Bool`: Boolean values
/// - `Int`: Integer values
/// - `Double`: Double-precision floating point values
/// - `Data`: Binary data
/// - `[String: Any]`: Dictionary values
///
/// ## Usage Example
/// ```swift
/// let preferences = UserDefaultPreferenceAdapter()
///
/// // Store a value
/// preferences.setBool("feature.enabled", value: true)
///
/// // Retrieve a value
/// if let isEnabled = preferences.getBool("feature.enabled") {
///     print("Feature is enabled: \(isEnabled)")
/// }
/// ```
///
/// ## Implementation Notes
/// - The adapter delegates read operations to `UserDefaultPreferenceGetterAdapter`.
/// - Write operations are delegated to `UserDefaultPreferenceSetterAdapter`.
/// - The default initializer uses `UserDefaults.standard` for both getter and setter operations.
///
public struct UserDefaultPreferenceAdapter: Preference {
    private let getter: PreferenceGetter
    private let setter: PreferenceSetter
    
    ///
    /// Initializes the adapter with custom getter and setter implementations.
    ///
    /// - Parameters:
    ///   - getter: An object conforming to `PreferenceGetter`. Defaults to `UserDefaultPreferenceGetterAdapter()`.
    ///   - setter: An object conforming to `PreferenceSetter`. Defaults to `UserDefaultPreferenceSetterAdapter()`.
    ///
    public init(
        getter: PreferenceGetter = UserDefaultPreferenceGetterAdapter(),
        setter: PreferenceSetter = UserDefaultPreferenceSetterAdapter()
    ) {
        self.getter = getter
        self.setter = setter
    }
    
    ///
    /// Retrieves a Boolean value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Boolean value associated with the key, or `nil` if the key does not exist.
    ///
    public func getBool(_ key: String) -> Bool? {
        getter.getBool(key)
    }
    
    ///
    /// Retrieves an integer value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The integer value associated with the key, or `nil` if the key does not exist.
    ///
    public func getInt(_ key: String) -> Int? {
        getter.getInt(key)
    }
    
    ///
    /// Retrieves a double-precision floating-point value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Double value associated with the key, or `nil` if the key does not exist.
    ///
    public func getDouble(_ key: String) -> Double? {
        getter.getDouble(key)
    }
    
    ///
    /// Retrieves binary data associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Data value associated with the key, or `nil` if the key does not exist.
    ///
    public func getData(_ key: String) -> Data? {
        getter.getData(key)
    }
    
    ///
    /// Retrieves a dictionary associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The dictionary associated with the key, or `nil` if the key does not exist.
    ///
    public func getDict(_ key: String) -> [String: Any]? {
        getter.getDict(key)
    }
    
    ///
    /// Stores a Boolean value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Boolean value to store.
    ///
    public func setBool(_ key: String, value: Bool) {
        setter.setBool(key, value: value)
    }
    
    ///
    /// Stores an integer value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The integer value to store.
    ///
    public func setInt(_ key: String, value: Int) {
        setter.setInt(key, value: value)
    }
    
    ///
    /// Stores a double-precision floating-point value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Double value to store.
    ///
    public func setDouble(_ key: String, value: Double) {
        setter.setDouble(key, value: value)
    }
    
    ///
    /// Stores binary data in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Data object to store.
    ///
    public func setData(_ key: String, value: Data) {
        setter.setData(key, value: value)
    }
    
    ///
    /// Stores a dictionary in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The dictionary to store.
    /// - Note: The dictionary must contain only property list compatible types
    ///   if using implementations like UserDefaults.
    ///   
    public func setDict(_ key: String, value: [String: Any]) {
        setter.setDict(key, value: value)
    }
}
