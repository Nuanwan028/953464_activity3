import 'package:firstapp/pages/detail.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(
        children: [
          MyBox(
            "What is computer?",
            "Computer is an electronic device that manipulates information, or data.",
            "https://cdn.pixabay.com/photo/2022/09/05/18/52/tomato-7434955_1280.jpg",
          ),
          SizedBox(height: 24),
          MyBox(
            "What is Flutter?",
            "Flutter is an open-source UI software development kit created by Google.",
            "https://cdn.pixabay.com/photo/2024/02/24/17/37/lemons-8594421_1280.jpg",
          ),
          SizedBox(height: 24),
          MyBox(
            "What is Dart?",
            "Dart is a programming language designed for building web, server, desktop, and mobile applications.",
            "https://cdn.pixabay.com/photo/2020/03/11/13/18/food-4922138_1280.jpg",
          ),
        ],
      ),
    );
  }

  Widget MyBox(String title, String subtitle, String imageUrl) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 175,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 205, 248),
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 15)),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              print("Next Page >>");
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: Text("read more", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }
}
