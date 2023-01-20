// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'package:dio/dio.dart';

class ProductsDetailsRepository {
  getProductDetails(String id) async {
    final client = Dio(
      BaseOptions(baseUrl: 'https://dummyjson.com'),
    );

    final response = await client.get('/products/$id');
    return response.data['products'];
  }
}
