import Foundation

import EasyTesting
import EasyMock

@testable import EasyUserDefaultPreference

@Suite("UserDefaultPreferenceAdapter")
struct UserDefaultPreferenceAdapterTests {
    private let env = makeEnv()
    private let key = "any"
    
    @Suite("Get")
    struct GetTests {
        @Suite(".getBool(value:)")
        struct BoolTests {
            private let key = "any"
            private let env = makeEnv()
            
            @Test("should return nil when no value is stored")
            func shouldReturnNilWhenNoValueIsStored() {
                env.getterDouble.getBoolMocked.mock(returning: nil)
                
                #expect(env.sut.getBool(key) == nil)
            }
            
            @Test("should return true when true is stored")
            func shouldReturnTrueWhenTrueIsStored() {
                let valueStub = true
                env.getterDouble.getBoolMocked.mock(returning: valueStub)
                
                #expect(env.sut.getBool(key) == valueStub)
            }
            
            @Test("should return false when false is stored")
            func shouldReturnFalseWhenFalseIsStored() {
                let valueStub = false
                env.getterDouble.getBoolMocked.mock(returning: valueStub)
                
                #expect(env.sut.getBool(key) == valueStub)
            }
            
            @Test("should call provider with expected key")
            func shouldCallProviderWithExpectedKey()  {
                let key = "any"
                
                _ = env.sut.getBool(key)
                
                #expect(env.getterDouble.getBoolMocked.spies == [key])
            }
            
            @Test("should call provider twice with different keys")
            func shouldCallProviderTwiceWithDifferentKeys() {
                let key2 = "any-other"
                _ = env.sut.getBool(key)
                
                _ = env.sut.getBool(key2)
                
                #expect(env.getterDouble.getBoolMocked.spies == [key, key2])
            }
        }
        
        @Suite(".getBool(value:)")
        struct IntTests {
            private let key = "any"
            private let env = makeEnv()
            
            @Test("should return nil when no value is stored")
            func shouldReturnNilWhenNoValueIsStored() {
                env.getterDouble.getIntMocked.mock(returning: nil)
                
                #expect(env.sut.getInt(key) == nil)
            }
            
            @Test("should return 10 when true is stored")
            func shouldReturnTrueWhenTrueIsStored() {
                let valueStub = 10
                env.getterDouble.getIntMocked.mock(returning: valueStub)
                
                #expect(env.sut.getInt(key) == valueStub)
            }
            
            @Test("should return 12 when false is stored")
            func shouldReturnFalseWhenFalseIsStored() {
                let valueStub = 12
                env.getterDouble.getIntMocked.mock(returning: valueStub)
                
                #expect(env.sut.getInt(key) == valueStub)
            }
            
            @Test("should call provider with expected key")
            func shouldCallProviderWithExpectedKey()  {
                let key = "any"
                
                _ = env.sut.getInt(key)
                
                #expect(env.getterDouble.getIntMocked.spies == [key])
            }
            
            @Test("should call provider twice with different keys")
            func shouldCallProviderTwiceWithDifferentKeys() {
                let key2 = "any-other"
                _ = env.sut.getInt(key)
                
                _ = env.sut.getInt(key2)
                
                #expect(env.getterDouble.getIntMocked.spies == [key, key2])
            }
        }
        
        @Suite(".getDouble(value:)")
        struct DoubleTests {
            private let key = "any"
            private let env = makeEnv()
            
            @Test("should return nil when no value is stored")
            func shouldReturnNilWhenNoValueIsStored() {
                env.getterDouble.getDoubleMocked.mock(returning: nil)
                
                #expect(env.sut.getDouble(key) == nil)
            }
            
            @Test("should return 10 when true is stored")
            func shouldReturnTrueWhenTrueIsStored() {
                let valueStub = 10.0
                env.getterDouble.getDoubleMocked.mock(returning: valueStub)
                
                #expect(env.sut.getDouble(key) == valueStub)
            }
            
