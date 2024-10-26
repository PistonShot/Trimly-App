import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:trimly/booking_screen/select_service.dart';

class LocationCard extends StatelessWidget {
  final String displayImage;
  final String businessName;
  final String rating;
  final String shortAddress;
  final String heroTag;
  final String? ratingCount;
  const LocationCard(
      {super.key,
      required this.displayImage,
      required this.businessName,
      required this.rating,
      required this.shortAddress,
      required this.heroTag,
      this.ratingCount});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag,
      child: Material(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute<Widget>(builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(),
                  body: Center(
                    child: SingleChildScrollView(
                      child: Hero(
                        tag: heroTag,
                        child: Material(
                            child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                child: Image.asset(displayImage),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  businessName,
                                  style: TextStyle(
                                      fontStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .fontStyle,
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .fontSize,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .fontFamily),
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      rating,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall,
                                    ),
                                  ),
                                  RatingBar.builder(
                                    ignoreGestures: true,
                                    initialRating: double.parse(rating),
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemBuilder: (context, _) => const Icon(
                                      Icons.star_rounded,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                    itemSize: 25,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('(${ratingCount ?? 0})'),
                                  )
                                ],
                              ),
                              Text(shortAddress),
                              Text(
                                'Open',
                                style: TextStyle(color: Colors.green),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Divider(
                                thickness: 1.2,
                              ),
                              Text(
                                "Rating",
                                style: TextStyle(
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .fontSize,
                                    fontFamily: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .fontFamily,
                                    fontWeight: FontWeight.w600),
                              ),
                              Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 10.0, top: 10.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: ClipRRect(
                                                child: Image.asset(
                                                  'assets/images/default-user.jpg',
                                                  fit: BoxFit.cover,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "John Doe",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Rating",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          RatingBar.builder(
                                            ignoreGestures: true,
                                            initialRating: 5,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star_rounded,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                            itemSize: 25,
                                          ),
                                        ],
                                      ),
                                      Text(
                                          "Prince Barbershop is fantastic! The staff is incredibly professional and friendly. I always leave with a great haircut that exceeds my expectations. Highly recommended!"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  floatingActionButton: SizedBox(
                    width: MediaQuery.of(context).size.width - 40,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (builder) {
                                  return SelectService();
                                }));
                              },
                              child: Text(
                                'Book Now',
                                style: TextStyle(fontSize: 15, color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.fromLTRB(20, 10, 20, 10)),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                  backgroundColor: MaterialStateProperty.all(Colors.black)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          },
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: (MediaQuery.of(context).size.height -
                        kToolbarHeight -
                        kBottomNavigationBarHeight) *
                    0.3,
                width: double.infinity,
                constraints: const BoxConstraints(minHeight: 350),
                child: Column(
                  children: [
                    Flexible(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            displayImage,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                businessName,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(rating)),
                            ),
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: double.parse(rating),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star_rounded,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              itemSize: 25,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(shortAddress)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
