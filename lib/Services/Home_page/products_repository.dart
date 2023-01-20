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
}
