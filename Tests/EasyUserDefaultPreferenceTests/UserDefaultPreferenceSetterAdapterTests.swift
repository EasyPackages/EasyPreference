import Testing
import Foundation

@testable import EasyUserDefaultPreference

@Suite("UserDefaultPreferenceSetterAdapter")
struct UserDefaultPreferenceSetterAdapterTests {
    @Suite(".setBool(_:value:)")
    struct SetBoolTests {
        private let env = makeEnv(valueType: Bool.self)
        
        @Test("should call set once with true value and expected key")
        func shouldCallSetOnceWithTrueValueAndExpectedKey() {
            let key = "any-key"
            let value = true
            
            env.sut.setBool(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set once with false value and expected key")
        func shouldCallSetOnceWithFalseValueAndExpectedKey() {
            let key = "any-other-key"
            let value = false
            
            env.sut.setBool(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set twice with different keys and values")
        func shouldCallSetTwiceWithDifferentKeysAndValues() {
            let key1 = "any-other-key"
            let value1 = true
            let key2 = "any-key"
            let value2 = false
            env.sut.setBool(key1, value: value1)
            
            env.sut.setBool(key2, value: value2)
            
            #expect(env.providerDouble.setMocked.callCount == 2)
            env.providerDouble.expect(at: 0, key: key1, value: value1)
            env.providerDouble.expect(at: 1, key: key2, value: value2)
        }
    }
    
    @Suite(".setInt(_:value:)")
    struct SetIntTests {
        private let env = makeEnv(valueType: Int.self)
        
        @Test("should call set once with integer value 10 and expected key")
        func shouldCallSetOnceWithInt10AndExpectedKey() {
            let key = "any-key"
            let value = 10
            
            env.sut.setInt(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set once with integer value 12 and different key")
        func shouldCallSetOnceWithInt12AndDifferentKey() {
            let key = "any-other-key"
            let value = 12
            
            env.sut.setInt(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set twice with different integer keys and values")
        func shouldCallSetTwiceWithDifferentIntKeysAndValues() {
            let key1 = "any-other-key"
            let value1 = 32
            let key2 = "any-key"
            let value2 = 423
            env.sut.setInt(key1, value: value1)
            
            env.sut.setInt(key2, value: value2)
            
            #expect(env.providerDouble.setMocked.callCount == 2)
            env.providerDouble.expect(at: 0, key: key1, value: value1)
            env.providerDouble.expect(at: 1, key: key2, value: value2)
        }
    }
    
    @Suite(".setDouble(_:value:)")
    struct SetDoubleTests {
        private let env = makeEnv(valueType: Double.self)
        
        @Test("should call set once with double value 10.0 and expected key")
        func shouldCallSetOnceWithDouble10AndExpectedKey() {
            let key = "any-key"
            let value = 10.0
            
            env.sut.setDouble(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set once with double value 12.0 and different key")
        func shouldCallSetOnceWithDouble12AndDifferentKey() {
            let key = "any-other-key"
            let value = 12.0
            
            env.sut.setDouble(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set twice with different double keys and values")
        func shouldCallSetTwiceWithDifferentDoubleKeysAndValues() {
            let key1 = "any-other-key"
            let value1 = 32.0
            let key2 = "any-key"
            let value2 = 423.0
            env.sut.setDouble(key1, value: value1)
            
            env.sut.setDouble(key2, value: value2)
            
            #expect(env.providerDouble.setMocked.callCount == 2)
            env.providerDouble.expect(at: 0, key: key1, value: value1)
            env.providerDouble.expect(at: 1, key: key2, value: value2)
        }
    }
    
    @Suite(".setData(_:value:)")
    struct SetDataTests {
        private let env = makeEnv(valueType: Data.self)
        
        @Test("should call set once with data value and expected key")
        func shouldCallSetOnceWithDataValueAndExpectedKey() {
            let key = "any-key"
            let value = Data.mock()
            
            env.sut.setData(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set once with same data but different key")
        func shouldCallSetOnceWithSameDataDifferentKey() {
            let key = "any-other-key"
            let value = Data.mock()
            
            env.sut.setData(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set twice with different data and keys")
        func shouldCallSetTwiceWithDifferentDataAndKeys() {
            let key1 = "any-other-key"
            let value1 = Data.mock()
            let key2 = "any-key"
            let value2 = Data.mock()
            env.sut.setData(key1, value: value1)
            
            env.sut.setData(key2, value: value2)
            
            #expect(env.providerDouble.setMocked.callCount == 2)
            env.providerDouble.expect(at: 0, key: key1, value: value1)
            env.providerDouble.expect(at: 1, key: key2, value: value2)
        }
    }
    
    @Suite(".setDict(_:value:)")
    struct SetDictTests {
        private let env = makeEnv(valueType: [String: String].self)
        
        @Test("should call set once with dictionary value and expected key")
        func shouldCallSetOnceWithDictValueAndExpectedKey() {
            let key = "any-key"
            let value = ["key": "value"]
            
            env.sut.setDict(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set once with same dictionary but different key")
        func shouldCallSetOnceWithSameDictDifferentKey() {
            let key = "any-other-key"
            let value = ["key": "value"]
            
            env.sut.setDict(key, value: value)
            
            #expect(env.providerDouble.setMocked.callCount == 1)
            env.providerDouble.expect(at: 0, key: key, value: value)
        }
        
        @Test("should call set twice with different dictionaries and keys")
        func shouldCallSetTwiceWithDifferentDictionariesAndKeys() {
            let key1 = "any-other-key"
            let value1 = ["key": "value"]
            let key2 = "any-key"
            let value2 = ["key": "another-value"]
            env.sut.setDict(key1, value: value1)
            
            env.sut.setDict(key2, value: value2)
            
            #expect(env.providerDouble.setMocked.callCount == 2)
            env.providerDouble.expect(at: 0, key: key1, value: value1)
            env.providerDouble.expect(at: 1, key: key2, value: value2)
        }
    }
    
    private struct Environment<T: Equatable> {
        let sut: UserDefaultPreferenceSetterAdapter
        let providerDouble: PreferenceSetterProviderDouble<T>
    }
    
    private static func makeEnv<T: Equatable>(valueType: T.Type) -> Environment<T> {
        let providerDouble = PreferenceSetterProviderDouble<T>()
        let sut = UserDefaultPreferenceSetterAdapter(provider: providerDouble)
        
        return Environment(sut: sut, providerDouble: providerDouble)
    }
}
