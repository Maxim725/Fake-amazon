import Foundation

protocol ProductListViewModelProtocol {
    var listRows: [DetailProductViewModel] { get }
    func fetchListRows()
}

class ProductListViewModel: ProductListViewModelProtocol, ObservableObject {
    @Published var listRows = [DetailProductViewModel]()
    
    func fetchListRows() {
        StoreClient.shared.fetchProducts { [weak self] result in
            switch result {
            case .success(let products):
                products.forEach { [weak self] product in
                    let detailViewModel = DetailProductViewModel(product: product)
                        self?.listRows.append(detailViewModel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
