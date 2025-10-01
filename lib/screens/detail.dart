import 'package:flutter/material.dart';
import 'package:kuis_sid_124230076/data/food_list.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(food.image, height: 200, fit: BoxFit.cover),
            SizedBox(height: 16),
            Text(food.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(food.category,
                style: TextStyle(color: Colors.grey, fontSize: 16)),
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(onPressed: () {}, child: Text("Checkout")),
    );
  }
}