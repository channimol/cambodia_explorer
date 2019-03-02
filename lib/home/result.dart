import 'package:cambodia_explorer/home/detail.dart';
import 'package:cambodia_explorer/models/region.dart';
import 'package:cambodia_explorer/models/region_type.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String query;

  const ResultScreen({Key key, this.query}) : super(key: key);
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  RegionType regionType = RegionType(1, 'type1', 'khmer type1');
  List<Region> regions;

  void initState() {
    super.initState();
    RegionRequest.getRegion(widget.query).then((response) {
      setState(() {
        regions = response.result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
            padding: EdgeInsets.only(top: 10.0),
            children: () {
              if (regions != null) {
                return regions
                    .map((region) => _MyListItem(region: region))
                    .toList();
              } else {
                return [
                  Center(
                    child: CircularProgressIndicator(),
                  )
                ];
              }
            }()),
      ),
    );
  }
}

class _MyListItem extends StatelessWidget {
  final Region region;

  const _MyListItem({Key key, @required this.region}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      margin: EdgeInsets.only(bottom: 12.0),
      child: Material(
        color: Colors.white,
        elevation: 10.0,
        shadowColor: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailScreen(regionInfo: region)));
          },
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        region.nameKh,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(region.code)
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  region.nameLatin,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.book,
                        size: 15,
                        color: Colors.grey,
                      ),
                      Text(
                        region.regionType.nameLatin,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
