import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({super.key});

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.75,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Confirm Booking',
                        style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontFamily,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontStyle,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black),
                      child: Text(
                        "RM 40",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                    leading: ClipRRect(
                      child: Image.asset(
                        'assets/images/default-user.jpg',
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    title: Text(
                      "Irfan Ghapar",
                      style: TextStyle(
                          fontFamily: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontFamily,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .fontSize,
                          fontStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .fontStyle,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Unversiti Putra Malaysia,\nSeri Serdang')),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    'Payment Method',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            Theme.of(context).textTheme.headlineSmall!.fontSize,
                        fontStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontStyle),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: (_selectedIndex == 0)
                                  ? Colors.black
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      leading: ClipRRect(
                        child: Icon(
                          Icons.payment,
                          size: 50,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        "Credit or Debit Card",
                        style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontFamily,
                            fontSize: 20,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontStyle,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Visa',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 1;
                    });
                  },
                  child: ListTile(
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 1,
                              color: (_selectedIndex == 1)
                                  ? Colors.black
                                  : Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      leading: ClipRRect(
                        child: Icon(
                          Icons.store_rounded,
                          size: 50,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: Text(
                        "Pay in Person",
                        style: TextStyle(
                            fontFamily: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontFamily,
                            fontSize: 20,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .fontStyle,
                            fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Cash',
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.black)),
                          child: const Text(
                            'Book',
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return Container();
                            }));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 5),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
