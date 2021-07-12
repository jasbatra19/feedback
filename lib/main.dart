import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Feedback(),
  ));
}

double score = 0;

class Feedback extends StatefulWidget {
  const Feedback({Key? key}) : super(key: key);

  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  double index = 0;
  int i = 0;
  List ques = [
    'Did you like the choice of colours?',
    'Rate your Experience',
    'Did we meet your expectations?',
    'How likely is it that you would recommend this app to your friend/colleagues',
    'Would u like to invest your time and resources in the apps like this? ',
    'Rate this app',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
      appBar: AppBar(
        title: Text("Feedback"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.5),
            color: Colors.blue.shade300,
          ),
          height: 300,
          width: 400,
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ques[i],
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30,
                  color: Colors.black87,
                ),
              ),
              Slider(
                activeColor: Colors.blue.shade900,
                inactiveColor: Colors.grey.shade700,
                value: index,
                label: index.round().toString(),
                onChanged: (valuesOfSlider) {
                  setState(() {
                    index = valuesOfSlider;
                  });
                },
                min: 0,
                max: 5,
                divisions: 5,
              ),
              Container(
                padding: EdgeInsets.all(1),
                alignment: Alignment.center,
                height: 60,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.black87,
                ),
                child: TextButton(
                  onPressed: () {
                    nextButton();
                  },
                  child: Text(
                    "Next",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void nextButton() {
    setState(() {
      if (i <= 5) {
        score += index;
        print(score);
        i++;
        if (i > 5) {
          Navigator.pop(context);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => newpage()),
              (Route<dynamic> route) => false);
        }
      }
      // if (i == 4) {
      //   score += index;
      //   print(score);
      // }
    });
  }
}

class newpage extends StatefulWidget {
  const newpage({Key? key}) : super(key: key);

  @override
  _newpageState createState() => _newpageState();
}

class _newpageState extends State<newpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(30),
            child: display(),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                  onPressed: () {
                    // reset();
                    score = 0;
                    Navigator.pop(context);
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => Feedback()),
                        (Route<dynamic> route) => false);
                  },
                  child: Text(
                    'Reset',
                    style: TextStyle(fontSize: 25),
                  )))
        ],
      ),
    );
  }

  Widget display() {
    if (score <= 10) {
      return Center(
        child: Container(
            height: 100,
            width: 200,
            margin: EdgeInsets.all(20.0),
            child: Text(
              'We are sorry for your inconvenience',
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            )),
      );
    } else if (score >= 11 && score <= 20) {
      return Center(
        child: Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'Hope we serve you better next time',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.yellowAccent.shade700,
                  fontWeight: FontWeight.bold),
            )),
      );
    } else {
      return Center(
        child: Container(
            margin: EdgeInsets.all(20.0),
            child: Text(
              'We hope you come back next time.',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            )),
      );
    }
  }
}
