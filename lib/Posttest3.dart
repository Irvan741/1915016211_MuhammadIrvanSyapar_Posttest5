import 'package:flutter/material.dart';
import 'package:posttest5/Posttest2.dart';

class Posttest3 extends StatefulWidget {
  const Posttest3({Key? key}) : super(key: key);

  @override
  State<Posttest3> createState() => _Posttest3State();
}

class _Posttest3State extends State<Posttest3> {
  TextEditingController singleTitle = TextEditingController();
  TextEditingController mainArtist = TextEditingController();
  TextEditingController labelName = TextEditingController();
  TextEditingController recordingLocation = TextEditingController();
  TextEditingController upceancode = TextEditingController();
  String singleTitlevar = "",
      mainArtistvar = "",
      labelNamevar = "",
      recordingLocationvar = "",
      upceancodevar = "";
  List<String> ww = ["No, I have some restrictions", "Yes"];
  String wwSelected = "";
  DateTime? _selectedDate;
  bool? isComplete, explicitLyrics, isXplicitExists;
  void dispose() {
    // TODO: implement dispose
    singleTitle.dispose();
    mainArtist.dispose();
    labelName.dispose();
    recordingLocation.dispose();
    upceancode.dispose();
    super.dispose();
  }

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2023))
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        _selectedDate = pickedDate;
        print(_selectedDate);
      });
    });
  }

  String bahasaDDVal = 'English';

  List<String> Bahasa = [
    'English',
    'Japanese',
    'Spanish',
    'Indonesian',
    'Melayu',
  ];

  String genreDDVal1 = 'Alternative';
  String genreDDVal2 = 'R&B/Soul';

  List<String> Genre = [
    'Alternative',
    'Country',
    'Folk',
    'Pop',
    'R&B/Soul',
    'Rock',
  ];

  Widget Dd(List<String> list, String ddvalue, String topik) {
    return Row(
      children: [
        Container(
          width: 350,
          margin: EdgeInsets.only(left: 20),
          child: DropdownButton(
            value: ddvalue,
            icon: Container(
                margin: EdgeInsets.only(left: 230),
                child: const Icon(Icons.keyboard_arrow_down)),
            items: list.map((String list) {
              return DropdownMenuItem(
                value: list,
                child: Text(list),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                ddvalue = newValue!;
                if (topik == "bahasa") {
                  bahasaDDVal = newValue;
                } else if (topik == "genre1") {
                  genreDDVal1 = newValue;
                } else if (topik == "genre2") {
                  genreDDVal2 == newValue;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  Widget Output(var title, result, double topMargin) {
    return Container(
      width: 350,
      height: 35,
      margin: EdgeInsets.only(left: 30, right: 30, top: topMargin, bottom: 0),
      child: Text(
        "${title}:\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ${result}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget Tb(var title, TextEditingController controllerName) {
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          width: 350,
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: title,
              labelStyle: TextStyle(color: Colors.black),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)),
              border: OutlineInputBorder(),
            ),
            controller: controllerName,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Wrap(
            children: [
              // Container(
              //   width: 50,
              //   height: 100,
              //   // color: Colors.amber,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(
              //       Icons.more_vert,
              //       color: Colors.white,
              //     ),
              //   ),
              //   alignment: Alignment.centerLeft,
              // ),
              Container(
                width: 75,
                height: 100,
                // color: Colors.white,
                child: Text(
                  "tune",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontFamily: "Almarena"),
                ),

                alignment: Alignment.centerLeft,
              ),
              Container(
                width: 100,
                height: 100,
                // color: Colors.white,
                child: Text(
                  "core",
                  style: TextStyle(
                      color: Colors.white,
                      fontStyle: FontStyle.normal,
                      fontSize: 30,
                      fontFamily: "Almarena"),
                ),

                alignment: Alignment.centerLeft,
              ),

              // Text("core", style: TextStyle(color: Colors.white, fontStyle: FontStyle.normal, fontSize: 30, fontFamily: "Almarena"),)
            ],
          )),
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Container(
                width: 200,
                height: 40,
                margin: EdgeInsets.only(left: 20),
                // color: Colors.black,
                child: Wrap(
                  children: [
                    Text(
                      "*",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Required Field",
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          ),
          Tb("*Single Title", singleTitle),
          SizedBox(
            height: 20,
          ),
          Tb("*Main Artist", mainArtist),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 20,
                child: Wrap(
                  children: [
                    Text(
                      "Does this song have explicit lyrics ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      " Read More",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      explicitLyrics = true;
                    });
                  },
                  child: Text("Yes"),
                ),
              ),
              Container(
                // width: 50,
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      explicitLyrics = false;
                    });
                  },
                  child: Text("No"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 20,
                child: Wrap(
                  children: [
                    Text(
                      "Does an explicit version of this track exist?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isXplicitExists = true;
                    });
                  },
                  child: Text("Yes"),
                ),
              ),
              Container(
                // width: 50,
                margin: EdgeInsets.only(left: 20),
                child: ElevatedButton(
                  onPressed: () {
                    isXplicitExists = false;
                  },
                  child: Text("No"),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "*Language",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Dd(Bahasa, bahasaDDVal, "bahasa"),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "*Primary Genre",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Dd(Genre, genreDDVal1, "genre1"),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Text(
              "Secondary Genre (optional)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Dd(Genre, genreDDVal2, "genre2"),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black12),
                  onPressed: () {
                    _presentDatePicker();
                  },
                  child: Text(
                    "Pick A Release Date ! ",
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 70,
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                color: Colors.black87,
                child: Text(
                  "Tip: Set your release date 4 weeks from today to give stores time to review your release",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 1,
                color: Colors.grey,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Advanced Distribution Features",
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Tb("Label Name (optional)", labelName),
          SizedBox(
            height: 30,
          ),
          Tb("Recording Location (optional)", recordingLocation),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "Can this release be sold worldwide ?",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          for (var item in ww)
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Radio(
                    value: item,
                    groupValue: wwSelected,
                    onChanged: (newVal) {
                      setState(() {
                        wwSelected = newVal.toString();
                      });
                    },
                  ),
                ),
                Text(item),
              ],
            ),
          SizedBox(
            height: 20,
          ),
          Tb("UPC/EAN Code (optional)", upceancode),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: 350,
                height: 70,
                color: Colors.black87,
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20),
                child: Text(
                  "if you already have a UPC for this release, please add. If not, no problem, we'll create one for you.",
                  style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      List<String> res = [
                        singleTitle.text,
                        mainArtist.text,
                        labelName.text,
                        recordingLocation.text,
                        upceancode.text,
                      ];
                      int index = 0;
                      for (var item in res) {
                        if (item == "") res[index] = "Kosong";
                        index += 1;
                      }
                      singleTitlevar = res[0];
                      mainArtistvar = res[1];
                      labelNamevar = res[2];
                      recordingLocationvar = res[3];
                      upceancodevar = res[4];
                      isComplete = true;
                    });
                  },
                  child: Text(
                    "Save Release and Add Songs",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 100,
          ),
          if (isComplete == true)
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: 350,
                  height: 500,
                  color: Colors.black87,
                ),
                Output("Single Title", singleTitlevar, 30),
                Output("Language", bahasaDDVal, 170),
                Output("Primary Genre", genreDDVal1, 100),
                Output("Secondary Genre", genreDDVal2, 135),
                Output("Main Artist", mainArtistvar, 65),
                Output("Label Name (optional)", labelNamevar, 205),
                Output(
                    "Recording Location (optional)", recordingLocationvar, 240),
                Output("UPC/EAN Code", upceancodevar, 275),
                Output("Release Date", _selectedDate, 375),
                Output("Release WorldWide", wwSelected, 340),
                if (explicitLyrics == true)
                  Output("Explicit Lyrics", "Yes", 305)
                else
                  Output("Explicit Lyrics", "No", 305),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: EdgeInsets.only(top: 550),
                  child: ElevatedButton(
                    child: Text("PUBLISH"),
                    onPressed: () {
                      setState(() {
                        // ItemList Il = new ItemList();
                        // // tes.songList.add(singleTitlevar);
                        // // tes.viewerList.add("<1,000");
                        // // tes.imageList.add("assets/pawsletter22.jpg");
                        // Il.songList.insert(Il.songList.length, singleTitlevar);
                        // Il.viewerList.insert(Il.viewerList.length, "<1,000");
                        // Il.imageList.insert(
                        //     Il.imageList.length, "assets/pawsletter22.jpg");
                        // ItemList().updateListSong(Il.songList);
                        // ItemList().updateListViewer(Il.viewerList);
                        // ItemList().updateListImage(Il.imageList);
                        // for (var i = 0; i < 10000; i++) {
                        //   print(i);
                        // }
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FavouriteBandPage(),
                          ),
                        );
                      });

                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (_) => FavouriteBandPage(),
                      //   ),
                      // );
                    },
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
