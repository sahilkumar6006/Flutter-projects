import 'package:first_app/model/category_model.dart';
import 'package:first_app/model/piza_model.dart';
import 'package:first_app/service/category_data.dart';
import 'package:first_app/service/pizza_data.dart';
import 'package:first_app/service/widget_support.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<PizaModel> pizza = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    pizza = getPizzaList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 50,
                        width: 110,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(
                          height: 50,
                          width: 110,
                        ),
                      ),
                      Text(
                        "Order your favourite food!",
                        style: AppWidget.simpleTextFieldStyle(),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/boy.jpg",
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 60,
                        width: 60,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ---------- Search Bar ----------
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search food or restaurant",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // ---------- Categories ----------
              const Text(
                "Categories",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height:60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryTile(
                      image: categories[index].image,
                      name: categories[index].name,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              // ---------- Popular Pizzas ----------
              const Text(
                "Popular Pizzas",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: pizza.length,
                  itemBuilder: (context, index) {
                    return PizzaTile(
                      image: pizza[index].image,
                      name: pizza[index].name,
                      price: pizza[index].price,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- Category Tile Widget ----------
class CategoryTile extends StatelessWidget {
  final String name;
  final String image;

  const CategoryTile({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15.0),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffef2b39),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              height: 50,
              width: 50,
            ),
          ),
          const SizedBox(width: 10),
          Text(name, style: AppWidget.whiteTextFieldStyle()),
        ],
      ),
    );
  }
}

// ---------- Pizza Tile Widget ----------
class PizzaTile extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const PizzaTile({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Pizza image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Container(
                height: 140,
                width: 100,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          // Info section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "\$${price}",
                  style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xffef2b39),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(color: Colors.white),
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
