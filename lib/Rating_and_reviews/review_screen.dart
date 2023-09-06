import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rating_summary/rating_summary.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 250, 250),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Rating and reviews',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 25,
            left: 12,
            right: 12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingSummary(
                counter: 13,
                average: 3.846,
                counterFiveStars: 5,
                counterFourStars: 4,
                counterThreeStars: 2,
                counterTwoStars: 1,
                counterOneStars: 1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Text(
                "2 reviews",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              CustomerReviewList()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerReviewList extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {
      'name': 'John Doe',
      'image':
          'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
      'rating': 5,
      'reviewText':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla eget quam at eros tempor bibendum ac sed leo.'
    },
    {
      'name': 'Jane Smith',
      'image':
          'https://images.healthshots.com/healthshots/en/uploads/2020/12/08182549/positive-person.jpg',
      'rating': 4,
      'reviewText':
          'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.'
    },
    // Add more reviews as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: reviews.length,
      itemBuilder: (ctx, index) {
        final review = reviews[index];
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                margin: EdgeInsets.only(bottom: 8),
                elevation: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: MediaQuery.of(context).size.height * 0.05,
                    //   width: MediaQuery.of(context).size.height * 0.05,
                    //   decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.amber,
                    //       image: DecorationImage(
                    //           image: NetworkImage(review["image"]),
                    //           fit: BoxFit.cover)),
                    //   // child: Image.network(
                    //   //   review['image'],
                    //   //   //height: 200,
                    //   //   //width: double.infinity,
                    //   //   fit: BoxFit.cover,
                    //   // ),
                    // ),
                    ListTile(
                      title: Text(review['name']),
                      subtitle: RatingBar.builder(
                        itemSize: 14,
                        initialRating: 3,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.5),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 16),
                      child: Text(review['reviewText']),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.03,
              width: MediaQuery.of(context).size.height * 0.03,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber,
                  image: DecorationImage(
                      image: NetworkImage(review["image"]), fit: BoxFit.cover)),
              // child: Image.network(
              //   review['image'],
              //   //height: 200,
              //   //width: double.infinity,
              //   fit: BoxFit.cover,
              // ),
            ),
          ],
        );
      },
    );
  }
}
