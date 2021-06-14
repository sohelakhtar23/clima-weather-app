import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, bottom: 30),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: TextField(
                    decoration: kTextFieldInputDecoration,
                    style: TextStyle(color: Colors.black),
                    onChanged: (value) {
                      cityName = value;
                    }),
              ),
              OutlinedButton(
                onPressed: () {
                  print(cityName);
                  Navigator.pop(context, cityName);
                },
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.teal,
                  // side: BorderSide(color: Colors.grey, width: 2),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
