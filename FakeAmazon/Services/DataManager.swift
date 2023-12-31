import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    
    func setFavoriteStatus(productTitle: String, status: Bool) {
        userDefaults.set(status, forKey: productTitle)
    }
    
    func getFavoriteStatus(productTitle: String) -> Bool {
        userDefaults.bool(forKey: productTitle)
    }
}
