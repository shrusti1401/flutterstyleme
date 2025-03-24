import 'package:flutter/material.dart';

class BodyMeasurementForm extends StatefulWidget {
  @override
  _BodyMeasurementFormState createState() => _BodyMeasurementFormState();
}

class _BodyMeasurementFormState extends State<BodyMeasurementForm> {
  final _formKey = GlobalKey<FormState>();
  final chestController = TextEditingController();
  final waistController = TextEditingController();
  final hipController = TextEditingController();

  String? bodyShape;

  void calculateBodyShape() {
    double chest = double.tryParse(chestController.text) ?? 0.0;
    double waist = double.tryParse(waistController.text) ?? 0.0;
    double hip = double.tryParse(hipController.text) ?? 0.0;

    setState(() {
      if (waist < chest && waist < hip) {
        if (chest > hip) {
          bodyShape = 'Inverted Triangle';
        } else if (chest < hip) {
          bodyShape = 'Pear';
        } else {
          bodyShape = 'Hourglass';
        }
      } else if (chest == waist && waist == hip) {
        bodyShape = 'Rectangle';
      } else if (waist > chest && waist > hip) {
        bodyShape = 'Apple';
      } else {
        bodyShape = 'Unknown';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Type Calculator'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'lib/assets/bodytype.jpg',
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 20),
            Text(
              'Enter Your Measurements',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: chestController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Chest (cm)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter chest size' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: waistController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Waist (cm)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter waist size' : null,
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: hipController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Hip (cm)',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) => value!.isEmpty ? 'Enter hip size' : null,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  calculateBodyShape();
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.blueAccent,
              ),
              child: Text(
                'Calculate Body Shape',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            if (bodyShape != null)
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Your Body Shape: $bodyShape',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