            @Test("should return 12 when false is stored")
            func shouldReturnFalseWhenFalseIsStored() {
                let valueStub = 12.0
                env.getterDouble.getDoubleMocked.mock(returning: valueStub)
                
                #expect(env.sut.getDouble(key) == valueStub)
            }
            
            @Test("should call provider with expected key")
            func shouldCallProviderWithExpectedKey()  {
                let key = "any"
                
                _ = env.sut.getDouble(key)
                
                #expect(env.getterDouble.getDoubleMocked.spies == [key])
            }
            
            @Test("should call provider twice with different keys")
            func shouldCallProviderTwiceWithDifferentKeys() {
                let key2 = "any-other"
                _ = env.sut.getDouble(key)
                
                _ = env.sut.getDouble(key2)
                
                #expect(env.getterDouble.getDoubleMocked.spies == [key, key2])
            }
        }
        
        @Suite(".getData(value:)")
        struct DataTests {
            private let key = "any"
            private let env = makeEnv()
            
            @Test("should return nil when no value is stored")
            func shouldReturnNilWhenNoValueIsStored() {
                env.getterDouble.getDataMocked.mock(returning: nil)
                
                #expect(env.sut.getData(key) == nil)
            }
            
            @Test("should return when true is stored")
            func shouldReturnTrueWhenTrueIsStored() {
                let valueStub = Data.mock()
                env.getterDouble.getDataMocked.mock(returning: valueStub)
                
                #expect(env.sut.getData(key) == valueStub)
            }
            
            @Test("should return other data when false is stored")
            func shouldReturnFalseWhenFalseIsStored() {
                let valueStub = Data()
                env.getterDouble.getDataMocked.mock(returning: valueStub)
                
                #expect(env.sut.getData(key) == valueStub)
            }
            
            @Test("should call provider with expected key")
            func shouldCallProviderWithExpectedKey()  {
                let key = "any"
                
                _ = env.sut.getData(key)
                
                #expect(env.getterDouble.getDataMocked.spies == [key])
            }
            
            @Test("should call provider twice with different keys")
            func shouldCallProviderTwiceWithDifferentKeys() {
                let key2 = "any-other"
                _ = env.sut.getData(key)
                
                _ = env.sut.getData(key2)
                
                #expect(env.getterDouble.getDataMocked.spies == [key, key2])
            }
        }
        
        @Suite(".getDict(value:)")
        struct DictTests {
            private let key = "any"
            private let env = makeEnv()
            
            @Test("should return nil when no value is stored")
            func shouldReturnNilWhenNoValueIsStored() {
                env.getterDouble.getDictMocked.mock(returning: nil)
                
                #expect(env.sut.getDict(key) == nil)
            }
            
            @Test("should return when true is stored")
            func shouldReturnTrueWhenTrueIsStored() {
                let valueStub = ["key": "value"]
                env.getterDouble.getDictMocked.mock(returning: valueStub)
                
                #expect(env.sut.getDict(key) as? [String: String] == valueStub)
            }
            
            @Test("should return other data when false is stored")
            func shouldReturnFalseWhenFalseIsStored() {
                let valueStub = ["key": "value"]
                env.getterDouble.getDictMocked.mock(returning: valueStub)
                
                #expect(env.sut.getDict(key) as? [String: String] == valueStub)
            }
            
            @Test("should call provider with expected key")
            func shouldCallProviderWithExpectedKey()  {
                let key = "any"
                
                _ = env.sut.getDict(key)
                
                #expect(env.getterDouble.getDictMocked.spies == [key])
            }
            
            @Test("should call provider twice with different keys")
            func shouldCallProviderTwiceWithDifferentKeys() {
                let key2 = "any-other"
                _ = env.sut.getDict(key)
                
                _ = env.sut.getDict(key2)
                
                #expect(env.getterDouble.getDictMocked.spies == [key, key2])
            }
        }
    }
    
    @Suite("Set")
    struct SetTests {
        @Suite(".setBool(_:value:)")
        struct SetBoolTests {
            private let env = makeEnv()
            
