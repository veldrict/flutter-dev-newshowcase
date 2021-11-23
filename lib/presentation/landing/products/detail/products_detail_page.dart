import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class ProductsDetailPage extends StatelessWidget {
  final int productId;
  const ProductsDetailPage({
    Key? key,
    @PathParam() required this.productId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
