import Foundation

///
/// `PreferenceSetter` is a protocol that defines an interface for storing various types of values in a preference store.
///
/// This protocol provides a standardized way to save preferences regardless of the underlying storage mechanism.
/// Each method follows a consistent pattern of accepting a string key and a value of the specified type.
/// The setter methods handle the serialization and storage of the values in the backing store.
///
/// ## Supported Value Types
/// - `Bool`: Boolean values
/// - `Int`: Integer values
/// - `Double`: Double-precision floating point values
/// - `Data`: Binary data
/// - `[String: Any]`: Dictionary values (commonly used for storing complex objects)
///
/// ## Usage Example
/// ```swift
/// let preferences: PreferenceSetter = UserDefaultPreferenceSetterAdapter()
///
/// // Store a boolean preference
/// preferences.setBool("feature.enabled", value: true)
///
/// // Store user settings as a dictionary
/// let settings: [String: Any] = ["theme": "dark", "fontSize": 14, "notifications": true]
/// preferences.setDict("user.settings", value: settings)
/// ```
///
/// ## Implementation Notes
/// When implementing this protocol, consider the following:
/// - Ensure values are properly persisted to the underlying storage
/// - Handle type serialization appropriately for the storage medium
/// - Consider thread safety for concurrent write operations
/// - Implement proper error handling within the implementation
/// - Consider implementing synchronization behavior if needed (e.g., immediate write to disk)
///
public protocol PreferenceSetter {
    ///
    /// Stores a Boolean value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Boolean value to store.
    ///
    func setBool(_ key: String, value: Bool)
    
    ///
    /// Stores an integer value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The integer value to store.
    ///
    func setInt(_ key: String, value: Int)
    
    ///
    /// Stores a double-precision floating-point value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Double value to store.
    ///
    func setDouble(_ key: String, value: Double)
    
    ///
    /// Stores binary data in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Data object to store.
    ///
    func setData(_ key: String, value: Data)
    
    ///
    /// Stores a dictionary in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The dictionary to store.
    /// - Note: The dictionary must contain only property list compatible types
    ///   if using implementations like UserDefaults.
    ///   
    func setDict(_ key: String, value: [String: Any])
}
