import Testing
import Foundation

import EasyMock

@testable import EasyUserDefaultPreference

@Suite("UserDefaultPreferenceGetterAdapter")
struct UserDefaultPreferenceGetterAdapterTests {
    @Suite(".getBool(value:)")
    struct BoolTests {
        private let key = "any"
        private let env = makeEnv(valueType: Bool.self)
        
        @Test("should return nil when no value is stored")
        func shouldReturnNilWhenNoValueIsStored() {
            env.providerDouble.valueMocked.mock(returning: nil)
            
            #expect(env.sut.getBool(key) == nil)
        }
        
        @Test("should return nil when no value is stored with wrong type")
        func shouldReturnNilWhenNoValueIsStoredWrongType() {
            let env = makeEnv(valueType: Int.self)
            env.providerDouble.valueMocked.mock(returning: 10)
            
            #expect(env.sut.getBool(key) == nil)
        }
        
        @Test("should return true when true is stored")
        func shouldReturnTrueWhenTrueIsStored() {
            let valueStub = true
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getBool(key) == valueStub)
        }
        
        @Test("should return false when false is stored")
        func shouldReturnFalseWhenFalseIsStored() {
            let valueStub = false
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getBool(key) == valueStub)
        }
        
        @Test("should call provider with expected key")
        func shouldCallProviderWithExpectedKey()  {
            let key = "any"
            
            _ = env.sut.getBool(key)
            
            #expect(env.providerDouble.valueMocked.spies == [key])
        }
        
        @Test("should call provider twice with different keys")
        func shouldCallProviderTwiceWithDifferentKeys() {
            let key2 = "any-other"
            _ = env.sut.getBool(key)
            
            _ = env.sut.getBool(key2)
            
            #expect(env.providerDouble.valueMocked.spies == [key, key2])
        }
    }
    
    @Suite(".getBool(value:)")
    struct IntTests {
        private let key = "any"
        private let env = makeEnv(valueType: Int.self)
        
        @Test("should return nil when no value is stored")
        func shouldReturnNilWhenNoValueIsStored() {
            env.providerDouble.valueMocked.mock(returning: nil)
            
            #expect(env.sut.getInt(key) == nil)
        }
        
        @Test("should return nil when no value is stored with wrong type")
        func shouldReturnNilWhenNoValueIsStoredWrongType() {
            let env = makeEnv(valueType: Bool.self)
            env.providerDouble.valueMocked.mock(returning: true)
            
            #expect(env.sut.getInt(key) == nil)
        }
        
        @Test("should return 10 when true is stored")
        func shouldReturnTrueWhenTrueIsStored() {
            let valueStub = 10
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getInt(key) == valueStub)
        }
        
        @Test("should return 12 when false is stored")
        func shouldReturnFalseWhenFalseIsStored() {
            let valueStub = 12
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getInt(key) == valueStub)
        }
        
        @Test("should call provider with expected key")
        func shouldCallProviderWithExpectedKey()  {
            let key = "any"
            
            _ = env.sut.getInt(key)
            
            #expect(env.providerDouble.valueMocked.spies == [key])
        }
        
        @Test("should call provider twice with different keys")
        func shouldCallProviderTwiceWithDifferentKeys() {
            let key2 = "any-other"
            _ = env.sut.getInt(key)
            
            _ = env.sut.getInt(key2)
            
            #expect(env.providerDouble.valueMocked.spies == [key, key2])
        }
    }
    
    @Suite(".getDouble(value:)")
    struct DoubleTests {
        private let key = "any"
        private let env = makeEnv(valueType: Double.self)
        
        @Test("should return nil when no value is stored")
        func shouldReturnNilWhenNoValueIsStored() {
            env.providerDouble.valueMocked.mock(returning: nil)
            
            #expect(env.sut.getDouble(key) == nil)
        }
        
        @Test("should return nil when no value is stored with wrong type")
        func shouldReturnNilWhenNoValueIsStoredWrongType() {
            let env = makeEnv(valueType: Bool.self)
            env.providerDouble.valueMocked.mock(returning: true)
            
            #expect(env.sut.getDouble(key) == nil)
        }
        
        @Test("should return 10 when true is stored")
        func shouldReturnTrueWhenTrueIsStored() {
            let valueStub = 10.0
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getDouble(key) == valueStub)
        }
        
        @Test("should return 12 when false is stored")
        func shouldReturnFalseWhenFalseIsStored() {
            let valueStub = 12.0
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getDouble(key) == valueStub)
        }
        
        @Test("should call provider with expected key")
        func shouldCallProviderWithExpectedKey()  {
            let key = "any"
            
            _ = env.sut.getDouble(key)
            
            #expect(env.providerDouble.valueMocked.spies == [key])
        }
        
        @Test("should call provider twice with different keys")
        func shouldCallProviderTwiceWithDifferentKeys() {
            let key2 = "any-other"
            _ = env.sut.getDouble(key)
            
            _ = env.sut.getDouble(key2)
            
            #expect(env.providerDouble.valueMocked.spies == [key, key2])
        }
    }
    
    @Suite(".getData(value:)")
    struct DataTests {
        private let key = "any"
        private let env = makeEnv(valueType: Data.self)
        
        @Test("should return nil when no value is stored")
        func shouldReturnNilWhenNoValueIsStored() {
            env.providerDouble.valueMocked.mock(returning: nil)
            
            #expect(env.sut.getData(key) == nil)
        }
        
        @Test("should return nil when no value is stored with wrong type")
        func shouldReturnNilWhenNoValueIsStoredWrongType() {
            let env = makeEnv(valueType: Bool.self)
            env.providerDouble.valueMocked.mock(returning: true)
            
            #expect(env.sut.getData(key) == nil)
        }
        
        @Test("should return when true is stored")
        func shouldReturnTrueWhenTrueIsStored() {
            let valueStub = Data.mock()
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getData(key) == valueStub)
        }
        
        @Test("should return other data when false is stored")
        func shouldReturnFalseWhenFalseIsStored() {
            let valueStub = Data()
            env.providerDouble.valueMocked.mock(returning: valueStub)
            
            #expect(env.sut.getData(key) == valueStub)
        }
        
        @Test("should call provider with expected key")
        func shouldCallProviderWithExpectedKey()  {
            let key = "any"
            
            _ = env.sut.getData(key)
            
            #expect(env.providerDouble.valueMocked.spies == [key])
        }
        
        @Test("should call provider twice with different keys")
        func shouldCallProviderTwiceWithDifferentKeys() {
            let key2 = "any-other"
            _ = env.sut.getData(key)
            
            _ = env.sut.getData(key2)
            
            #expect(env.providerDouble.valueMocked.spies == [key, key2])
        }
    }
    
    private struct Environment<T: Equatable> {
        let sut: UserDefaultPreferenceGetterAdapter
        let providerDouble: PreferenceGetterProviderDouble<T>
    }
    
    private static func makeEnv<T: Equatable>(valueType: T.Type) -> Environment<T> {
        let providerDouble = PreferenceGetterProviderDouble<T>()
        let sut = UserDefaultPreferenceGetterAdapter(provider: providerDouble)
        
        return Environment(sut: sut, providerDouble: providerDouble)
    }
}
