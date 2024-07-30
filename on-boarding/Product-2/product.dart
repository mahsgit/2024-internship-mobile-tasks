void main() {
  var manager = ProductManager();

  // Adding products
  manager.add(Product(name: 'phone', description: 'best phone', price: 12000.0));
  manager.add(Product(name: 'earphone', description: 'best earphone', price: 800.0));

  // Viewing all products
  manager.viewAll();

  // Viewing a single product
  manager.searchSingleProduct('phone');

  // Editing a product
  manager.edit('phone', newName: 'IPHONE', newPrice: 25000.0);

  // Viewing updated product
  manager.searchSingleProduct('IPHONE');

  // Deleting a product
  manager.delete('IPHONE');

  // Viewing all products after deletion
  manager.viewAll();
}

class Product {
  String? name;
  String? description;
  double? price;

  // Constructor
  Product({required this.name, required this.description, required this.price});

  @override
  String toString() {
    return 'Product: $name, Description: $description, Price: \$$price';
  }
}

class ProductManager extends Product {
  List<Product> productList = [];

  ProductManager() : super(name: '', description: '', price: 0);

  // Add products
  void add(Product p) {
    productList.add(p);
    print("Product added successfully");
  }

  // View all products
  void viewAll() {
    if (productList.isEmpty) {
      print("No products available");
    } else {
      for (var product in productList) {
        print(product);
      }
    }
  }

  // View a single product
  // The type is product

  Product? searchSingleProduct(String name) {
    for (var p in productList) {
      if (p.name == name) {
        print(p);
        return p;
      }
    }
    print("Product not found");
    return null;
  }

  // Edit product (update name, description, price)
  void edit(String name, {String? newName, String? newDescription, double? newPrice}) {
    var product = searchSingleProduct(name);
    if (product != null) {
      product.name = newName ?? product.name;
      product.description = newDescription ?? product.description;
      product.price = newPrice ?? product.price;
      print("Product $name updated successfully");
    } else {
      print("Couldn't find product with the name $name");
    }
  }

  // Delete a product
  void delete(String name) {
    var product = searchSingleProduct(name);
    if (product != null) {
      productList.remove(product);
      print("Product $name deleted successfully");
    } else {
      print("Product $name not found");
    }
  }
}
