// ignore_for_file: file_names

import 'package:get/get.dart';

import 'products_details_repository.dart';

class ProductsDetailsController extends GetxController {
  ProductsDetailsRepository productsDetailsRepository =
      ProductsDetailsRepository();
  RxBool loading = false.obs;
  List products = [].obs;

  ProductsDetailsController() {
    loadingProductDetails();
  }

  loadingProductDetails() async {
    loading(true);
    products = await productsDetailsRepository.getProductDetails('');
    loading(false);
  }
}
