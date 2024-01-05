import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constant.dart';
import '../widgets/MyBottomNavBar_admin.dart';

class Access extends StatefulWidget {
  const Access({super.key});

  @override
  State<Access> createState() => _AccessState();
}

class _AccessState extends State<Access> {
TextEditingController selectedController = TextEditingController();

List<bool> selectedItems = List.generate(10, (index) => false); // Adjust the size according to your item count
bool selectAll = false;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: MyBottomNavBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (!FocusScope.of(context).hasPrimaryFocus) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      )),
                  SizedBox(width: width*0.30),
                  Text(
                    searchhint,
                    style: GoogleFonts.montserrat(
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),


              TextField(
                controller: selectedController,
                onChanged: (pattern) {
                  setState(() {
                    // SelectedData.where((item) => item['cust_area'].toLowerCase().startsWith(pattern.toLowerCase()));
                  });
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10), // Adjust the vertical padding
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

              Row(
                children: [
                  Checkbox(
                    value: selectAll,
                    onChanged: (value) {
                      setState(() {
                        selectAll = value!;
                        for (int i = 0; i < selectedItems.length; i++) {
                          selectedItems[i] = value!;
                        }
                      });
                    },
                  ),
                  Text('Select All',style: GoogleFonts.montserrat(
                    color: const Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,)),
                  // Other widgets...
                ],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value:selectedItems[index],
                                    onChanged: (value){
                                      setState(() { selectedItems[index]= value!;
                                      });
                                    }),
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
                                
                                // SizedBox(width: width * .56),
                                // Container(
                                //   height: 25,
                                //   width: 25,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(20),
                                //   ),
                                //   child: Image(
                                //     image: AssetImage('assets/images/edit.png'),
                                //   ),
                                // ),
                              ],
                            ),
                            // IconButton(onPressed: (){}, icon: Icon(Icons.edit,size: 40,))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(
                height: height*0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(166, 54, 54, 1)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10.0))),),
                    onPressed: () {},
                    child: const Text(
                      delhint,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(button),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(10.0))),),
                    onPressed: () {},
                    child: const Text(
                      approvehint,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
