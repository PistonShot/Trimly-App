import 'package:flutter/material.dart';
import 'package:trimly/booking_screen/choose_time.dart';

class SelectServiceModal extends StatelessWidget {
  final dynamic selectedService;
  const SelectServiceModal({super.key, required this.selectedService});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Material(
        color: Colors.white,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Your Order',
                  style: TextStyle(
                      fontFamily: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .fontFamily,
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                      fontStyle:
                          Theme.of(context).textTheme.headlineMedium!.fontStyle,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  'Review your order , to select date and time.',
                  style: TextStyle(
                      fontFamily:
                          Theme.of(context).textTheme.labelLarge!.fontFamily,
                      fontSize:
                          Theme.of(context).textTheme.labelLarge!.fontSize,
                      fontStyle:
                          Theme.of(context).textTheme.labelLarge!.fontStyle,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(width: 2, color: Colors.grey)),
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
                        fontSize: 25,
                        fontStyle: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .fontStyle,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(selectedService["name"]),
                  trailing: Text(
                    selectedService["price"],
                    style: TextStyle(fontSize: 20),
                  ),
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
                                  MaterialStateProperty.all(Colors.black)),
                          child: const Text(
                            'Choose Your Time',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (builder) {
                              return ChooseTime(
                                selectedService: selectedService,
                              );
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
