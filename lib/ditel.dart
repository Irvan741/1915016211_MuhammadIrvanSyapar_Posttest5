import 'package:flutter/material.dart';

class Ditel extends StatelessWidget {
  final String? namaLagu;
  final String? filePhoto;
  final String? jmlView;
  const Ditel({
    Key? key,
    @required this.namaLagu,
    @required this.filePhoto,
    @required this.jmlView,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PLAYING FROM PLAYLIST",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "Paw's Letter",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: width,
                height: 700,
                color: Colors.black87,
              ),
              Container(
                width: width / 1.1,
                height: 300,
                // color: Colors.black,
                margin: EdgeInsets.only(left: 17, top: 70),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(this.filePhoto.toString()))),
              ),
              Container(
                width: width / 1.1,
                height: 50,
                // color: Colors.white,
                margin: EdgeInsets.only(left: 17, top: 420),
                child: Text(
                  namaLagu.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: width / 1.1,
                height: 50,
                // color: Colors.white,
                margin: EdgeInsets.only(left: 17, top: 450),
                child: Text(
                  "Paw's Letter",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: 350,
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.only(left: 17, top: 485),
              ),
              Container(
                width: 350,
                height: 100,
                // color: Colors.amber,
                margin: EdgeInsets.only(left: 17, top: 490),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.skip_previous,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.pause_circle,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Icon(
                        Icons.skip_next,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
