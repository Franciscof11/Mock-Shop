import 'package:get/get.dart';

import 'Products_repository.dart';

class ProductsController extends GetxController {
  ProductsRepository productsRepository = ProductsRepository();
  RxBool loading = false.obs;
  List products = [].obs;
  var showGrid = false.obs;

  ProductsController() {
    loadProductsFromRepo();
  }

  loadProductsFromRepo() async {
    loading(true);
    products = await productsRepository.getAllProducts();
    loading(false);
  }

  toggleGrid() {
    showGrid(!showGrid.value);
  }
}
