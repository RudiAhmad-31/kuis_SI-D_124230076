import 'package:flutter/material.dart';
import 'package:kuis_sid_124230076/data/food_list.dart';

class DetailPage extends StatelessWidget {
  final Food food;
  const DetailPage({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: food.image.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.network(
                      food.image[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            Text(
              food.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text(
              food.category,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 10),

            Text(
              "Description",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Text(food.description),
            SizedBox(height: 16),

            Text(
              "Komposisi",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
            ),

            Text(
              "Jumlah Pesan",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      bottomNavigationBar: ElevatedButton(onPressed: () {}, child: Text("Checkout")),
    );
  }
}