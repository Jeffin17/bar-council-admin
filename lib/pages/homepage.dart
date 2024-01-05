import 'dart:convert';

import 'package:bar_council_main_admin/widgets/MyBottomNavBar_admin.dart';
import 'package:bar_council_main_admin/widgets/main_fields.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../utils/constant.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List SelectedData = [];
  TextEditingController selectedController = TextEditingController();

  var datas;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      bottomNavigationBar: const MyBottomNavBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    )),
                SizedBox(width: width*0.30),
                Text(
                  searchhint,
                  style: GoogleFonts.montserrat(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            Container(
              // width: width*0.30,
              child: TextField(
                controller: selectedController,
                onChanged: (pattern) {
                  setState(() {
                    SelectedData.where((item) => item['cust_area']
                        .toLowerCase()
                        .startsWith(pattern.toLowerCase()));
                  });
                },
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  // Adjust the vertical padding
                  suffixIcon: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  ),
                  errorBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        width: 2,
                        color: appcolor
                            .withOpacity(.3)), // Border color when not in focus
                  ),
                  hintText: 'Search',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                        width: 2, color: appcolor), // Border color when focused
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: const BorderSide(color: Colors.white)),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,

                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
                    child: Container(
                      height: height * .15,
                      width: width,
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(36, 36, 36, 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Container(
                              height: 82,
                              width: 75,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromRGBO(217, 217, 217, 1),
                              ),
                              child: Image(
                                image: AssetImage('assets/images/mal 2.png'),
                              ),
                            ),
                          ),
                          SizedBox(width: width * .56),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image(
                              image: AssetImage('assets/images/edit.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// datas != null ? MemoryImage(base64Decode(datas)) as ImageProvider<Object>?: AssetImage('assets/images/man.png') as ImageProvider<Object>?),