            @Test("should call set once with true value and expected key")
            func shouldCallSetOnceWithTrueValueAndExpectedKey() {
                let key = "any-key"
                let value = true
                
                env.sut.setBool(key, value: value)
                
                #expect(env.setterDouble.setBoolMocked.callCount == 1)
                env.setterDouble.expectBool(at: 0, key: key, value: value)
                
            }
            
            @Test("should call set once with false value and expected key")
            func shouldCallSetOnceWithFalseValueAndExpectedKey() {
                let key = "any-other-key"
                let value = false
                
                env.sut.setBool(key, value: value)
                
                #expect(env.setterDouble.setBoolMocked.callCount == 1)
                env.setterDouble.expectBool(at: 0, key: key, value: value)
            }
            
            @Test("should call set twice with different keys and values")
            func shouldCallSetTwiceWithDifferentKeysAndValues() {
                let key1 = "any-other-key"
                let value1 = true
                let key2 = "any-key"
                let value2 = false
                env.sut.setBool(key1, value: value1)
                
                env.sut.setBool(key2, value: value2)
                
                #expect(env.setterDouble.setBoolMocked.callCount == 2)
                env.setterDouble.expectBool(at: 0, key: key1, value: value1)
                env.setterDouble.expectBool(at: 1, key: key2, value: value2)
            }
        }
        
        @Suite(".setInt(_:value:)")
        struct SetIntTests {
            private let env = makeEnv()
            
            @Test("should call set once with integer value 10 and expected key")
            func shouldCallSetOnceWithInt10AndExpectedKey() {
                let key = "any-key"
                let value = 10
                
                env.sut.setInt(key, value: value)
                
                #expect(env.setterDouble.setIntMocked.callCount == 1)
                env.setterDouble.expectInt(at: 0, key: key, value: value)
            }
            
            @Test("should call set once with integer value 12 and different key")
            func shouldCallSetOnceWithInt12AndDifferentKey() {
                let key = "any-other-key"
                let value = 12
                
                env.sut.setInt(key, value: value)
                
                #expect(env.setterDouble.setIntMocked.callCount == 1)
                env.setterDouble.expectInt(at: 0, key: key, value: value)
            }
            
            @Test("should call set twice with different integer keys and values")
            func shouldCallSetTwiceWithDifferentIntKeysAndValues() {
                let key1 = "any-other-key"
                let value1 = 32
                let key2 = "any-key"
                let value2 = 423
                env.sut.setInt(key1, value: value1)
                
                env.sut.setInt(key2, value: value2)
                
                #expect(env.setterDouble.setIntMocked.callCount == 2)
                env.setterDouble.expectInt(at: 0, key: key1, value: value1)
                env.setterDouble.expectInt(at: 1, key: key2, value: value2)
            }
        }
        
        @Suite(".setDouble(_:value:)")
        struct SetDoubleTests {
            private let env = makeEnv()
            
            @Test("should call set once with double value 10.0 and expected key")
            func shouldCallSetOnceWithDouble10AndExpectedKey() {
                let key = "any-key"
                let value = 10.0
                
                env.sut.setDouble(key, value: value)
                
                #expect(env.setterDouble.setDoubleMocked.callCount == 1)
                env.setterDouble.expectDouble(at: 0, key: key, value: value)
            }
            
            @Test("should call set once with double value 12.0 and different key")
            func shouldCallSetOnceWithDouble12AndDifferentKey() {
                let key = "any-other-key"
                let value = 12.0
                
                env.sut.setDouble(key, value: value)
                
                #expect(env.setterDouble.setDoubleMocked.callCount == 1)
                env.setterDouble.expectDouble(at: 0, key: key, value: value)
            }
            
