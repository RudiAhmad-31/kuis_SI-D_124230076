import 'package:flutter/material.dart';
import 'package:kuis_sid_124230076/data/food_list.dart';
import 'package:kuis_sid_124230076/screens/detail.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text("Selamat Datang $username"),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.75, // ⭐ penting supaya layout tidak ketimpa
                ),
                itemCount: dummyFoods.length,
                itemBuilder: (context, index) {
                  return _foodCard(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _foodCard(BuildContext context, int index) {
    final food = dummyFoods[index];

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              food.image,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              children: [
                Text(food.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(food.category,
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(food: food),
                ),
              );
            },
            child: const Text("Pesan"),
          ),
        ],
      ),
    );
  }
}
