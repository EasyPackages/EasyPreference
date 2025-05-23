import Foundation

///
/// `PreferenceSetterProvider` is a protocol that defines an abstraction for storing raw values in a preference store.
///
/// This protocol is designed to decouple the storage logic from the underlying storage mechanism, enabling flexibility
/// and testability. It serves as the foundation for adapters like `UserDefaultPreferenceSetterAdapter` that implement
/// higher-level interfaces such as `PreferenceSetter`.
///
/// ## Purpose
/// The primary purpose of `PreferenceSetterProvider` is to provide a low-level interface for saving values
/// to a storage system (e.g., `UserDefaults`) without imposing type constraints. The values are typically
/// serialized and stored by higher-level abstractions.
///
/// ## Usage Example
/// ```swift
/// // Example of a custom provider
/// struct CustomPreferenceSetterProvider: PreferenceSetterProvider {
///     private var storage: [String: Any] = [:]
///
///     func set(_ value: Any?, forKey key: String) {
///         storage[key] = value
///     }
/// }
///
/// let provider = CustomPreferenceSetterProvider()
/// provider.set("exampleValue", forKey: "example.key")
/// ```
///
/// ## Implementation Notes
/// - The `set(_:forKey:)` method should handle `nil` values appropriately (e.g., removing the key from storage).
/// - Implementations should ensure thread safety if the underlying storage is accessed concurrently.
///
public protocol PreferenceSetterProvider {
    /// Stores a raw value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - value: The raw value to store. Passing `nil` should remove the key from the store.
    ///   - key: The key under which to store the value.
    func set(_ value: Any?, forKey key: String)
}

///
/// `UserDefaultPreferenceSetterAdapter` is a concrete implementation of the `PreferenceSetter` protocol
/// that stores values in the `UserDefaults` system.
///
/// This adapter uses a `PreferenceSetterProvider` to abstract the underlying storage mechanism,
/// allowing for flexibility and testability. By default, it uses `UserDefaults.standard` as the provider.
///
/// ## Purpose
/// The adapter provides a seamless way to save preferences in `UserDefaults` while adhering to the
/// `PreferenceSetter` protocol. It ensures type safety and handles serialization for various data types.
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
/// let setter = UserDefaultPreferenceSetterAdapter()
///
/// // Store a boolean value
/// setter.setBool("feature.enabled", value: true)
///
/// // Store a dictionary value
/// let settings: [String: Any] = ["theme": "dark", "fontSize": 14]
/// setter.setDict("user.settings", value: settings)
/// ```
///
/// ## Implementation Notes
/// - The `provider` is responsible for storing raw values in the underlying storage.
/// - Serialization is handled by the adapter to ensure compatibility with the storage system.
/// - If the value cannot be serialized, the method should handle the error gracefully.
///
public struct UserDefaultPreferenceSetterAdapter: PreferenceSetter {
    private let provider: PreferenceSetterProvider
    
    ///
    /// Initializes the adapter with a `PreferenceSetterProvider`.
    ///
    /// - Parameter provider: The provider responsible for storing raw values. Defaults to `UserDefaults.standard`.
    ///
    public init(provider: PreferenceSetterProvider = UserDefaults.standard) {
        self.provider = provider
    }
    
    ///
    /// Stores a Boolean value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Boolean value to store.
    ///
    public func setBool(_ key: String, value: Bool) {
        provider.set(value, forKey: key)
    }
    
    ///
    /// Stores an integer value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The integer value to store.
    ///
    public func setInt(_ key: String, value: Int) {
        provider.set(value, forKey: key)
    }
    
    ///
    /// Stores a double-precision floating-point value in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Double value to store.
    ///
    public func setDouble(_ key: String, value: Double) {
        provider.set(value, forKey: key)
    }
    
    /// Stores binary data in the preference store for the specified key.
    ///
    /// - Parameters:
    ///   - key: The key under which to store the value.
    ///   - value: The Data object to store.
    public func setData(_ key: String, value: Data) {
        provider.set(value, forKey: key)
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
    public func setDict(_ key: String, value: [String : Any]) {
        provider.set(value, forKey: key)
    }
}
