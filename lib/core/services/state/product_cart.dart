import 'package:foodapp/models/product.dart';
import 'package:mobx/mobx.dart';

part 'product_cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  @observable
  ObservableList<Product> products = ObservableList<Product>();

  @computed
  List<Product> get uniqueProducts =>
      products.toSet().toList(); //get unique products

  @computed
  int get totalQuantity => products.length;

  @action
  void addProduct(Product product) {
    products.add(product);
  }

  @action
  void removeProduct(Product product) {
    products.remove(product);
  }

  @computed
  double get totalAmount =>
      products.fold(0, (sum, product) => sum + (product.price ?? 0));

  @action
  void clearCart() {
    products.clear();
  }

  int getProductQuantity(Product product) {
    return products.where((p) => p == product).length;
  }
}
