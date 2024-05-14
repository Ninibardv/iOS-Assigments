import XCTest
@testable import UnitTestingAssignment

protocol NetworkManagerProtocol {
    func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

class CartViewModelTests: XCTestCase {
    
    var viewModel: CartViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = CartViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    
    func testAddProduct() {
        // Test adding a product to the cart
        viewModel.allproducts = [Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 0)]
        viewModel.addProduct(withID: 1)
        XCTAssertEqual(viewModel.selectedProducts.count, 1)
    }
    
    func testAddRandomProduct() {
        // Test adding a random product to the cart
        viewModel.allproducts = [Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 0)]
        viewModel.addRandomProduct()
        XCTAssertTrue(viewModel.selectedProducts.count > 0)
    }
    
    func testRemoveProduct() {
        // Test removing a product from the cart
        viewModel.selectedProducts = [Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 1)]
        viewModel.removeProduct(withID: 1)
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
    }
    
    func testClearCart() {
        // Test clearing the cart
        viewModel.selectedProducts = [Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 1)]
        viewModel.clearCart()
        XCTAssertEqual(viewModel.selectedProducts.count, 0)
    }
    
    func testSelectedItemsQuantity() {
        // Test calculating selected items quantity
        viewModel.selectedProducts = [
            Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 2),
            Product(id: 2, description: "Product B", price: 15.0, selectedQuantity: 1)
        ]
        XCTAssertEqual(viewModel.selectedItemsQuantity, 3)
    }
    
    func testTotalPrice() {
        // Test calculating total price
        viewModel.selectedProducts = [
            Product(id: 1, description: "Product A", price: 10.0, selectedQuantity: 2),
            Product(id: 2, description: "Product B", price: 15.0, selectedQuantity: 1)
        ]
        XCTAssertEqual(viewModel.totalPrice, 35.0)
    }
    
    
    class MockNetworkManager: NetworkManagerProtocol {
        func fetchProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
            
            // Mock implementation: Return a list of mocked products
            let mockedProducts = [
                Product(id: 1, description: "Mocked Product 1", price: 10.0, selectedQuantity: nil),
                Product(id: 2, description: "Mocked Product 2", price: 15.0, selectedQuantity: nil)
            ]
            completion(.success(mockedProducts))
        }
    }
}
