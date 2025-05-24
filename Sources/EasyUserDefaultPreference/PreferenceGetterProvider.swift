import Foundation

/// `PreferenceGetterProvider` is a protocol that defines an abstraction for retrieving raw values from a preference store.
///
/// This protocol is designed to decouple the retrieval logic from the underlying storage mechanism, enabling flexibility
/// and testability. It serves as the foundation for adapters like `UserDefaultPreferenceGetterAdapter` that implement
/// higher-level interfaces such as `PreferenceGetter`.
///
/// ## Purpose
/// The primary purpose of `PreferenceGetterProvider` is to provide a low-level interface for fetching values
/// from a storage system (e.g., `UserDefaults`) without imposing type constraints. The retrieved values are
/// typically cast to the desired type by higher-level abstractions.
///
/// ## Usage Example
/// ```swift
/// // Example of a custom provider
/// struct CustomPreferenceGetterProvider: PreferenceGetterProvider {
///     private var storage: [String: Any] = [:]
///
///     func value(forKey key: String) -> Any? {
///         return storage[key]
///     }
/// }
///
/// let provider = CustomPreferenceGetterProvider()
/// let value = provider.value(forKey: "example.key")
/// ```
///
/// ## Implementation Notes
/// - The `value(forKey:)` method should return `nil` if the key does not exist in the storage.
/// - The returned value is expected to be cast to the appropriate type by the caller.
/// - Implementations should ensure thread safety if the underlying storage is accessed concurrently.
public protocol PreferenceGetterProvider {
    /// Retrieves a raw value associated with the specified key from the preference store.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The raw value associated with the key, or `nil` if the key does not exist.
    func value(forKey key: String) -> Any?
}

///
/// `UserDefaultPreferenceGetterAdapter` is a concrete implementation of the `PreferenceGetter` protocol
/// that retrieves values from the `UserDefaults` system.
///
/// This adapter uses a `PreferenceGetterProvider` to abstract the underlying storage mechanism,
/// allowing for flexibility and testability. By default, it uses `UserDefaults.standard` as the provider.
///
/// ## Purpose
/// The adapter provides a seamless way to access stored preferences in `UserDefaults` while adhering to the
/// `PreferenceGetter` protocol. It ensures type safety and handles type casting for various data types.
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
/// let getter = UserDefaultPreferenceGetterAdapter()
///
/// // Retrieve a boolean value
/// if let isEnabled = getter.getBool("feature.enabled") {
///     print("Feature is enabled: \(isEnabled)")
/// }
///
/// // Retrieve a dictionary value
/// if let settings = getter.getDict("user.settings") {
///     print("User settings: \(settings)")
/// }
/// ```
///
/// ## Implementation Notes
/// - The `provider` is responsible for fetching raw values from the underlying storage.
/// - Type casting is performed to ensure the returned value matches the expected type.
/// - If the key does not exist or the value cannot be cast to the expected type, the methods return `nil`.
///
public struct UserDefaultPreferenceGetterAdapter: PreferenceGetter {
    private let provider: PreferenceGetterProvider
    
    ///
    /// Initializes the adapter with a `PreferenceGetterProvider`.
    ///
    /// - Parameter provider: The provider responsible for fetching raw values. Defaults to `UserDefaults.standard`.
    ///
    public init(provider: PreferenceGetterProvider = UserDefaults.standard) {
        self.provider = provider
    }
    
    ///
    /// Retrieves a Boolean value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Boolean value associated with the key, or `nil` if the key does not exist or the value is not a Boolean.
    ///
    public func getBool(_ key: String) -> Bool? {
        provider.value(forKey: key) as? Bool
    }
    
    ///
    /// Retrieves an integer value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The integer value associated with the key, or `nil` if the key does not exist or the value is not an integer.
    ///
    public func getInt(_ key: String) -> Int? {
        provider.value(forKey: key) as? Int
    }
    
    ///
    /// Retrieves a double-precision floating-point value associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Double value associated with the key, or `nil` if the key does not exist or the value is not a Double.
    ///
    public func getDouble(_ key: String) -> Double? {
        provider.value(forKey: key) as? Double
    }
    
    ///
    /// Retrieves binary data associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The Data value associated with the key, or `nil` if the key does not exist or the value is not Data.
    ///
    public func getData(_ key: String) -> Data? {
        provider.value(forKey: key) as? Data
    }
    
    ///
    /// Retrieves a dictionary associated with the specified key.
    ///
    /// - Parameter key: The key to look up in the preference store.
    /// - Returns: The dictionary associated with the key, or `nil` if the key does not exist or the value is not a dictionary.
    ///
    public func getDict(_ key: String) -> [String : Any]? {
        provider.value(forKey: key) as? [String: Any]
    }
}
