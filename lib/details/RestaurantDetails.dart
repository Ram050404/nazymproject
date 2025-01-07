import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';


import '../colors.dart';
import '../home/HomePage.dart';
import '../widgets/app_icon.dart';
import '../widgets/app_icon2.dart';


// Comment Model
class Comment {
  final String username;
  final String text;
  final DateTime timestamp;
  final int rating;
  final bool isVerified;

  Comment({
    required this.username,
    required this.text,
    required this.timestamp,
    required this.rating,
    required this.isVerified,
  });
}

class RestaurantDetail extends StatefulWidget {
  const RestaurantDetail({super.key});

  @override
  State<RestaurantDetail> createState() => _RestaurantDetailState();
}

class _RestaurantDetailState extends State<RestaurantDetail> {
  final TextEditingController _commentController = TextEditingController();
  int _userRating = 5;
  bool _isFavorite = false;
  final List<Comment> _comments = [
    Comment(
      username: "Rahma Zendaoui",
      text: "Great atmosphere and amazing food! The service was exceptional.",
      timestamp: DateTime.now().subtract(Duration(days: 2)),
      rating: 5,
      isVerified: true,
    ),
    Comment(
      username: "Nazym Noui",
      text: "Decent place but a bit pricey. The pasta was good though.",
      timestamp: DateTime.now().subtract(Duration(days: 5)),
      rating: 4,
      isVerified: false,
    ),
  ];

  Widget _buildRatingBar(int stars, double percentage) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text(
            '$stars★',
            style: GoogleFonts.poppins(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 100,
            height: 8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.grey[300],
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColors.bluecolor,
                ),
              ),
            ),
          ),
          SizedBox(width: 8),
          Text(
            '${(percentage * 100).toInt()}%',
            style: GoogleFonts.poppins(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(Comment comment) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    comment.username,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (comment.isVerified)
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Icon(Icons.verified, size: 16, color: AppColors.bluecolor),
                    ),
                ],
              ),
              Text(
                '${comment.timestamp.day}/${comment.timestamp.month}/${comment.timestamp.year}',
                style: GoogleFonts.poppins(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < comment.rating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              );
            }),
          ),
          SizedBox(height: 8),
          Text(
            comment.text,
            style: GoogleFonts.poppins(
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        _comments.insert(
          0,
          Comment(
            username: "Current User",
            text: _commentController.text,
            timestamp: DateTime.now(),
            rating: _userRating,
            isVerified: false,
          ),
        );
        _commentController.clear();
        _userRating = 5; // Reset rating
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Restaurant Image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/tinbox.jpg'),
                ),
              ),
            ),
          ),

          // Back and Favorite Buttons
          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                    });
                  },
                  child: AppIcon2(
                    icon: _isFavorite ? Icons.favorite : Icons.favorite_border_rounded,
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Positioned(
            left: 0,
            right: 0,
            top: 330,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Restaurant Name
                    Text(
                      'Restaurant Name',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),

                    // Rating and Reviews
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Text(
                          ' 4.5 ',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '(${_comments.length} reviews)',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Action Buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Location Button
                        ElevatedButton.icon(
                          onPressed: () async {
                            final url = 'https://www.google.com/maps/search/?api=1&query=YOUR_LAT,YOUR_LONG';
                            if (await canLaunch(url)) {
                              await launch(url);
                            }
                          },
                          icon: Icon(Icons.location_on, color: Colors.white),
                          label: Text(
                            'Location',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.bluecolor,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        // Call Button
                        ElevatedButton.icon(
                          onPressed: () async {
                            final tel = 'tel:+1234567890';
                            if (await canLaunch(tel)) {
                              await launch(tel);
                            }
                          },
                          icon: Icon(Icons.phone, color: Colors.white),
                          label: Text(
                            'Call',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.yellowcolor,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Description
                    Text(
                      'Description',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Discover our cozy restaurant offering a delightful blend of traditional and modern cuisine. Fresh ingredients, friendly service, and a warm atmosphere make every visit special.',
                      style: GoogleFonts.poppins(
                        color: Colors.grey[600],
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 30),

                    // Reviews Summary Section
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "4.5",
                                style: GoogleFonts.poppins(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.bluecolor,
                                ),
                              ),
                              Row(
                                children: List.generate(5, (index) {
                                  return Icon(
                                    index < 4 ? Icons.star : Icons.star_half,
                                    color: Colors.amber,
                                    size: 20,
                                  );
                                }),
                              ),
                              Text(
                                "${_comments.length} reviews",
                                style: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          VerticalDivider(color: Colors.grey[300], thickness: 1),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRatingBar(5, 0.8),
                              _buildRatingBar(4, 0.15),
                              _buildRatingBar(3, 0.03),
                              _buildRatingBar(2, 0.01),
                              _buildRatingBar(1, 0.01),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Feedback Section
                    Text(
                      'Feedback',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),

                    // Comment Input
                    Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            controller: _commentController,
                            decoration: InputDecoration(
                              hintText: 'Write your comment...',
                              hintStyle: GoogleFonts.poppins(color: Colors.grey[400]),
                              border: InputBorder.none,
                            ),
                            maxLines: 3,
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: List.generate(5, (index) {
                                  return IconButton(
                                    icon: Icon(
                                      index < _userRating ? Icons.star : Icons.star_border,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _userRating = index + 1;
                                      });
                                    },
                                  );
                                }),
                              ),
                              ElevatedButton(
                                onPressed: _addComment,
                                child: Text(
                                  'Submit',
                                  style: GoogleFonts.poppins(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.bluecolor,
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    // Comments List
                    ListView.builder(
                     shrinkWrap: true,
                    //  physics: NeverScrollableScrollPhysics(),
                      itemCount: _comments.length,
                      itemBuilder: (context, index) {
                        return _buildCommentItem(_comments[index]);
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

