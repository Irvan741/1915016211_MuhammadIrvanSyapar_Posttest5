import 'package:flutter/material.dart';
import 'package:posttest5/Posttest3.dart';
import 'package:posttest5/ditel.dart';

class FavouriteBandPage extends StatefulWidget {

  const FavouriteBandPage({Key? key}) : super(key: key);

  @override
  State<FavouriteBandPage> createState() => _FavouriteBandPageState();
}

class _FavouriteBandPageState extends State<FavouriteBandPage> {

  List<String> songList = [
    "can i get a hi?",
    "it's ok!",
    ".enogh",
    "Muhammad Irvan Syapar",
  ];
  List<String> viewerList = [
    "8,198",
    "4,124",
    "<1,000",
    "1915016211",
  ];
  List<String> imageList = [
    "assets/can-i-get-a-hi.jpg",
    "assets/it's ok.jpg",
    "assets/enough.png",
    "assets/profil.jpg"
  ];
  Widget Pl(String nomor, String foto, String judul, String jumlah) {
    return ListTile(
      leading: Wrap(
        children: [
          Container(
              width: 25,
              height: 50,
              margin: EdgeInsets.only(right: 10),
              alignment: Alignment.center,
              child: Text(
                nomor,
                style: TextStyle(color: Colors.white),
              )),
          Container(
            width: 50,
            height: 50,
            decoration:
                BoxDecoration(image: DecorationImage(image: AssetImage(foto))),
          ),
        ],
      ),
      title: Text(
        judul,
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        jumlah,
        style: TextStyle(color: Colors.white),
      ),
      trailing: Icon(
        Icons.more_vert,
        color: Colors.white,
      ),
    );
  }

  Widget StackInMyHead(double w, double h) {
    return Stack(
      children: [
        Container(
          width: w,
          height: h / 2,

          // color: Colors.green,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/pawsletter.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: w,
          height: h / 15,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          alignment: Alignment.topLeft,
        ),
        Container(
          width: w,
          height: h / 2,
          alignment: Alignment.bottomLeft,
          child: Container(
            width: w,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black,
                gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [Colors.green.withOpacity(0.0), Colors.black],
                    stops: [0.0, 1.0])),
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Paw's Letter",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: "TT Commons Bold"),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.black,
        child: ListView(
          children: [
            StackInMyHead(width, height),
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  Container(
                    width: width,
                    // color: Colors.red,
                    child: Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        "463 monthly listeners",
                        style: TextStyle(color: Colors.white60),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    children: [
                      Container(
                        width: width / 3,
                        height: height / 18,
                        margin: EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 5,
                              primary: Colors.transparent,
                              shadowColor: Colors.transparent.withOpacity(0.1),
                              side: BorderSide(
                                color: Colors.white54,
                              )),
                          child: Text("Add Songs"),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => Posttest3()));
                          },
                        ),
                      ),
                      Container(
                        width: 30,
                        height: 20,
                        // color: Colors.amber,
                        margin: EdgeInsets.only(top: 10, left: 10),
                        // color: Colors.blue,
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
                    child: Icon(
                      Icons.play_circle_outline,
                      size: 40,
                      color: Colors.green[800],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: width,
              height: 30,

              // color: Colors.blue,
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Popular",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            // Pl("1", "assets/can-i-get-a-hi.jpg", "can i get a hi?", "8,198"),
            // Pl("2", "assets/it's ok.jpg", "it's ok!", "4,124"),
            // Pl("3", "assets/enough.png", "enough.", "<1,000"),
            // Pl("4", "assets/profil.jpg", "Muhammad Irvan Syapar", "1915016211"),
            for (var i = 0; i < songList.length; i++)
              GestureDetector(
                onTap: () {
                  final mySnackBar = SnackBar(
                    content: Text('Now Playing ${songList[i]}',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                    duration: Duration(seconds: 3),
                    padding: EdgeInsets.all(10),
                    backgroundColor: Colors.grey,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(mySnackBar);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Ditel(
                                namaLagu: songList[i],
                                filePhoto: imageList[i],
                                jmlView: viewerList[i],
                              ),

                      ),

                  );
                },
                child: Pl((i + 1).toString(), imageList[i], songList[i],
                    viewerList[i]),
              ),

            Container(
              width: width,
              height: 30,

              // color: Colors.blue,
              margin: EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Artist Pick",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: 'Search',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.library_music,
              color: Colors.white,
            ),
            label: "Your Library",
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
