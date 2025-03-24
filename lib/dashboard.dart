import 'package:flutter/material.dart';
import 'package:styleme/mytype.dart'; // Import mytype.dart

class WardrobePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            SizedBox(width: 10),
            Text("shrusti", style: TextStyle(color: Colors.white)),
            Icon(Icons.arrow_drop_down, color: Colors.white),
            Spacer(),
            Icon(Icons.diamond, color: Colors.blueAccent),
            SizedBox(width: 15),
            Icon(Icons.notifications, color: Colors.white),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("WARDROBE", style: TextStyle(color: Colors.white, fontSize: 20)),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BodyMeasurementForm()), // Navigate to mytype.dart
                    );
                  },
                  child: Text(
                    "bodytype",
                    style: TextStyle(color: Colors.white54, fontSize: 18, decoration: TextDecoration.underline),
                  ),
                ),
                SizedBox(width: 20),
                Text("SHOPPING", style: TextStyle(color: Colors.white54, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange, Colors.green],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Bulk add", style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text("Try the bulk add feature to add multiple items.", style: TextStyle(color: Colors.white70)),
                    ],
                  ),
                  Icon(Icons.checkroom, color: Colors.white, size: 40),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade900,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Text("Clothes", style: TextStyle(color: Colors.white)),
                  SizedBox(width: 20),
                  Text("Outfits", style: TextStyle(color: Colors.white54)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text("2\nclothing items", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text("Tops", style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard, color: Colors.white), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.checkroom, color: Colors.white), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, color: Colors.blueAccent, size: 40), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.style, color: Colors.white), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.public, color: Colors.white), label: ''),
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
