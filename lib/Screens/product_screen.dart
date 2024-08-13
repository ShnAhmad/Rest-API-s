import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_apis/Models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Future<ProductModel> getProductApi() async {
    final response = await http.get(
        Uri.parse('https://mocki.io/v1/ddd86c87-81d5-4b01-83f1-50c2481d6dc0'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductModel.fromJson(data);
    } else {
      return ProductModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: getProductApi(),
                builder: (context, AsyncSnapshot<ProductModel> snapshot) {
                  if (!snapshot.hasData) {
                    return const Text("loading");
                  } else {
                    return const Text('data');
                  }
                })
          ],
        ));
  }
}
