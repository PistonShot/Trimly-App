import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trimly/Provider/provider.dart';
import 'package:trimly/booking_screen/modal/choose_time_modal_confirm.dart';
import 'package:intl/intl.dart';

class ChooseTime extends StatefulWidget {
  final dynamic selectedService;
  const ChooseTime({super.key, required this.selectedService});

  @override
  State<ChooseTime> createState() => _ChooseTimeState();
}

class _ChooseTimeState extends State<ChooseTime> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  String _selectedTime = "00:00";
  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose A Time'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 5.0, bottom: 20),
              child: Text(
                'Select a date',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            SizedBox(
              height: 100,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: Colors.black,
                selectedTextColor: Colors.white,
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 20),
              child: Text(
                'Times',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
              ),
              child: Text(
                '14 Times Available',
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: GridView.count(
                  mainAxisSpacing: 0,
                  crossAxisCount: 3,
                  childAspectRatio: 2, // Adjust the aspect ratio as needed
                  children: getAvailableTimes(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getAvailableTimes() {
    List<String> times = [
      "10:00",
      "10:30",
      "11:00",
      "11:30",
      "12:00",
      "14:00",
      "14:30",
      "15:00",
      "15:30",
      "16:00",
      "16:30",
    ];
    List<Widget> widgetList = [];
    for (var element in times) {
      widgetList.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            setState(() {
              _selectedTime = element;
            });
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                String formattedDate =
                    DateFormat('d MMMM, yyyy').format(_selectedDate);

                String dateTime = "$formattedDate at $_selectedTime";
                return ChooseTimeConfirm(
                  dateTime: dateTime,
                );
              },
            );
          },
          child: Container(
            height: 50, // Fixed height
            child: Center(
                child: Text(
              element,
              style: TextStyle(
                  color: (_selectedTime.compareTo(element) == 0)
                      ? Colors.white
                      : Colors.black),
            )),
            decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: (_selectedTime.compareTo(element) == 0)
                    ? Colors.black
                    : Colors.white),
          ),
        ),
      ));
    }

    return widgetList;
  }
}
