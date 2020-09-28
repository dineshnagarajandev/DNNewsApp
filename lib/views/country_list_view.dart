import 'package:DNNewsApp/helper/constants.dart';
import 'package:DNNewsApp/helper/data.dart';
import 'package:DNNewsApp/models/category_model.dart';
import 'package:DNNewsApp/views/home.dart';
import 'package:flutter/material.dart';

class CountryListView extends StatefulWidget {
  @override
  _CountryListViewState createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  List<CountryModel> countries = new List<CountryModel>();
  int selectedCountryCode = AppConstants.selectedCountryCode;

  @override
  void initState() {
    super.initState();
    countries = getCounties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () async {
              print("Pop tapped");
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            }),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Flutter"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  print("Share tapped");
                },
                child: Container(),
              ))
        ],
      ),
      body: Container(
        child: ListView.builder(
            itemCount: countries.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (countries[index].countryCode == selectedCountryCode) {
                return Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          countries[index].countryImage,
                          Text(
                            countries[index].countryName,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 14),
                          ),
                          Icon(Icons.check),
                        ],
                      ))
                    ],
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    debugPrint("country tapped $index");
                    selectedCountryCode = index;
                    AppConstants.selectedCountryCode = index;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            countries[index].countryImage,
                            Text(
                              countries[index].countryName,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14),
                            ),
                            Text("")
                          ],
                        ))
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
