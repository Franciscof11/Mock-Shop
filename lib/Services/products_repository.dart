// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'package:dio/dio.dart';

class ProductsRepository {
  getAllProducts() async {
    final client = Dio(
      BaseOptions(baseUrl: 'https://dummyjson.com'),
    );

    final response = await client.get('/products');
    return response.data['products'];
  }

/*   getSingleProduct(String id) async {
    final client = Dio(
      BaseOptions(baseUrl: API.base),
    );

    final response = await client.get('${API.allProcuts}/$id');
    Map<String, dynamic> posts = response.data;
    print(posts);
  } */

  getProductsBrand() async {
    final client = Dio(
      BaseOptions(baseUrl: 'https://dummyjson.com'),
    );

    final response = await client.get('/products?&select=brand');
    return response.data['products'];
  }
}
