import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trimly/booking_screen/choose_time.dart';
import 'package:trimly/booking_screen/modal/select_service_modal.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  dynamic _selectedService;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Service'),
        elevation: 5.0,
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: servicesList(),
      ),
    );
  }

  List<Widget> servicesList() {
    List<Widget> widgetList = [];
    List<Map<String, String>> services = [
      {
        "name": "Haircut",
        "duration": "30 mins",
        "price": "RM 30",
      },
      {
        "name": "Hair Dye",
        "duration": "45 - 60 mins",
        "price": "RM 80 ",
      },
      {
        "name": "Blowdry",
        "duration": "15 mins",
        "price": "RM 10",
      },
      {
        "name": "Beard Trim",
        "duration": "30 mins",
        "price": "RM 20",
      },
      {
        "name": "Hair Wash",
        "duration": "30 mins",
        "price": "RM 18",
      },
      {
        "name": "Shaving",
        "duration": "30 mins",
        "price": "RM 20",
      },
    ];
    for (var element in services) {
      widgetList.add(InkWell(
        onTap: () {
          setState(() {
            _selectedService = element;
          });
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SelectServiceModal(selectedService: _selectedService);
            },
          );
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (_selectedService != null)
                  ? ((_selectedService["name"].compareTo(element["name"]) == 0)
                      ? Colors.black
                      : Colors.white)
                  : Colors.white,
              border: Border.all(width: 1)),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(element["name"]!,
                        style: TextStyle(
                            fontStyle: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontStyle,
                            fontFamily: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontFamily,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .fontSize,
                            fontWeight: FontWeight.w600,
                            color: (_selectedService != null)
                                ? ((_selectedService["name"]
                                            .compareTo(element["name"]) ==
                                        0)
                                    ? Colors.white
                                    : Colors.black)
                                : Colors.black)),
                    Text(
                      element["duration"]!,
                      style: TextStyle(
                          fontStyle: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .fontStyle,
                          fontFamily: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .fontFamily,
                          fontSize:
                              Theme.of(context).textTheme.labelMedium!.fontSize,
                          fontWeight: FontWeight.w600,
                          color: (_selectedService != null)
                              ? ((_selectedService["name"]
                                          .compareTo(element["name"]) ==
                                      0)
                                  ? Colors.white
                                  : Colors.black)
                              : Colors.black),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (_selectedService != null)
                            ? ((_selectedService["name"]
                                        .compareTo(element["name"]) ==
                                    0)
                                ? Colors.grey[800]
                                : Color(0XFFD6D6D6))
                            : Color(0XFFD6D6D6)),
                    child: Text(
                      element["price"]!,
                      style: TextStyle(
                          color: (_selectedService != null)
                              ? ((_selectedService["name"]
                                          .compareTo(element["name"]) ==
                                      0)
                                  ? Colors.white
                                  : Colors.grey[800])
                              : Colors.grey[800],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    }
    return widgetList;
  }
}
