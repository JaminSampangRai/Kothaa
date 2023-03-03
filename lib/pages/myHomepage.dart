import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kotha_new/apiService.dart';
import 'package:kotha_new/model/room_model.dart';
import 'package:kotha_new/pages/proflie.dart';
import 'package:kotha_new/pages/viewRoomdetails.dart';

class RoomCard extends StatefulWidget {
  // const RoomCard({super.key});
  // final List<RoomModel> room = [];
  RoomCard({Key? key, this.model, this.onDelete}) : super(key: key);

  final RoomModel? model;

  final Function? onDelete;
  // final List<String> imageUrls;

  // RoomCard({required this.imageUrls});

  @override
  // ignore: library_private_types_in_public_api
  _RoomCardState createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  //here init state
  bool _isFavorited = false;
  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
    });
    if (_isFavorited) {
      //add the card to favourites
    } else {
      //remove the card

    }
  }

  // late Offset _dragPosition = const Offset(1, 1);
  // late Offset _dragPositions = const Offset(0, 0);
  int _currentPage = 0;
  // ignore: unused_field
  int _selectedIndex = 0;
  final _searchController = TextEditingController();
  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final _searchFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    _searchFocus.addListener(_onFocusChange);

    rooms.add(
      RoomModel(
          id: "1",
          images: [
            "https://th.bing.com/th/id/R.3d88a927f8529dcba03364b09d98adbe?rik=JYmQaMVSULpYQg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-images.jpg&ehk=BNPsuSOUR7ATZ3EpRwxx1xFl7LUbO3tYlu1wFLCBrCE%3d&risl=&pid=ImgRaw&r=0.png",
            "https://th.bing.com/th/id/R.3d88a927f8529dcba03364b09d98adbe?rik=JYmQaMVSULpYQg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-images.jpg&ehk=BNPsuSOUR7ATZ3EpRwxx1xFl7LUbO3tYlu1wFLCBrCE%3d&risl=&pid=ImgRaw&r=0.png",
          ],
          city: "ktm",
          street: "ktm steer",
          price: 2000,
          contact: "9823748784",
          priceType: "fix",
          roomDescription: "roomDescription",
          parkingType: "One",
          roomQuantity: 1,
          latitude: 19.34734,
          longitude: 42.37247,
          address: "address",
          state: "koshi",
          country: "Nepal",
          postalCode: "55660"),
    );

    rooms.add(
      RoomModel(
          id: "2",
          images: [
            "https://th.bing.com/th/id/OIP.nklorQdjLJuloRgMo2ieYAHaEo?pid=ImgDet&rs=1.jpg",
            "https://th.bing.com/th/id/R.3d88a927f8529dcba03364b09d98adbe?rik=JYmQaMVSULpYQg&riu=http%3a%2f%2fthewowstyle.com%2fwp-content%2fuploads%2f2015%2f01%2fnature-images.jpg&ehk=BNPsuSOUR7ATZ3EpRwxx1xFl7LUbO3tYlu1wFLCBrCE%3d&risl=&pid=ImgRaw&r=0.jpg",
          ],
          city: "bkt",
          street: "bhaktapur lekhnath",
          price: 3000,
          contact: "98237487843",
          priceType: "negotiable",
          roomDescription: "roomDescription",
          parkingType: "One",
          roomQuantity: 2,
          latitude: 19.34734,
          longitude: 42.37247,
          address: "address",
          state: "Bagmati",
          country: "Nepal",
          postalCode: "55660"),
    );
  }

  void _onFocusChange() {
    if (!_searchFocus.hasFocus) {
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  List<RoomModel> rooms = List<RoomModel>.empty(growable: true);

  // late final RoomModel? model;

  // late final Function? onDelete;

  int roomIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Model is null? ${widget.model == null}");
    return Scaffold(
      backgroundColor: Colors.grey[400],

      //appbar starts
      appBar: AppBar(
        backgroundColor: const Color(0xff1d3b58),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: TextField(
                controller: _searchController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                  hintText: 'Search For Location',
                  border: InputBorder.none,
                ),
              )),
            ),
            // const SizedBox(
            //   width: 30,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => (const ProfilePage())));
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person_outline_rounded),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))
        ],
      ),

      body: Stack(children: [
        ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 250.0,
                            child: PageView.builder(
                              onPageChanged: (index) {
                                setState(() {
                                  _currentPage = index;
                                });
                              },
                              // itemCount: widget.imageUrls.length,
                              itemCount: rooms.length,
                              itemBuilder: (context, index) {
                                //container for images
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20)),

                                    // image: DecorationImage(
                                    //   image:
                                    //       // NetworkImage(widget.imageUrls[index]),
                                    //       NetworkImage(rooms[0].images[0]),
                                    //   // "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400"),
                                    //   fit: BoxFit.cover,
                                    // ),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400.png"),
                                      // image: Image.network((model!.images ==
                                      //             null ||
                                      //         model!.images == "")
                                      //     ? "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400.png"
                                      //     : model!.images),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // child: Image.network((model!.images == null ||
                                  //         model!.images == "")
                                  //     ? "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400.png"
                                  //     : model!.images),
                                );
                              },
                            ),
                          ),
                          //for the swiping dots
                          Container(
                            padding:
                                const EdgeInsets.only(bottom: 2.0, top: 2.0),
                            color: const Color.fromARGB(255, 141, 146, 147),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                          : Colors.white.withOpacity(0.8)),
                                );
                              }),
                            ),
                          ),
                          //for the rating star
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const RatingStars(
                                    starCount: 5,
                                    starSize: 20,
                                    starSpacing: 2,
                                    starOffColor:
                                        Color.fromARGB(255, 167, 166, 166),
                                  ),
                                  // Icon(
                                  //   Icons.favorite,
                                  //   color: Colors.grey,
                                  // ),
                                  IconButton(
                                    onPressed: _toggleFavorite,
                                    icon: _isFavorited
                                        ? const Icon(Icons.favorite,
                                            color: Colors.red)
                                        : const Icon(Icons.favorite_border),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              //put the location and price  container for negotiable
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        //  "Dharan",
                                        // rooms[roomIndex].city,
                                        // widget.model?.address ?? '',
                                        widget.model != null
                                            ? widget.model!.address
                                            : '',

                                        style: const TextStyle(
                                            color: Color(0xff1d3b58),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        // "Street Line",

                                        widget.model?.address! ?? "",
                                        style: TextStyle(
                                            color: Color(0xff1d3b58),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  //
                                  Column(
                                    children: const [
                                      Text(
                                        "Price: Rs2000",
                                        style: TextStyle(
                                            color: Color(0xff1d3b58),
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("Negotiable",
                                          style: TextStyle(
                                              color: Colors.deepOrange,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Amenities",
                                    style: TextStyle(
                                        color: Color(0xff1d3b58),
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            // on press action
                                          },
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: const [
                                                      Icon(
                                                        Icons
                                                            .water_drop_rounded,
                                                        color:
                                                            Color(0xff1d3b58),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Water"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: const [
                                                      Icon(
                                                        Icons.wifi,
                                                        color:
                                                            Color(0xff1d3b58),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("wifi"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: const [
                                                      Icon(Icons.local_parking,
                                                          color: Color(
                                                              0xff1d3b58)),
                                                      SizedBox(height: 5),
                                                      Text("park"),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Column(
                                                    children: const [
                                                      Icon(
                                                        Icons.kitchen,
                                                        color:
                                                            Color(0xff1d3b58),
                                                      ),
                                                      SizedBox(height: 5),
                                                      Text("Kitchen"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              //color
                                              const Text(
                                                "Booked",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.orange,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              //buttons
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        elevation: 2,
                                        backgroundColor:
                                            const Color(0xff1d3b58)),
                                    child: const Text(
                                      "Rent Now",
                                      style: TextStyle(fontSize: 15),
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
                                      "Veiw Map",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  (const Viewroomdetail())));
                                    },
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        elevation: 2,
                                        backgroundColor:
                                            const Color(0xff1d3b58)),
                                    child: const Text(
                                      "Veiw details",
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        DraggableFab(
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return StatefulBuilder(
                        builder: (BuildContext context, setState) {
                      return SortByUI(onSortOptionChanged: (sortOption) {
                        setState(() {
                          //update state with selected sort option
                        });
                        Navigator.of(context).pop();
                      });
                    });
                  });
            },
            tooltip: 'sort rounded',
            child: const Icon(
              Icons.sort_rounded,
            ),
          ),
        ),
        // Positioned(
        //     left: _dragPosition.dx ?? 1.0,
        //     top: _dragPosition.dy ?? 1.0,
        //     child: Draggable(
        //       onDraggableCanceled: ((Velocity velocity, Offset offset) {
        //         setState(() {
        //           _dragPosition = offset;
        //         });
        //       }),
        //       data: "Filter",
        //       // feedback: null,
        //       feedback: Container(
        //         width: 50.0,
        //         height: 50.0,
        //         decoration: BoxDecoration(
        //           color: Color(0xfff1d3b58),
        //           shape: BoxShape.circle,
        //         ),
        //         child: Icon(Icons.filter_list_alt,
        //             color: Color.fromARGB(255, 255, 255, 255)),
        //       ),
        //       child: Container(
        //         width: 50.0,
        //         height: 50.0,
        //         decoration: BoxDecoration(
        //           color: Color(0xfff1d3b58),
        //           shape: BoxShape.circle,
        //         ),
        //         child: IconButton(
        //           icon: Icon(
        //             Icons.filter_list_alt,
        //             color: Color.fromARGB(255, 255, 255, 255),
        //           ),
        //           onPressed: () {},
        //         ),
        //       ),
        //     )),
        // Positioned(
        //     left: _dragPositions.dx
        //             .clamp(0.0, MediaQuery.of(context).size.width - 50) ??
        //         1.0,
        //     top: _dragPositions.dy
        //             .clamp(0.0, MediaQuery.of(context).size.height - 50) ??
        //         1.0,
        //     child: Draggable(
        //       onDraggableCanceled: ((Velocity velocity, Offset offsets) {
        //         setState(() {
        //           _dragPositions = offsets;
        //         });
        //       }),
        //       data: "sort_rounded",
        //       // feedback: null,
        //       feedback: Container(
        //         width: 50.0,
        //         height: 50.0,
        //         decoration: BoxDecoration(
        //           color: Color(0xfff1d3b58),
        //           shape: BoxShape.circle,
        //         ),
        //         child: Icon(Icons.sort_rounded,
        //             color: Color.fromARGB(255, 255, 255, 255)),
        //       ),
        //       child: Container(
        //         width: 50.0,
        //         height: 50.0,
        //         decoration: BoxDecoration(
        //           color: Color(0xfff1d3b58),
        //           shape: BoxShape.circle,
        //         ),
        //         child: IconButton(
        //           icon: Icon(Icons.sort_rounded, color: Colors.white),
        //           onPressed: () {},
        //         ),
        //       ),
        //     )),
      ]),
    );
  }
}

// class HomePage extends StatelessWidget {
//   // final List<RoomCard> roomCards = [
//   //   RoomCard(
//   //     imageUrls: const [
//   //       "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/906023/pexels-photo-906023.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/1789968/pexels-photo-1789968.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //     ],
//   //   ),
//   //   RoomCard(
//   //     imageUrls: const [
//   //       "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/906023/pexels-photo-906023.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/1789968/pexels-photo-1789968.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //     ],
//   //   ),
//   //   RoomCard(
//   //     imageUrls: const [
//   //       "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/906023/pexels-photo-906023.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //       "https://images.pexels.com/photos/1789968/pexels-photo-1789968.jpeg?auto=compress&cs=tinysrgb&w=400",
//   //     ],
//   //   ),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         // itemCount: roomCards.length,
//         itemCount: 7,
//         itemBuilder: (context, index) {
//           return Container();
//           // return roomCards[index];
//         },
//       ),
//     );
//   }
// }

//meet

class SortByUI extends StatefulWidget {
  final Function(String) onSortOptionChanged;

  const SortByUI({Key? key, required this.onSortOptionChanged})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SortByUIState createState() => _SortByUIState();
}

class _SortByUIState extends State<SortByUI> {
  String _selectedSortOption = 'Newest Rent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          // border: Border(
          //   top: BorderSide(color: Colors.grey, width: 2),
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                // crossAxisAlignment: CrossAxisAlignment.end,

                children: const [
                  Text(
                    'Sort by:',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Newest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Lowest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SortOptionRadioButton(
                    sortOption: 'Highest Rent',
                    selectedSortOption: _selectedSortOption,
                    onOptionChanged: (value) {
                      setState(() {
                        _selectedSortOption = value;
                        widget.onSortOptionChanged(value);
                      });
                    },
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

class SortOptionRadioButton extends StatelessWidget {
  final String sortOption;
  final String selectedSortOption;
  final Function(String) onOptionChanged;

  const SortOptionRadioButton({
    Key? key,
    required this.sortOption,
    required this.selectedSortOption,
    required this.onOptionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sortOption,
          style: TextStyle(
            fontSize: 14,
            color: sortOption == selectedSortOption
                ? Colors.black
                : Colors.grey[400],
          ),
        ),
        Radio(
          value: sortOption,
          groupValue: selectedSortOption,
          onChanged: (value) => onOptionChanged(value!),
        ),
      ],
    );
  }
}

class Botnav extends StatefulWidget {
  const Botnav({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BotnavState createState() => _BotnavState();
}

class _BotnavState extends State<Botnav> with SingleTickerProviderStateMixin {
  int _selectedIndex = 2;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _controller.forward(from: 0.0);
    // You can add your navigation code here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.post_add_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.home),
                onPressed: () => _onItemTapped(2),
                color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                icon: AnimatedIcon(
                  icon: AnimatedIcons.menu_home,
                  progress: _controller,
                ),
                onPressed: () => _onItemTapped(0),
                color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
              IconButton(
                icon: const Icon(Icons.chat_rounded),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => (const ProfilePage())));
                },
                // color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget loadRoom() {
    return FutureBuilder(
      future: APIService.getRooms(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<RoomModel>?> model,
      ) {
        if (model.hasData) {
          return ListView.builder(
              itemCount: model.data!.length,
              itemBuilder: (context, index) {
                return RoomCard(
                  model: model.data![index],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   bool isRoomsSelected = true;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Favourite"),
//         backgroundColor: const Color(0xff1d3b58),
//         centerTitle: true,
//       ),
//       body: Column(children: [
//         Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Container(
//             height: 90,
//             width: MediaQuery.of(context).size.width,
//             decoration: BoxDecoration(
//                 color: const Color(0xff1d3b58),
//                 borderRadius: BorderRadius.circular(20)),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     isRoomsSelected ? 'Rooms' : 'Roommates',
//                     style: const TextStyle(
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 255, 255, 255)),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         isRoomsSelected = !isRoomsSelected;
//                       });
//                     },
//                     child: Container(
//                       height: 40.0,
//                       width: 40.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(20.0),
//                         ),
//                       ),
//                       child: Icon(
//                         isRoomsSelected
//                             ? Icons.keyboard_arrow_left
//                             : Icons.keyboard_arrow_right,
//                         color: const Color(0xff1d3b58),
//                         size: 20.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Container(
//             child: isRoomsSelected ? RoomsPage() : RoommatesPage(),
//           ),
//         ),
//       ]),
//     );
//   }
// }

// class RoomsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: ListView.builder(
//           itemCount: 6,
//           itemBuilder: (context, index) {
//             return Card(
//               elevation: 5,
//               child: Column(
//                 children: [
//                   Container(
//                     height: 300,
//                     width: MediaQuery.of(context).size.width,
//                     child: Carousel(
//                       autoplay: false,
//                       dotSize: 4.0,
//                       dotSpacing: 15.0,
//                       dotColor: Colors.lightBlueAccent,
//                       indicatorBgPadding: 5.0,
//                       dotBgColor:
//                           Color.fromARGB(255, 100, 99, 100).withOpacity(0.5),
//                       images: const [
//                         NetworkImage(
//                             'https://images.pexels.com/photos/1561020/pexels-photo-1561020.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
//                         NetworkImage(
//                             'https://images.pexels.com/photos/588575/pexels-photo-588575.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "JOHN GURUNG",
//                               style: TextStyle(
//                                   color: Color(0xff1d3b58),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             //button icon to list in favourite
//                             IconButton(
//                               color: Colors.grey,
//                               onPressed: () {},
//                               icon: const Icon(Icons.favorite),
//                             )
//                           ],
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             const Text(
//                               "Student(24)",
//                               style: TextStyle(
//                                 color: Color(0xff1d3b58),
//                                 fontSize: 12,
//                               ),
//                             ),
//                             Row(
//                               children: const [
//                                 Icon(
//                                   Icons.search,
//                                   size: 15,
//                                   color: Color(0xff1d3b58),
//                                 ),
//                                 Text(
//                                   "Dharan",
//                                   style: TextStyle(
//                                     color: Color(0xff1d3b58),
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const Text(
//                               "Budget: 2000/month",
//                               style: TextStyle(
//                                 color: Color(0xff1d3b58),
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: const [
//                             Text(
//                               "About",
//                               style: TextStyle(
//                                   color: Color(0xff1d3b58),
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width,
//                           child: const Text(
//                             "I am a mobile app developer and i m searching for a roommate who has same interest as me.",
//                             style: TextStyle(
//                               color: Color(0xff1d3b58),
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.call,
//                                 color: Color(0xff1d3b58),
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: const Icon(
//                                 Icons.chat,
//                                 color: Color(0xff1d3b58),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }

// class RoommatesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: Container(
//         color: const Color.fromARGB(255, 110, 104, 103),
//         child: const Center(
//           child: Text('Roomamtes Page'),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// import 'package:carousel_slider/carousel_slider.dart';

// class RoomCard extends StatelessWidget {
//   final String location;
//   final int price;
//   final List<String> amenities;
//   final bool isNegotiable;
//   final List<String> imageUrls;

//   RoomCard({
//     required this.location,
//     required this.price,
//     required this.amenities,
//     required this.isNegotiable,
//     required this.imageUrls,
//     required String imageUrl,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CarouselSlider(
//               options: CarouselOptions(
//                 height: 200,
//               ),
//               items: imageUrls
//                   .map((imageUrl) => Container(
//                         child: Image.network(
//                           imageUrl,
//                           fit: BoxFit.cover,
//                         ),
//                       ))
//                   .toList(),
//             ),
//             SizedBox(height: 16),
//             Text(
//               location,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Text(
//               '\$$price ${isNegotiable ? '(negotiable)' : '(fixed)'}',
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Amenities:',
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: amenities
//                   .map((amenity) => Container(
//                         margin: EdgeInsets.only(bottom: 4),
//                         child: Text(
//                           '- $amenity',
//                           style: TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ))
//                   .toList(),
//             ),
//             SizedBox(height: 16),
//             TextButton(
//               onPressed: () {
//                 // View details of room
//               },
//               style: TextButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   elevation: 2,
//                   backgroundColor: const Color(0xff1d3b58)),
//               child: const Text(
//                 "Veiw details",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 // Message the owner
//               },
//               style: TextButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   elevation: 2,
//                   backgroundColor: const Color(0xff1d3b58)),
//               child: const Text(
//                 "Message",
//                 style: TextStyle(fontSize: 15),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class RoomList extends StatelessWidget {
//   final List<RoomCard> rooms;

//   RoomList({required this.rooms});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       scrollDirection: Axis.horizontal,
//       children: rooms,
//     );
//   }
// }


// bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   selectedItemColor: Color(0xfff1d3b58),
      //   selectedFontSize: 14,
      //   unselectedFontSize: 14,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.post_add_rounded), label: "Post Room"),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Saved"),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
      //   ],
      // ),
      //  BottomAppBar(
      //   shape: CircularNotchedRectangle(),
      //   child: Padding(
      //     padding: const EdgeInsets.all(2.0),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.post_add_rounded),
      //           onPressed: () {},
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.home),
      //           onPressed: () => _onItemTapped(2),
      //           color: _selectedIndex == 2 ? Colors.blue : Colors.grey,
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.favorite),
      //           onPressed: () => _onItemTapped(0),
      //           color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.chat_rounded),
      //           onPressed: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (context) => (ProfilePage())));
      //           },
      //           // color: _selectedIndex == 0 ? Colors.blue : Colors.grey,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      //app bar ends
