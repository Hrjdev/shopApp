import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_app/components/minCardTile.dart';
import 'package:shop_app/models/vehicle_model.dart';

class CartScreen extends StatefulWidget {
  final List<Data> products;
  final Set<int> cartIds;

  const CartScreen({super.key, required this.products, required this.cartIds});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProducts = widget.products
        .where((element) => widget.cartIds.contains(element.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, title: Text("Cart")),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: cartProducts.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_basket_outlined,
                              size: 86,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Cart is empty",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: cartProducts.length,
                        itemBuilder: (context, index) {
                          final product = cartProducts[index];

                          return MinCardTile(
                            name: product.make ?? "",
                            tagline: product.model ?? "",
                            price: NumberFormat.currency(
                              locale: 'en_US',
                              symbol: '\$',
                              decimalDigits: 0,
                            ).format(product.price),
                            imageUrl: product.image ?? "",
                            onRemove: () {
                              setState(() {
                                widget.cartIds.remove(product.id);
                              });
                            },
                          );
                        },
                      ),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: cartProducts.isEmpty
                      ? Colors.grey
                      : Colors.green.shade600,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(16),
                  ),
                ),
                child: Text("Order Now", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
