import Foundation

import EasyTesting
import EasyMock

@testable import EasyUserDefaultPreference

struct PreferenceSetterDouble: PreferenceSetter {
    let setBoolMocked = Mock<(key: String, value: Bool), Void>()
    let setIntMocked = Mock<(key: String, value: Int), Void>()
    let setDoubleMocked = Mock<(key: String, value: Double), Void>()
    let setDataMocked = Mock<(key: String, value: Data), Void>()
    let setDictMocked = Mock<(key: String, value: [String: Any]), Void>()
    
    func setBool(_ key: String, value: Bool) {
        setBoolMocked.synchronize((key, value))
    }
    
    func setInt(_ key: String, value: Int) {
        setIntMocked.synchronize((key, value))
    }
    
    func setDouble(_ key: String, value: Double) {
        setDoubleMocked.synchronize((key, value))
    }
    
    func setData(_ key: String, value: Data) {
        setDataMocked.synchronize((key, value))
    }
    
    func setDict(_ key: String, value: [String: Any]) {
        setDictMocked.synchronize((key, value))
    }
    
    func expectBool(at index: Int, key: String, value: Bool, sourceLocation: SourceLocation = #_sourceLocation) {
        let spies = setBoolMocked.spies
        guard spies.indices.contains(index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        let spy = spies[index]
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value == value, sourceLocation: sourceLocation)
    }
    
    func expectInt(at index: Int, key: String, value: Int, sourceLocation: SourceLocation = #_sourceLocation) {
        let spies = setIntMocked.spies
        guard spies.indices.contains(index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        let spy = spies[index]
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value == value, sourceLocation: sourceLocation)
    }
    
    func expectDouble(at index: Int, key: String, value: Double, sourceLocation: SourceLocation = #_sourceLocation) {
        let spies = setDoubleMocked.spies
        guard spies.indices.contains(index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        let spy = spies[index]
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value == value, sourceLocation: sourceLocation)
    }
    
    func expectData(at index: Int, key: String, value: Data, sourceLocation: SourceLocation = #_sourceLocation) {
        let spies = setDataMocked.spies
        guard spies.indices.contains(index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        let spy = spies[index]
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value == value, sourceLocation: sourceLocation)
    }
    
    func expectDict(at index: Int, key: String, value: [String: String], sourceLocation: SourceLocation = #_sourceLocation) {
        let spies = setDictMocked.spies
        guard spies.indices.contains(index) else {
            return expectFail("Spy propertry not found at index \(index)", sourceLocation: sourceLocation)
        }
        
        let spy = spies[index]
        
        #expect(spy.key == key, sourceLocation: sourceLocation)
        #expect(spy.value as? [String: String] == value, sourceLocation: sourceLocation)
    }
}
