import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_gallery/FirebaseFuncs.dart';
import 'package:go_gallery/components/TextInputFb1.dart';
import 'package:go_gallery/components/TopBarFb2Small.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location_picker_text_field/open_street_location_picker.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class AddRoadTrip extends StatefulWidget {
  const AddRoadTrip({super.key});

  @override
  State<AddRoadTrip> createState() => _AddRoadTripState();
}

class _AddRoadTripState extends State<AddRoadTrip> {

  TextEditingController _nameController = TextEditingController(); 
  TextEditingController _startDateController = TextEditingController(); 
  TextEditingController _endDateController = TextEditingController(); 
  TextEditingController _startLocationController = TextEditingController(); 
  TextEditingController _endLocationController = TextEditingController(); 

  String uid = FirebaseAuth.instance.currentUser!.uid; 
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: WaveWidget(
              config: CustomConfig(
                gradients: [
                  [Colors.orange, Colors.deepOrangeAccent],
                  [Colors.amber, Colors.yellowAccent],
                  [Colors.deepOrange, Colors.redAccent],
                  [Colors.orangeAccent, Colors.yellow]
                ],
                gradientBegin: Alignment.centerLeft,
                gradientEnd: Alignment.centerRight,
                durations: [3500, 19440, 10800, 6000],
                heightPercentages: [0.60, 0.63, 0.65, 0.70],
                blur: const MaskFilter.blur(BlurStyle.solid, 15),
              ),
              size: const Size(double.infinity, double.infinity),
            ),
          ),
          SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Begin your Roadtrip",
                      style: GoogleFonts.aBeeZee(
                          color: const Color.fromRGBO(243, 179, 75, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: height * 0.04), 
                  Container(width: width * 0.9, child: TextInputFb1(inputController: _nameController, hintText: "Roadtrip Name", prefixIcon: const Icon(Icons.title_outlined))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: width * 0.43, child: TextInputFb1(inputController: _startDateController, hintText: "Start Date", prefixIcon: const Icon(Icons.calendar_month_outlined))),
                      const SizedBox(width: 15),
                      Container(width: width * 0.43, child: TextInputFb1(inputController: _endDateController, hintText: "End Date", prefixIcon: const Icon(Icons.calendar_month_outlined))),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Container(
                    width: width * 0.9,
                    child: LocationPicker(
                      label: "From",
                      controller: _startLocationController,
                      onSelect: (data){
                        _startLocationController.text = data.displayname;
                      },
                    ),
                  ),
                  // Container(width: width * 0.43, child: TextInputFb1(inputController: _startLocationController, hintText: "Start Location", prefixIcon: const Icon(Icons.location_city))),
                  const SizedBox(height: 20),
                  Container(
                    width: width * 0.9,
                    child: LocationPicker(
                      label: "To",
                      controller: _endLocationController,
                      onSelect: (data){
                        _endLocationController.text = data.displayname;
                      },
                    ),
                  ),
                  // Container(width: width * 0.9, child: TextInputFb1(inputController: _nameController, hintText: "Roadtrip Name", prefixIcon: const Icon(Icons.title_outlined))),
                  SizedBox(height: 25),
                  Container(
                      width: width * 0.90,
                      child: ElevatedButton(
                        onPressed: () async {
                          dynamic res = addTrip(uid, _nameController.text, _startDateController.text, _endDateController.text, _startLocationController.text, _endLocationController.text);
                          Navigator.of(context).pop(); 
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromRGBO(255, 191, 99, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 24.0, vertical: 12.0),
                          child: Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
