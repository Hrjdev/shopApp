import 'package:flutter/material.dart';
import 'package:shop_app/components/product_tile.dart';
import 'package:shop_app/services/api_service.dart';
import 'package:shop_app/models/vehicle_model.dart';
import 'package:shop_app/views/cart_screen.dart';
import 'package:shop_app/views/product_detail_screen.dart';

class ProductsScreen extends StatefulWidget {
  final String username;
  final String password;

  const ProductsScreen({
    super.key,
    required this.password,
    required this.username,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ApiService apiService = ApiService();
  List<Data> allProducts = [];
  bool isLoading = false;
  String errMsg = "";
  Set<int> cartIds = {};

  Future<void> loadProd() async {
    try {
      setState(() {
        isLoading = true;
      });
      final vehicleData = await apiService.fetchVehicles();
      setState(() {
        allProducts = vehicleData.data ?? [];
      });
    } catch (e) {
      setState(() {
        errMsg = "An error occurred.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    loadProd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Explore",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(
                            products: allProducts,
                            cartIds: cartIds,
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_bag_outlined),
                    iconSize: 32,
                  ),
                ],
              ),
              SizedBox(height: 2),
              Text(
                "Find everything you are looking for.",
                style: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                  onChanged: (value) {},
                ),
              ),
              SizedBox(height: 16),

              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(12),
                child: Image.network(
                  "https://images.unsplash.com/photo-1614679608107-938a8d4984a9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  width: double.infinity,
                  height: 80,
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(height: 16),

              if (isLoading == true)
                Center(child: CircularProgressIndicator())
              else if (errMsg.isNotEmpty)
                Center(child: Text(errMsg))
              else
                Expanded(
                  child: GridView.builder(
                    itemCount: allProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final product = allProducts[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                cartIds: cartIds,
                                product: product,
                              ),
                            ),
                          );
                        },
                        child: ProductTile(product: product),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