            @Test("should call set twice with different double keys and values")
            func shouldCallSetTwiceWithDifferentDoubleKeysAndValues() {
                let key1 = "any-other-key"
                let value1 = 32.0
                let key2 = "any-key"
                let value2 = 423.0
                env.sut.setDouble(key1, value: value1)
                
                env.sut.setDouble(key2, value: value2)
                
                #expect(env.setterDouble.setDoubleMocked.callCount == 2)
                env.setterDouble.expectDouble(at: 0, key: key1, value: value1)
                env.setterDouble.expectDouble(at: 1, key: key2, value: value2)
            }
        }
        
        @Suite(".setData(_:value:)")
        struct SetDataTests {
            private let env = makeEnv()
            
            @Test("should call set once with data value and expected key")
            func shouldCallSetOnceWithDataValueAndExpectedKey() {
                let key = "any-key"
                let value = Data.mock()
                
                env.sut.setData(key, value: value)
                
                #expect(env.setterDouble.setDataMocked.callCount == 1)
                env.setterDouble.expectData(at: 0, key: key, value: value)
            }
            
            @Test("should call set once with same data but different key")
            func shouldCallSetOnceWithSameDataDifferentKey() {
                let key = "any-other-key"
                let value = Data.mock()
                
                env.sut.setData(key, value: value)
                
                #expect(env.setterDouble.setDataMocked.callCount == 1)
                env.setterDouble.expectData(at: 0, key: key, value: value)
            }
            
            @Test("should call set twice with different data and keys")
            func shouldCallSetTwiceWithDifferentDataAndKeys() {
                let key1 = "any-other-key"
                let value1 = Data("any-other-data".utf8)
                let key2 = "any-key"
                let value2 = Data("any-data".utf8)
                env.sut.setData(key1, value: value1)
                
                env.sut.setData(key2, value: value2)
                
                #expect(env.setterDouble.setDataMocked.callCount == 2)
                env.setterDouble.expectData(at: 0, key: key1, value: value1)
                env.setterDouble.expectData(at: 1, key: key2, value: value2)
            }
        }
        
        @Suite(".setDict(_:value:)")
        struct SetDictTests {
            private let env = makeEnv()
            
            @Test("should call set once with dict value and expected key")
            func shouldCallSetOnceWithDictValueAndExpectedKey() {
                let key = "any-key"
                let value = ["key": "value"]
                
                env.sut.setDict(key, value: value)
                
                #expect(env.setterDouble.setDictMocked.callCount == 1)
                env.setterDouble.expectDict(at: 0, key: key, value: value)
            }
            
            @Test("should call set once with same dict but different key")
            func shouldCallSetOnceWithSameDictDifferentKey() {
                let key = "any-other-key"
                let value = ["key": "value"]
                
                env.sut.setDict(key, value: value)
                
                #expect(env.setterDouble.setDictMocked.callCount == 1)
                env.setterDouble.expectDict(at: 0, key: key, value: value)
            }
            
            @Test("should call set twice with different dict and keys")
            func shouldCallSetTwiceWithDifferentDictAndKeys() {
                let key1 = "any-other-key"
                let value1 = ["key": "value"]
                let key2 = "any-key"
                let value2 = ["key2": "value2"]
                env.sut.setDict(key1, value: value1)
                
                env.sut.setDict(key2, value: value2)
                
                #expect(env.setterDouble.setDictMocked.callCount == 2)
                env.setterDouble.expectDict(at: 0, key: key1, value: value1)
                env.setterDouble.expectDict(at: 1, key: key2, value: value2)
            }
        }
    }
    
    private struct Environment {
        let getterDouble: PreferenceGetterDouble
        let setterDouble: PreferenceSetterDouble
        let sut: UserDefaultPreferenceAdapter
    }
    
    private static func makeEnv() -> Environment {
        let getterDouble = PreferenceGetterDouble()
        let setterDouble = PreferenceSetterDouble()
        let sut = UserDefaultPreferenceAdapter(
            getter: getterDouble,
            setter: setterDouble
        )
        
        return Environment(
            getterDouble: getterDouble,
            setterDouble: setterDouble,
            sut: sut
        )
    }
}
