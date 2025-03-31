import 'package:flutter/material.dart';
import 'quizresults.dart';

void main() {
  runApp(BodyTypeQuizApp());
}

class BodyTypeQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: BodyTypeQuizPage(),
    );
  }
}

class BodyTypeQuizPage extends StatefulWidget {
  @override
  _BodyTypeQuizPageState createState() => _BodyTypeQuizPageState();
}

class _BodyTypeQuizPageState extends State<BodyTypeQuizPage> {
  int _selectedOption = -1;
  int _currentQuestion = 0;

  List<String> questions = [
    "How would you describe your shoulders?",
    "What best describes your waistline?",
    "How do your hips compare to your shoulders?"
  ];

  List<List<String>> options = [
    ["Narrow", "Medium", "Broad"],
    ["Defined", "Slightly Defined", "Not Defined"],
    ["Narrower", "Same Width", "Wider"]
  ];

  List<String> bodyTypes = ["Inverted Triangle", "Rectangle", "Hourglass", "Pear", "Apple"];

  Map<String, String> bodyTypeDescriptions = {
    "Inverted Triangle": "Your shoulders are broader than your hips, giving you a strong upper body look.",
    "Rectangle": "Your shoulders, waist, and hips are nearly the same width, creating a straight silhouette.",
    "Hourglass": "Your shoulders and hips are well-balanced with a defined waistline, creating an hourglass shape.",
    "Pear": "Your hips are wider than your shoulders, creating a pear-shaped silhouette.",
    "Apple": "Your midsection is fuller compared to your shoulders and hips, resulting in an apple-shaped look."
  };

  void _nextQuestion() {
    if (_currentQuestion < questions.length - 1) {
      setState(() {
        _currentQuestion++;
        _selectedOption = -1;
      });
    } else {
      // Define body types and their corresponding images
      Map<String, String> bodyTypeImages = {
        "Hourglass": 'lib/assets/Hourglass.png',
        "Pear": 'lib/assets/Pear.png',
        "Apple": 'lib/assets/Apple.png',
        "Rectangle": 'lib/assets/Rectangle.png',
        "Inverted Triangle": 'lib/assets/Inverted_Triangle.png',
      };

      // Determine the result based on selected options (adjust logic as needed)
      String bodyType = bodyTypes[_selectedOption % bodyTypes.length];

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizResultPage(
            bodyType: bodyType,
            description: bodyTypeDescriptions[bodyType]!,
            imagePath: bodyTypeImages[bodyType]!,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Body Type Quiz"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              questions[_currentQuestion],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 20),
            ...List.generate(options[_currentQuestion].length, (index) {
              return RadioListTile(
                title: Text(options[_currentQuestion][index], style: TextStyle(color: Colors.white)),
                value: index,
                groupValue: _selectedOption,
                onChanged: (value) {
                  setState(() {
                    _selectedOption = value as int;
                  });
                },
                activeColor: Colors.purpleAccent,
              );
            }),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              onPressed: _selectedOption == -1 ? null : _nextQuestion,
              child: Text("Next", style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}