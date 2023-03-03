// ignore: file_names
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/pages/addRoom.dart';
import 'package:kotha_new/pages/current_location.dart';

// import 'package:kotha_new/pages/formPost.dart';

class PostRoom extends StatefulWidget {
  const PostRoom({Key? key,}) : super(key: key);

  @override
  State<PostRoom> createState() => _PostRoomState();
}

class _PostRoomState extends State<PostRoom> {
  late final RoomModel? model;
  late final Function? onDelete;

  // int _current = 0;
  // double changedPositionofLine() {
  //   switch (_current) {
  //     case 0:
  //       return 15;
  //     case 1:
  //       return 160;

  //     default:
  //       return 0;
  //   }
  // }

  // double changedWidthofConatiner() {
  //   switch (_current) {
  //     case 0:
  //       return 82;
  //     case 1:
  //       return 155;

  //     default:
  //       return 0;
  //   }
  // }

  // List<String> tabs = ["Post Room", "View Posted Room"];
  int _currentPage = 0;
  String dropdownValue = 'Select Water Facility';
  var items = [
    'Select Water Facility',
    'Once a Day',
    'Twice a Day',
    'EveryTime',
  ];
  String dropdownValues = 'Select Parking Facility';
  var itemss = [
    'Select Parking Facility',
    '2 wheelers',
    '4 wheelers',
    'both',
  ];
  String dropdownValuess = 'Select Room Quantity';
  var itemsss = [
    'Select Room Quantity',
    'One',
    'two',
    'three',
  ];

  final List<File> _images = [];
  var _groupValue;

  void _selectImage(File image) {
    setState(() {
      _images.add(image);
    });
  }

  void _removeImage(int index) {
    setState(() {
      _images.removeAt(index);
    });
  }

