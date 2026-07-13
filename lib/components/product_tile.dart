import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/models/vehicle_model.dart';

class ProductTile extends StatelessWidget {
  final Data product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Hero(
              tag: product.id ?? 0,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(product.image ?? ""),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.make ?? "",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1),
                Text(
                  product.model ?? "",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1),
                Text(
                  NumberFormat.currency(
                    locale: 'en_US',
                    symbol: '\$',
                    decimalDigits: 0,
                  ).format(product.price),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
