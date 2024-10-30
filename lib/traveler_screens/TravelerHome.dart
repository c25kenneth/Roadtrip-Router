import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_gallery/components/RoadtripCard.dart';
import 'package:go_gallery/components/TopBarFb2Small.dart';
import 'package:go_gallery/traveler_screens/RoadtripInfoPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class VisitorHome extends StatefulWidget {
  const VisitorHome({super.key});

  @override
  State<VisitorHome> createState() => _VisitorHomeState();
}

class _VisitorHomeState extends State<VisitorHome> {
  List roadtrips = [
  
  {
    "imgUrl": "https://cdn.allmounthood.com/images/content/8452_9859_Columbia_River_Scenic_Highway_lg.jpg",
    "title": "Columbia River Gorge Scenic Drive",
    "subtitle": "Columbia River, OR",
    "color": Colors.orange,
    "onTapFunction": () {}
  },
  {
    "imgUrl": "https://www.travelandleisure.com/thmb/zChIPwFln0Eczkyy6C3wtUSJm-c=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/PCH0815-brixy-bridge-d738137d42ed44aa835292cf33d6c7a5.jpg",
    "title": "Pacific Coast Highway",
    "subtitle": "Starting from Seattle, WA",
    "color": Colors.orange,
    "onTapFunction": () {}
  },
  {
    "imgUrl": "https://static.myscenicdrives.com/images/wa/olympic-peninsula-loop.jpg",
    "title": "Olympic Peninsula Loop",
    "subtitle": "Olympic Peninsula, WA",
    "color": Colors.orange,
    "onTapFunction": () {}
  },
  {
    "imgUrl": "https://experiencemississippiriver.com/10states/wp-content/uploads/2021/08/grr-fall-time.jpg",
    "title": "Great River Road Trip",
    "subtitle": "Mississippi River, WA",
    "color": Colors.orange,
    "onTapFunction": () {}
  },
];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height; 
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}, 
      child: Icon(Icons.add_outlined, color: Colors.white), backgroundColor: Colors.orangeAccent,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(12.0, 12, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: const TopBarFb2Small(
                        title: "Welcome",
                        upperTitle: "Begin a Dynamic Experience",
                      ),
                    ),
                    PopupMenuButton(
                      icon: Icon(Ionicons.menu_outline),
                      surfaceTintColor: Colors.white,
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(
                              Ionicons.person_outline,
                              color: Color.fromRGBO(243, 179, 75, 1),
                            ),
                            title: Text(
                              "View Profile",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(243, 179, 75, 1), // Default color
                                ),
                              ),
                            ),
                          ),
                          value: "View Profile",
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Ionicons.settings_outline,
                                color: Color.fromRGBO(243, 179, 75, 1)),
                            title: Text(
                              "Settings",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(243, 179, 75, 1), // Default color
                                ),
                              ),
                            ),
                          ),
                          value: "Settings",
                        ),
                        PopupMenuItem(
                          child: ListTile(
                            leading: Icon(Ionicons.log_out_outline,
                                color: Color.fromRGBO(243, 179, 75, 1)),
                            title: Text(
                              "Sign Out",
                              style: GoogleFonts.aBeeZee(
                                textStyle: const TextStyle(
                                  fontSize: 15.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(243, 179, 75, 1), // Default color
                                ),
                              ),
                            ),
                          ),
                          value: "Sign Out",
                        ),
                      ],
                      onSelected: (dynamic value) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text("Featured Roadtrips",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("See All",
                          style: GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(243, 179, 75, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200, // Fixed height for the first ListView
                  child: ListView.separated(
                    itemCount: 1,
                    padding: EdgeInsets.only(right: 12.0),
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      return TripCard(
                          width: MediaQuery.of(context).size.width * 0.45,
                          imgUrl:
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Snoqualmie_Falls%2C_Snoqualmie%2C_WA.jpeg/800px-Snoqualmie_Falls%2C_Snoqualmie%2C_WA.jpeg",
                          title: "The Cascades & Wine Country Loop",
                          subtitle: "10201 NE 4th St, Bellevue, WA 98004",
                          color: Colors.orange,
                          onTapFunction: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TripInfoPage(title: "The Cascades & Wine Country Loop", rating: 4.7, imageURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Snoqualmie_Falls%2C_Snoqualmie%2C_WA.jpeg/800px-Snoqualmie_Falls%2C_Snoqualmie%2C_WA.jpeg", startingLocation: "10201 NE 4th St, WA 98004", description: "The Cascades & Wine Country Loop is a scenic road trip that begins in Bellevue, Washington, and takes you through some of the state’s most breathtaking landscapes. Starting with a stop at Snoqualmie Falls, you’ll experience the powerful beauty of one of Washington’s most famous waterfalls. From there, travel to the charming Bavarian village of Leavenworth for unique shops and mountain views, before continuing to Lake Chelan for lake activities and wine tasting in the heart of Washington’s wine country. The journey then leads to the North Cascades National Park, where you’ll see rugged peaks and crystal-clear lakes along the “American Alps.” As you head west, stop at Deception Pass State Park for Puget Sound views before relaxing on Whidbey Island with its historic towns and scenic beaches. This loop offers a perfect mix of adventure, nature, and local culture, making it an unforgettable exploration of Washington’s highlights.",)));
                          });
                    },
                  ),
                ),

                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Text("Other Roadtrips",
                        style: GoogleFonts.aBeeZee(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.bold)),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("See All",
                          style: GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(243, 179, 75, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200, // Fixed height for the second ListView
                  child: ListView.separated(
                    padding: EdgeInsets.only(right: 12.0),
                    itemCount: roadtrips.length,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) {
                      return TripCard(
                          width: MediaQuery.of(context).size.width * 0.45,
                          imgUrl: roadtrips[index]["imgUrl"],
                          title: roadtrips[index]["title"],
                          subtitle: roadtrips[index]["subtitle"],
                          color: Colors.orange,
                          onTapFunction: () {});
                    },
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