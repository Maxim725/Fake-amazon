import SwiftUI

struct ProductListView: View {
    
    @StateObject private var viewModel = ProductListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.listRows, id: \.title) { detailProductView in
                NavigationLink(destination: DetailProductView(viewModel: detailProductView)) {
                    ProductRowView(viewModel: detailProductView)
                }
            }
            .navigationBarTitle("Fake Amazon")
        }
        .onAppear {
            viewModel.fetchListRows()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
