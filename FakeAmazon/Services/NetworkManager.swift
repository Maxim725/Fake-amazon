import Foundation

protocol NetworkManagerProtocol {
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

class StoreClient: NetworkManagerProtocol {
    
    static let shared = StoreClient()
    
    private init() {}
    
    private let apiUrl = "https://fakestoreapi.com/products"
    
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        
        guard let url = URL(string: apiUrl) else { return }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            var result: Result<[Product], Error>
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            if let error = error {
                result = .failure(error)
            }
            
            guard let data = data else {
                result = .success([])
                return
            }
        
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                result = .success(products)
            }
            catch let error {
                result = .failure(error)
            }
            
        }.resume()
    }
}
