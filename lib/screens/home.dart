import 'package:flutter/material.dart';
import 'package:kuis_sid_124230076/data/food_list.dart';
import 'package:kuis_sid_124230076/screens/detail.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("Selamat Datang $username"),
            Expanded(child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16),
              itemBuilder: (context, index){
                return _food(context, index);
              },
              itemCount: dummyFoods.length,))
            ],
        ),
      ),
    );
  }
  Widget _food(context, index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.grey,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Image.network(dummyFoods[index].image, height: 100, width: 100, fit: BoxFit.cover,)),
          Text(dummyFoods[index].name),
          Text(dummyFoods[index].category,style: TextStyle(color: Colors.grey),),


          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(food: dummyFoods[index],)));
          }, child: Text("Pesan"))
        ],
      ),
    );
  }
}