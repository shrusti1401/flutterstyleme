import 'package:flutter/material.dart';

class bodytype extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Account"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account Form",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Complete your profile by filling in this account creation form."),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "First Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Last Name"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              decoration: InputDecoration(labelText: "Birthdate"),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Preferred Username"),
            ),
            SizedBox(height: 20),
            Text("Do you want to receive updates by email?"),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text("Yes"),
                    leading: Radio(value: true, groupValue: null, onChanged: (val) {}),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text("No"),
                    leading: Radio(value: false, groupValue: null, onChanged: (val) {}),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text("Create Account"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
