// ignore_for_file: file_names, unused_local_variable, avoid_print

import 'package:dio/dio.dart';

import 'api_index.dart';

class ProductsRepository {
  getAllProducts() async {
    final client = Dio(
      BaseOptions(baseUrl: API.base),
    );

    final response = await client.get(API.allProcuts);
    Map<String, dynamic> posts = response.data;
    print(posts);
  }

  getSingleProduct(String id) async {
    final client = Dio(
      BaseOptions(baseUrl: API.base),
    );

    final response = await client.get('${API.allProcuts}/$id');
    Map<String, dynamic> posts = response.data;
    print(posts);
  }
}
