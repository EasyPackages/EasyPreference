import Foundation

import EasyMock

@testable import EasyUserDefaultPreference

struct PreferenceGetterDouble: PreferenceGetter {
    let getBoolMocked = Mock<String, Bool?>(nil)
    let getIntMocked = Mock<String, Int?>(nil)
    let getDoubleMocked = Mock<String, Double?>(nil)
    let getDataMocked = Mock<String, Data?>(nil)
    
    func getBool(_ key: String) -> Bool? {
        getBoolMocked.synchronize(key)
    }
    
    func getInt(_ key: String) -> Int? {
        getIntMocked.synchronize(key)
    }
    
    func getDouble(_ key: String) -> Double? {
        getDoubleMocked.synchronize(key)
    }
    
    func getData(_ key: String) -> Data? {
        getDataMocked.synchronize(key)
    }
}
