import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class TripCard extends StatelessWidget {
  const TripCard({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTapFunction,
    required this.width,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String subtitle;
  final Color color;
  final Function onTapFunction;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFunction();
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(158, 158, 158, 1).withOpacity(.2),
              blurRadius: 14.0, // soften the shadow
              spreadRadius: 0.0, // extend the shadow
              offset: Offset(
                0.0, // Move to right 10 horizontally
                2.0, // Move to bottom 10 vertically
              ),
            ),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: Card(
          elevation: 0.0,
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14),
                      bottomRight: Radius.circular(14),
                    ),
                    child: (imgUrl == "images/undraw_trip_rh66.svg") ? SvgPicture.asset(
                      imgUrl,
                      height: 120,
                      fit: BoxFit.cover,
                    ) : Image.network(
                      imgUrl,
                      width: width,
                      height: 120,
                      fit: BoxFit.cover,
                    ) 
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: LikeButton(
                        onPressed: () {},
                        color: Colors.orange,
                      ),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.aBeeZee(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Ionicons.location_outline,
                        color: Color.fromRGBO(3, 201, 169, 0.7),
                      ),
                      SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.aBeeZee(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(3, 201, 169, 0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeListTile extends StatelessWidget {
  const LikeListTile(
      {Key? key,
      required this.title,
      required this.likes,
      required this.subtitle,
      this.color = Colors.grey})
      : super(key: key);

  final String title;
  final String likes;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      title: Text(title),
      subtitle: Row(
        children: [
          Icon(Icons.favorite, color: Colors.orange, size: 15),
          SizedBox(width: 2),
          Text(likes),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(width: 4, height: 4),
            ),
          ),
          Text(subtitle),
        ],
      ),
      trailing: LikeButton(onPressed: () {}, color: Colors.orange),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({
    Key? key,
    required this.onPressed,
    this.color = Colors.black12,
  }) : super(key: key);

  final Function onPressed;
  final Color color;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white, // White background color
      ),
      padding: EdgeInsets.all(0.01), // Space between the icon and the container
      child: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: widget.color,
        ),
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
          });
          widget.onPressed();
        },
      ),
    );
  }
}
