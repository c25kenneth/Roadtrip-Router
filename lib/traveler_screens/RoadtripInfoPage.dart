import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_gallery/traveler_screens/Roadtrips.dart';
import 'package:go_gallery/traveler_screens/TripMap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:readmore/readmore.dart';

class TripInfoPage extends StatefulWidget {
  final double rating; 
  final String startingLocation;
  final double startingLat; 
  final double startingLong; 
  final double endingLat; 
  final double endingLong;  
  final String title; 
  final String description; 
  final String imageURL; 

  const TripInfoPage({super.key, required this.rating, required this.startingLocation, required this.description, required this.imageURL, required this.title, required this.startingLat, required this.startingLong, required this.endingLat, required this.endingLong});

  @override
  State<TripInfoPage> createState() => _TripInfoPageState();
}

class _TripInfoPageState extends State<TripInfoPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.45,
            leading: Padding(
              padding: const EdgeInsets.all(8.0), // Adjust padding as needed
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Color.fromRGBO(236, 183, 102, 1.0), // Icon color
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.only(left: 16.0, bottom: 16.0),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: Image.network(
                  widget.imageURL,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 20,
                right: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(widget.title,
                            style: GoogleFonts.aBeeZee(
                                color: Colors.blueGrey[900],
                                fontSize: 26,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.5),
                  Row(
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Ionicons.star,
                                size: 22,
                                color: Color.fromRGBO(236, 183, 102, 1.0),
                              ),
                            ),
                            TextSpan(
                                text: " ${widget.rating}",
                                style: GoogleFonts.aBeeZee(
                                  color: Colors.grey[500],
                                  fontSize: 18,
                                )),
                          ],
                        ),
                      ),
                      SizedBox(width: 20),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Icon(
                                  Ionicons.location,
                                  size: 22,
                                  color: Color.fromRGBO(236, 183, 102, 1.0),
                                ),
                              ),
                              TextSpan(
                                  text: " ${widget.startingLocation}",
                                  style: GoogleFonts.aBeeZee(
                                    color: Colors.grey[500],
                                    fontSize: 18,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 12.0, bottom: 25.0),
                    child: ReadMoreText(
                     widget.description,
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: " Show More ",
                      trimExpandedText: " Show Less ",
                      lessStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(3, 201, 169, 0.7),
                      ),
                      moreStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(3, 201, 169, 0.7),
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        height: 2,
                      ),
                    ),
                  ),

                  Container(
                  width: screenWidth * 0.90,
                  margin: EdgeInsets.only(bottom: 50.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => TripLocations()));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => TripMap(startingLat: widget.startingLat, startingLong: widget.startingLong, endingLat: widget.endingLat, endingLong: widget.endingLong)));
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(255, 191, 99, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
                      child: Text(
                        "Start roadtrip",
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
