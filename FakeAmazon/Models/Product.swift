import Foundation

struct Product: Decodable {
    let title: String
    let image: URL
    let description: String
    let category: String
    let price: Double
    
    static func getProduct() -> Product {
        Product(title: "Unknown Title",
                image: URL(string: "")!,
                description: "Unknown description",
                category: "Unknown category",
                price: -1)
    }
}
