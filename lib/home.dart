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
                    reset();
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

  void reset() {
    Navigator.of(context, rootNavigator: true).pop(context);
  }
}
