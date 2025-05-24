import Foundation

///
/// `Preference` is a composite type that combines the capabilities of both reading and writing preference values.
///
/// This typealias combines two protocols:
/// - `PreferenceGetter`: Provides methods for retrieving values from a preference store
/// - `PreferenceSetter`: Provides methods for saving values to a preference store
///
/// By combining these protocols, `Preference` represents a complete interface for interacting with
/// preference data, allowing both reading and writing operations through a single type.
///
/// ## Usage Example:
/// ```swift
/// // Create a preference object that conforms to both getter and setter protocols
/// let preferences: Preference = UserDefaultPreferenceAdapter()
///
/// // Store a value
/// preferences.setInt("user.age", value: 25)
///
/// // Retrieve a value
/// if let age = preferences.getInt("user.age") {
///     print("User age is \(age)")
/// }
/// ```
///
/// The actual implementation of these methods depends on the concrete type that conforms to `Preference`.
/// For example, `UserDefaultPreferenceAdapter` implements these methods using UserDefaults.
///
public typealias Preference = (
    PreferenceGetter &
    PreferenceSetter
)
