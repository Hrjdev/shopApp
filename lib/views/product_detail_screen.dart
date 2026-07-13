import 'package:flutter/material.dart';
import 'package:shop_app/models/vehicle_model.dart';
import 'package:intl/intl.dart';

class ProductDetailScreen extends StatefulWidget {
  final Data product;
  final Set<int> cartIds;
  const ProductDetailScreen({
    super.key,
    required this.cartIds,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Back"), backgroundColor: Colors.white),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: widget.product.id ?? 0,
                child: Image.network(
                  widget.product.image ?? "",
                  height: 350,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsetsGeometry.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.product.make ?? "",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      widget.product.model ?? "",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      widget.product.description ?? "",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 10),

                    Text(
                      NumberFormat.currency(
                        locale: 'en_US',
                        symbol: '\$',
                        decimalDigits: 0,
                      ).format(widget.product.price),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          widget.cartIds.add(widget.product.id ?? 0);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: Duration(milliseconds: 700),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              content: Text("Added to cart"),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.green.shade900,
                            ),
                          );
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade600,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(16),
                        ),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
