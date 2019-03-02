import 'package:cambodia_explorer/models/region.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Region regionInfo;

  const DetailScreen({Key key, this.regionInfo}) : super(key: key);

  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<Region> regionFamily = [];

  _checkParentRegion(Region region) {
    regionFamily.add(region);
    if (region.parent != null) {
      _checkParentRegion(region.parent);
    }
  }

  void initState() {
    super.initState();
    _checkParentRegion(widget.regionInfo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'អំពី​ ' + widget.regionInfo.nameKh,
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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: List.generate(regionFamily.length, (index) {
              var region = regionFamily[index];
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(text: (index != 0) ? 'ស្ថិតនៅក្នុង ' : ''),
                            TextSpan(
                                text: region.regionType.nameKh,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      region.nameKh,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      region.nameLatin,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
