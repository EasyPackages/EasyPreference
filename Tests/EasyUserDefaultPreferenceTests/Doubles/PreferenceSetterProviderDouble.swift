import EasyTesting

import EasyMock

@testable import EasyUserDefaultPreference

struct PreferenceSetterProviderDouble<T: Equatable>: PreferenceSetterProvider {
    struct Set {
        let value: T?
        let key: String
    }
    
    let setMocked = Mock<Set, Void>()
    
    func set(_ value: Any?, forKey key: String) {
        setMocked.synchronize(Set(value: value as? T, key: key))
    }
    
    func spy(at index: Int) -> Set? {
        guard setMocked.spies.indices.contains(index) else {
            return nil
        }
        
        return setMocked.spies[index]
    }
    
    func expect(at index: Int, key: String, value: T?, sourceLocation: SourceLocation = #_sourceLocation) {
        guard let spy = spy(at: index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value == value, sourceLocation: sourceLocation)
    }
}
