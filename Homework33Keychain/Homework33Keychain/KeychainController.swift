import UIKit
import SwiftyKeychainKit

protocol AuthService {
    func set(_ value: String, for key: String)
    func update(_ value: String, for key: String)
    func getValue(for key: String) -> String?
    func removeValue(for key: String)
    func clean()
}

class KeychainController: AuthService {
    
    private init() {}
    
    static let shared = KeychainController()
    
    let keychain = Keychain()
    let service = "com.mir.sec"
    let queue = DispatchQueue(label: "keychain")
    
    func set(_ value: String, for key: String) {
        queue.sync {
            do {
                let accessTokenKey = KeychainKey<String>.genericPassword(key: key, service: "com.mir.sec")
                
                try keychain.set(value, for: accessTokenKey)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func update(_ value: String, for key: String) {
        queue.sync {
            do {
                let accessTokenKey = KeychainKey<String>.genericPassword(key: key, service: "com.mir.sec")
                
                try keychain.set(value, for: accessTokenKey)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func getValue(for key: String) -> String? {
        var value: String? = nil
        queue.sync {
            do {
                let accessTokenKey = KeychainKey<String>.genericPassword(key: key, service: "com.mir.sec")
                
                value = try keychain.get(accessTokenKey)
            } catch {
                print(error.localizedDescription)
            }
            
        }
        return value
    }
    
    func removeValue(for key: String) {
        queue.sync {
            do {
                let accessTokenKey = KeychainKey<String>.genericPassword(key: key, service: "com.mir.sec")
                
                try keychain.remove(accessTokenKey)
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
    
    func clean() {
        queue.sync {
            do {
                try keychain.removeAll()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}