  var colors = (0xff1d3b58);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1d3b58),
          title: const Text(
            "Post Room",
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Post Room',
              ),
              Tab(
                text: 'View Posted Room',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  // Expanded(child: ImageUploader()), yo cahi real ma ho
                  Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ..._images.asMap().entries.map((entry) => Container(
                                  // width: 300,
                                  height: 200,
                                  color: Colors.red,
                                  margin: const EdgeInsets.only(
                                      top: 10, right: 5, left: 5),
                                  child: Stack(
                                    children: [
                                      Image.file(entry.value),
                                      Positioned(
                                        top: 5.0,
                                        right: 5.0,
                                        child: IconButton(
                                          icon: const Icon(Icons.remove_circle),
                                          onPressed: () =>
                                              _removeImage(entry.key),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      if (_images.length < 5)
                        TextButton.icon(
                          icon: const Icon(Icons.add),
                          label: const Text('Add Image'),
                          onPressed: () async {
                            ImagePicker imagePicker = ImagePicker();
                            var image = await imagePicker.pickImage(
                                source: ImageSource.gallery);
                            if (image != null) {
                              _selectImage(File(image.path));
                            }
                          },
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                              cursorColor: const Color(0xff1d3b58),
                              style: const TextStyle(
                                color: Color(0xff1d3b58),
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1d3b58),
                                      width: 3.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'City',
                                  labelStyle:
                                      const TextStyle(color: Color(0xff1d3b58)),
                                  hintText: 'Dharan'),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                                cursorColor: const Color(0xff1d3b58),
                                style:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff1d3b58),
                                          width: 3.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelText: 'Street',
                                    labelStyle: const TextStyle(
                                        color: Color(0xff1d3b58)),
                                    hintText: 'Marga')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                              cursorColor: const Color(0xff1d3b58),
                              style: const TextStyle(
                                color: Color(0xff1d3b58),
                              ),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xff1d3b58),
                                      width: 3.0,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Price Of Room',
                                  labelStyle:
                                      const TextStyle(color: Color(0xff1d3b58)),
                                  hintText: '/month'),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: TextFormField(
                                cursorColor: const Color(0xff1d3b58),
                                style:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7.0),
                                      borderSide: const BorderSide(
                                          color: Color(0xff1d3b58),
                                          width: 3.0,
                                          style: BorderStyle.solid),
                                    ),
                                    labelText: 'Room SIze',
                                    labelStyle: const TextStyle(
                                        color: Color(0xff1d3b58)),
                                    hintText: '200sq ft')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Price",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Radio(
                            value: 0,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value;
                              });
                            },
                          ),
                          const Text("Fixed"),
                          Radio(
                            value: 1,
                            groupValue: _groupValue,
                            onChanged: (value) {
                              setState(() {
                                _groupValue = value;
                              });
                            },
                          ),
                          const Text("Negotiable"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 40,
                        width: 340,
                        child: TextFormField(
                            cursorColor: const Color(0xff1d3b58),
                            style: const TextStyle(color: Color(0xff1d3b58)),
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: const BorderSide(
                                      color: Color(0xff1d3b58),
                                      width: 3.0,
                                      style: BorderStyle.solid),
                                ),
                                labelText: 'Contact No',
                                labelStyle:
                                    const TextStyle(color: Color(0xff1d3b58)),
                                hintText: '200sq ft')),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 340,
                        height: 150,
                        child: TextFormField(
                          cursorColor: const Color(0xff1d3b58),
                          style: const TextStyle(color: Color(0xff1d3b58)),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff1d3b58),
                                  width: 3.0,
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'Room Description',
                            labelStyle:
                                const TextStyle(color: Color(0xff1d3b58)),
                          ),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          // expands: true,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Row(
                          children: const [
                            Text(
                              "Animities Free",
                              style: TextStyle(fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          const Icon(Icons.wifi, color: Color(0xff1d3b58)),
                          const SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: true,
                            checkColor: const Color(0xff1d3b58),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.withOpacity(.80);
                              }
                              return Colors.grey;
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          const Icon(Icons.water_drop,
                              color: Color(0xff1d3b58)),
                          const SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: false,
                            checkColor: const Color(0xff1d3b58),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.withOpacity(.80);
                              }
                              return Colors.grey;
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          const Icon(Icons.local_parking,
                              color: Color(0xff1d3b58)),
                          const SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: false,
                            checkColor: const Color(0xff1d3b58),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.withOpacity(.80);
                              }
                              return Colors.grey;
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          const Icon(Icons.kitchen, color: Color(0xff1d3b58)),
                          const SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: false,
                            checkColor: const Color(0xff1d3b58),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.withOpacity(.80);
                              }
                              return Colors.grey;
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(width: 50),
                          const Icon(Icons.bed, color: Color(0xff1d3b58)),
                          const SizedBox(
                            width: 30,
                          ),
                          Checkbox(
                            value: false,
                            checkColor: const Color(0xff1d3b58),
                            onChanged: null,
                            fillColor: MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                              if (states.contains(MaterialState.disabled)) {
                                return Colors.grey.withOpacity(.80);
                              }
                              return Colors.grey;
                            }),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Water Facilities",
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton(
                              // iconDisabledColor: Colors.red,
                              elevation: 9,
                              // iconEnabledColor: Colors.red,
                              value: dropdownValue,
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Parking Facility",
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton(
                            elevation: 9,
                            // iconEnabledColor: Colors.red,
                            value: dropdownValues,
                            items: itemss.map((String itemss) {
                              return DropdownMenuItem(
                                value: itemss,
                                child: Text(itemss),
                              );
                            }).toList(),
                            onChanged: (String? newValues) {
                              setState(() {
                                dropdownValues = newValues!;
                              });
                            },
                            // onChanged: (String newValue) {
                            //   setState(() {
                            //     dropdownValues = newValue;
                            //   });
                            // },
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Room Quantity",
                            style: TextStyle(fontSize: 16),
                          ),
                          DropdownButton(
                            elevation: 9,
                            // iconEnabledColor: Colors.red,
                            value: dropdownValuess,
                            items: itemsss.map((String itemsss) {
                              return DropdownMenuItem(
                                value: itemsss,
                                child: Text(itemsss),
                              );
                            }).toList(),
                            onChanged: (String? newValuess) {
                              setState(() {
                                dropdownValuess = newValuess!;
                              });
                            },
                            // onChanged: (String? newValue) {
                            //   setState(() {
                            //     dropdownValuess = newValue!;
                            //   });
                            // },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: const [
                            Text(
                              "Location",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff1d3b58),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 350, width: 350, child: Location()),

                      //google map here
                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 2,
                              backgroundColor: const Color(0xff1d3b58)),
                          child: const Text(
                            "Add Room",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   child: Expanded(
            //     child: SingleChildScrollView(
            //       child: Column(
            //         children: [
            //           Stack(
            //             children: [
            //               ListView.builder(
            //                 itemCount: 4,
            //                 itemBuilder: (context, index) {
            //                   return Card(
            //                     elevation: 5,
            //                     child: Column(children: [
            //                       SizedBox(
            //                         height: 250,
            //                         child: PageView.builder(
            //                           onPageChanged: (index) {
            //                             setState(() {
            //                               _currentPage = index;
            //                             });
            //                           },
            //                           itemCount: 6,
            //                           itemBuilder: (context, index) {
            //                             return Container(
            //                               decoration: const BoxDecoration(
            //                                 image: DecorationImage(
            //                                   image: NetworkImage(
            //                                       "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400"),
            //                                   fit: BoxFit.cover,
            //                                 ),
            //                               ),
            //                             );
            //                           },
            //                         ),
            //                       )
            //                     ]),
            //                   );
            //                 },
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Stack(
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 250,
                                      child: PageView.builder(
                                        onPageChanged: (index) {
                                          setState(() {
                                            _currentPage = index;
                                          });
                                        },
                                        itemCount: 6,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                          bottom: 2.0, top: 2.0),
                                      color: const Color.fromARGB(
                                          255, 141, 146, 147),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: List.generate(3,
                                            // widget.imageUrls.length,
                                            (index) {
                                          return Container(
                                            height: 8.0,
                                            width: 8.0,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentPage == index
                                                    ? const Color(0xff1d3b58)
                                                    : Colors.white
                                                        .withOpacity(0.8)),
                                          );
                                        }),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              elevation: 2,
                                              backgroundColor:
                                                  const Color(0xff1d3b58)),
                                          child: const Text(
                                            "Edit Room",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          style: TextButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              elevation: 2,
                                              backgroundColor:
                                                  const Color(0xff1d3b58)),
                                          child: const Text(
                                            "Delete Room",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// Container(child: const Location())
// Container(
//   height: 350,
//   width: 350,
//   child: GoogleMap(
//     initialCameraPosition: CameraPosition(
//       target: LatLng(37.77483, -122.419416),
//       zoom: 12,
//     ),
//     markers: Set<Marker>.from([
//       Marker(
//           markerId: MarkerId('marker_1'),
//           position: LatLng(37.77483, -122.419416))
//     ]),
//   ),
// )

// appBar: AppBar(
//   backgroundColor: const Color(0xff1d3b58),
//   centerTitle: true,
//   title: const Text(
//     "Post Room",
//   ),
// ),
// body: Container(
//   height: MediaQuery.of(context).size.height * 0.06,
//   width: MediaQuery.of(context).size.width,
//   color: Color(0xff1d3b58),
//   child: Column(
//     children: [
//       Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 0.06,
//         color: const Color(0xff1d3b58),
//         child: Stack(children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: tabs.length,
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           _current = index;
//                         });
//                       },
//                       child: Padding(
//                         padding: EdgeInsets.only(
//                             left: index == 0 ? 65 : 70, top: 7),
//                         child: Text(
//                           tabs[index],
//                           style: TextStyle(
//                               fontSize: _current == index ? 18 : 16,
//                               fontWeight: _current == index
//                                   ? FontWeight.w500
//                                   : FontWeight.w300,
//                               color: const Color.fromARGB(
//                                   255, 255, 255, 255)),
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ),
//           AnimatedPositioned(
//             bottom: 0,
//             left: changedPositionofLine(),
//             curve: Curves.fastLinearToSlowEaseIn,
//             duration: const Duration(milliseconds: 500),
//             child: AnimatedContainer(
//               curve: Curves.fastLinearToSlowEaseIn,
//               margin: const EdgeInsets.only(left: 55),
//               duration: const Duration(milliseconds: 500),
//               width: changedWidthofConatiner(),
//               height: MediaQuery.of(context).size.height * 0.008,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Color.fromARGB(255, 255, 255, 255)),
//             ),
//           )
//         ]),
//       ),

//     ],
//   ),
// )
