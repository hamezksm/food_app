// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Cart on _Cart, Store {
  Computed<List<Product>>? _$uniqueProductsComputed;

  @override
  List<Product> get uniqueProducts => (_$uniqueProductsComputed ??=
          Computed<List<Product>>(() => super.uniqueProducts,
              name: '_Cart.uniqueProducts'))
      .value;
  Computed<int>? _$totalQuantityComputed;

  @override
  int get totalQuantity => (_$totalQuantityComputed ??=
          Computed<int>(() => super.totalQuantity, name: '_Cart.totalQuantity'))
      .value;
  Computed<double>? _$totalAmountComputed;

  @override
  double get totalAmount => (_$totalAmountComputed ??=
          Computed<double>(() => super.totalAmount, name: '_Cart.totalAmount'))
      .value;

  late final _$productsAtom = Atom(name: '_Cart.products', context: context);

  @override
  ObservableList<Product> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<Product> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_CartActionController =
      ActionController(name: '_Cart', context: context);

  @override
  void addProduct(Product product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.addProduct');
    try {
      return super.addProduct(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeProduct(Product product) {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.removeProduct');
    try {
      return super.removeProduct(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo =
        _$_CartActionController.startAction(name: '_Cart.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
uniqueProducts: ${uniqueProducts},
totalQuantity: ${totalQuantity},
totalAmount: ${totalAmount}
    ''';
  }
}
