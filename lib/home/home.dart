import 'package:cambodia_explorer/home/result.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String _query = '';

  _search(BuildContext context) {
    if (_query != '') {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => ResultScreen(query: _query)));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                width: screenWidth,
                child: Container(
                  height: 100,
                  child: Image.asset(
                    'assets/images/cambodia_map.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                width: screenWidth,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 8.0),
                          ),
                          textInputAction: TextInputAction.search,
                          onChanged: (String key){
                            _query = key;
                          },
                          onSubmitted: (String text) {
                            _search(context);
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _search(context);
                        },
                        icon: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
