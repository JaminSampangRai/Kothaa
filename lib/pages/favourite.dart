import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:kotha_new/pages/viewRoomdetails.dart';

// import 'searchroom.dart';
// import 'viewRoomdetails.dart';

class Favourite extends StatefulWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  bool isRoomsSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite"),
        backgroundColor: const Color(0xff1d3b58),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 90,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: const Color(0xff1d3b58),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isRoomsSelected ? 'Rooms' : 'Roommates',
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRoomsSelected = !isRoomsSelected;
                      });
                    },
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: Icon(
                        isRoomsSelected
                            ? Icons.keyboard_arrow_left
                            : Icons.keyboard_arrow_right,
                        color: const Color(0xff1d3b58),
                        size: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: isRoomsSelected ? RoomsPage() : const RoommatesPage(),
          ),
        ),
      ]),
    );
  }
}

class RoomsPage extends StatelessWidget {
  int _currentPage = 0;

  RoomsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
                            _currentPage = index;
                          },
                          // itemCount: widget.imageUrls.length,
                          itemCount: 6,
                          itemBuilder: (context, index) {
                            //container for images
                            return Container(
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                image: DecorationImage(
                                  image:
                                      // NetworkImage(widget.imageUrls[index]),
                                      NetworkImage(
                                          "https://images.pexels.com/photos/1582619/pexels-photo-1582619.jpeg?auto=compress&cs=tinysrgb&w=400"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      //for the swiping dots
                      Container(
                        padding: const EdgeInsets.only(bottom: 2.0, top: 2.0),
                        color: const Color.fromARGB(255, 141, 146, 147),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(3,
                              // widget.imageUrls.length,
                              (index) {
                            return Container(
                              height: 8.0,
                              width: 8.0,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              RatingStars(
                                starCount: 5,
                                starSize: 20,
                                starSpacing: 2,
                                starOffColor:
                                    Color.fromARGB(255, 167, 166, 166),
                              ),
                              Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          //put the location and price  container for negotiable
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Dharan",
                                    style: TextStyle(
                                        color: Color(0xff1d3b58),
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Street Line",
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
                                    // ignore: use_full_hex_values_for_flutter_colors
                                    color: Color(0xffffffff1d3b58),
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
                                                    Icons.water_drop_rounded,
                                                    color:
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
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
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
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
                                                          // ignore: use_full_hex_values_for_flutter_colors
                                                          0xfff1d3b58)),
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
                                                        // ignore: use_full_hex_values_for_flutter_colors
                                                        Color(0xfff1d3b58),
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
                                                fontWeight: FontWeight.bold),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    elevation: 2,
                                    backgroundColor: const Color(0xff1d3b58)),
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
                                    backgroundColor: const Color(0xff1d3b58)),
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
                                    backgroundColor: const Color(0xff1d3b58)),
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
        });
    // ListView.builder(
    //     itemCount: 4,
    //     itemBuilder: (context, index) {
    //       return
    //       Stack(
    //         children: [
    //           SizedBox(
    //             height: 300,
    //             child: ClipRRect(
    //               borderRadius: BorderRadius.only(
    //                 topLeft: Radius.circular(20),
    //                 topRight: Radius.circular(20),
    //               ),
    //               child: Carousel(
    //                 autoplay: false,
    //                 dotSize: 4.0,
    //                 dotSpacing: 15.0,
    //                 dotColor: Colors.lightBlueAccent,
    //                 indicatorBgPadding: 5.0,
    //                 dotBgColor:
    //                     Color.fromARGB(255, 100, 99, 100).withOpacity(0.5),
    //                 images: [
    //                   AssetImage('assets/finallogo.png'),
    //                   AssetImage('assets/rr.png'),
    //                 ],
    //               ),
    //             ),
    //           ),
    //           Positioned(
    //             top: 0,
    //             right: 5,
    //             child: Icon(
    //               Icons.favorite,
    //               color: Colors.red,
    //             ),
    //           ),
    //           Positioned(
    //             child: Icon(
    //               Icons.star_rate_sharp,
    //               color: Colors.white,
    //             ),
    //           )
    //         ],
    //       );
    //     });
  }
}

class RoommatesPage extends StatelessWidget {
  const RoommatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/R.png"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "JOHN GURUNG",
                              style: TextStyle(
                                  color: Color(0xff1d3b58),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            //button icon to list in favourite
                            IconButton(
                              color: Colors.grey,
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              "Student(24)",
                              style: TextStyle(
                                color: Color(0xff1d3b58),
                                fontSize: 12,
                              ),
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.search,
                                  size: 15,
                                  color: Color(0xff1d3b58),
                                ),
                                Text(
                                  "Dharan",
                                  style: TextStyle(
                                    color: Color(0xff1d3b58),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Budget: 2000/month",
                              style: TextStyle(
                                color: Color(0xff1d3b58),
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "About",
                              style: TextStyle(
                                  color: Color(0xff1d3b58),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          child: const Text(
                            "I am a mobile app developer and i m searching for a roommate who has same interest as me.",
                            style: TextStyle(
                              color: Color(0xff1d3b58),
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.call,
                                color: Color(0xff1d3b58),
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.chat,
                                color: Color(0xff1d3b58),
                              ),
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
    );
  }
}
