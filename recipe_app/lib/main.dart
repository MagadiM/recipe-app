// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose your Preferred Cuisine'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 20.0,
        children: [
          CuisineButton(
            cuisine: 'African',
            imageUrl: 'assets/african-cuisine.jpg',
            recipes: ['African Beef Stew', 'Jollof Rice', 'Pilau'],
          ),
          CuisineButton(
            cuisine: 'Asian',
            imageUrl: 'assets/asian-cuisine.jpg',
            recipes: ['Biryani', 'Paneer Tikka', 'Curry'],
          ),
          CuisineButton(
            cuisine: 'Mexican',
            imageUrl: 'assets/mexican-cuisine.jpg',
            recipes: ['Quesadillas', 'Tacos', 'Burritos'],
          ),
          CuisineButton(
            cuisine: 'Chinese',
            imageUrl: 'assets/chinese-cuisine.jpg',
            recipes: ['Dumplings', 'Sweet and Sour Pork', 'Kung Pao Chicken'],
          ),
        ],
      ),
    );
  }
}

class CuisineButton extends StatelessWidget {
  final String cuisine;
  final String imageUrl;
  final List<String> recipes;

  CuisineButton({
    required this.cuisine,
    required this.imageUrl,
    required this.recipes,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeScreen(cuisine: cuisine, recipes: recipes),
          ),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, height: 80),
          const SizedBox(height: 10),
          Text(
            cuisine,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  final String cuisine;
  final List<String> recipes;

  RecipeScreen({required this.cuisine, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cuisine Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text(recipes[index]),
          );
        },
      ),
    );
  }
}
