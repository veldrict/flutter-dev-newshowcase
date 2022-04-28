import 'package:flutter/material.dart';
import 'package:flutter_dev_newshowcase/presentation/core/i10n/l10n.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    I10n i10n = I10n.of(context);
    return Scaffold(
      body: ListView(
        children: [
          Text(''),
        ],
      ),
    );
  }
}
