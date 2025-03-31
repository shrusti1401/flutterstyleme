import 'package:flutter/material.dart';

class StyleMePage extends StatefulWidget {
  @override
  _StyleMePageState createState() => _StyleMePageState();
}

class _StyleMePageState extends State<StyleMePage> {
  String selectedCategory = '';
  String selectedBodyType = 'Hourglass';

  final Map<String, Map<String, List<String>>> bodyTypeImages = {
    'Hourglass': {
      "Tops": ['lib/assets/hourglasstops.jpg'],
      "Jeans": ['lib/assets/hourglassjeans.jpg'],
      'Dresses': ['lib/assets/hourglassdresses.jpg'],
    },
    'Pear': {
      "Tops": ['lib/assets/peartops.jpg'],
      "Jeans": ['lib/assets/pearjeans.jpg'],
      "Dresses": ['lib/assets/peardresses.jpg'],
    },
    'Apple': {
      "Tops": ['lib/assets/newappletops.jpg', 'lib/assets/newappletops2.jpg'],
      "Jeans": ['lib/assets/applejeans.jpg'],
      "Dresses": ['lib/assets/appledresses.jpg'],
    },
    "Rectangle": {
      "Tops": ['lib/assets/rectangletops.jpg'],
      "Jeans": ['lib/assets/rectanglejeans.jpg'],
      "Dresses": ['lib/assets/rectangledresses.jpg'],
    },
    'Inverted Triangle': {
      "Tops": ['lib/assets/inverted_top1.jpg'],
      "Jeans": ['lib/assets/inverted_jeans1.jpg'],
      "Dresses": ['lib/assets/inverted_dress1.jpg'],
    },
  };

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  void selectBodyType(String bodyType) {
    setState(() {
      selectedBodyType = bodyType;
      selectedCategory = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StyleMe"),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text("Select Your Body Type:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            _bodyTypeDropdown(),
            SizedBox(height: 20),
            Text("Choose a Category:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _categoryButton("Tops"),
                SizedBox(width: 10),
                _categoryButton("Jeans"),
                SizedBox(width: 10),
                _categoryButton("Dresses"),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: selectedCategory.isNotEmpty
                  ? GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 1,
                      ),
                      itemCount: bodyTypeImages[selectedBodyType]?[selectedCategory]?.length ?? 0,
                      itemBuilder: (context, index) {
                        String imagePath = bodyTypeImages[selectedBodyType]![selectedCategory]![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(imagePath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity),
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text("Select a category to see outfit suggestions",
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryButton(String title) {
    return ElevatedButton(
      onPressed: () => selectCategory(title),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }

  Widget _bodyTypeDropdown() {
    return DropdownButton<String>(
      value: selectedBodyType,
      onChanged: (String? newValue) {
        if (newValue != null) {
          selectBodyType(newValue);
        }
      },
      items: bodyTypeImages.keys.map<DropdownMenuItem<String>>((String bodyType) {
        return DropdownMenuItem<String>(
          value: bodyType,
          child: Text(bodyType),
        );
      }).toList(),
    );
  }
}
