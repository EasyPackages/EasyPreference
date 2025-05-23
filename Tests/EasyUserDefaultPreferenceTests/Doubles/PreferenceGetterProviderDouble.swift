import EasyMock

@testable import EasyUserDefaultPreference

struct PreferenceGetterProviderDouble<T: Equatable>: PreferenceGetterProvider {
    let valueMocked = Mock<String, T?>(nil)
    
    func value(forKey key: String) -> Any? {
        valueMocked.synchronize(key)
    }
}
