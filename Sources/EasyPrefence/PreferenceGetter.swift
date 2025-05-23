import Foundation

///
/// `PreferenceGetter` is a protocol that defines an interface for retrieving various types of values from a preference store.
///
/// This protocol provides a standardized way to access stored preferences regardless of the underlying storage mechanism.
/// Each method follows a consistent pattern of accepting a string key and returning an optional value of the specified type.
/// The optional return type reflects the possibility that the requested key might not exist in the preference store.
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
/// let preferences: PreferenceGetter = UserDefaultPreferenceGetterAdapter()
///
/// // Retrieve a boolean preference
/// if let isEnabled = preferences.getBool("feature.enabled") {
///     print("Feature is enabled: \(isEnabled)")
/// } else {
///     print("Feature enabled setting not found")
/// }
///
/// // Retrieve user settings as a dictionary
/// if let settings = preferences.getDict("user.settings") {
///     print("User has \(settings.count) settings configured")
/// }
/// ```
///
/// ## Implementation Notes
/// When implementing this protocol, consider the following:
/// - Methods should return `nil` when a key doesn't exist
/// - Type conversion should be handled safely (return `nil` rather than crashing on type mismatch)
/// - Consider thread safety for concurrent access scenarios
///
public protocol PreferenceGetter {
    ///
    /// Retrieves a Boolean value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Boolean value associated with the specified key, or `nil` if the key
    ///   doesn't exist or the value is not a Boolean.
    ///
    func getBool(_ key: String) -> Bool?
    
    ///
    /// Retrieves an integer value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The integer value associated with the specified key, or `nil` if the key
    ///   doesn't exist or the value is not an integer.
    ///
    func getInt(_ key: String) -> Int?
    
    ///
    /// Retrieves a double-precision floating-point value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Double value associated with the specified key, or `nil` if the key
    ///   doesn't exist or the value is not a Double.
    ///
    func getDouble(_ key: String) -> Double?
    
    ///
    /// Retrieves binary data associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Data value associated with the specified key, or `nil` if the key
    ///   doesn't exist or the value is not Data.
    ///
    func getData(_ key: String) -> Data?
    
    ///
    /// Retrieves a dictionary associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The dictionary associated with the specified key, or `nil` if the key
    ///   doesn't exist or the value is not a dictionary.
    ///
    func getDict(_ key: String) -> [String: Any]?
}
