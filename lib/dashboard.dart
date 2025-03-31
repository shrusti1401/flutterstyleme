import 'package:flutter/material.dart';
import 'package:styleme/mytype.dart';

class WardrobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text("Wardrobe Dashboard", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BodyTypeQuizApp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Find Your Body Type", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            SizedBox(height: 50),
            Text(
              "Welcome to StyleMe",
              style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Enhance your style with personalized recommendations",
              style: TextStyle(color: Colors.white54, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard, color: Colors.white), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.checkroom, color: Colors.white), label: 'Wardrobe'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, color: Colors.blueAccent, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.style, color: Colors.white), label: 'Style'),
          BottomNavigationBarItem(icon: Icon(Icons.public, color: Colors.white), label: 'Explore'),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: WardrobePage(),
    debugShowCheckedModeBanner: false,
  ));
}
