import 'package:flutter/material.dart';

class MyContent extends StatefulWidget {
  const MyContent({Key? key}) : super(key: key);

  @override
  State<MyContent> createState() => _MyContentState();
}

class _MyContentState extends State<MyContent> {
  TextEditingController activityController = TextEditingController(text: "");
  TextEditingController locationController = TextEditingController(text: "");
  TextEditingController dateController = TextEditingController(text: "");
  TextEditingController timeController = TextEditingController(text: "");
  List<Map<String, String>> schedules = [];
  DateTimeRange? selectedDate;
  TimeOfDay? selectedTime;
  String dateResult = "";
  String timeResult = "";
  double width = 0;
  double height = 0;

  String convertMonth(input) {
    switch (input) {
      case '01':
        return "January";
      case '02':
        return "February";
      case '03':
        return "March";
      case '04':
        return "April";
      case '05':
        return "May";
      case '06':
        return "June";
      case '07':
        return "July";
      case '08':
        return "August";
      case '09':
        return "September";
      case '10':
        return "October";
      case '11':
        return "November";
      case '12':
        return "December";
      default:
        throw ("Please input month");
    }
  }

  @override
  Widget build(BuildContext context) {
    var flexWidth = MediaQuery.of(context).size.width;
    var flexHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent.withOpacity(0),
        elevation: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 30,
                spreadRadius: 1,
                offset: const Offset(2, 2),
              )
            ],
            image: const DecorationImage(
              image: AssetImage("assets/schedule.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        toolbarHeight: 200,
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          width: flexWidth,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 30),
                width: flexWidth - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                      hintText: "Schedule a Date",
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                        onPressed: () async {
                          selectedDate = await showDateRangePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              lastDate: DateTime(3000),
                              currentDate: DateTime.now(),
                              saveText: 'Done');

                          if (selectedDate != null) {
                            setState(() {
                              dateResult = selectedDate.toString();
                              var firstMonth = "";
                              var secondMonth = "";
                              firstMonth = convertMonth(
                                  dateResult.split(" ")[0].split("-")[1]);
                              secondMonth = convertMonth(
                                  dateResult.split(" ")[3].split("-")[1]);
                              dateController.text =
                                  "$firstMonth ${dateResult.split(" ")[0].split("-")[2]}, ${dateResult.split(" ")[0].split("-")[0]} - $secondMonth ${dateResult.split(" ")[3].split("-")[2]}, ${dateResult.split(" ")[3].split("-")[0]}";
                              print(dateResult.split(" ")[0]);
                            });
                          }
                        },
                      ),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: flexWidth - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: TextField(
                  controller: timeController,
                  decoration: InputDecoration(
                    hintText: "Schedule a Time",
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.timer, color: Colors.black),
                      onPressed: () async {
                        selectedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.dial,
                        );

                        if (selectedTime != null) {
                          setState(() {
                            timeResult =
                                selectedTime!.format(context).toString();
                            timeController.text = timeResult;
                            print(timeResult);
                          });
                        }
                      },
                    ),
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: flexWidth - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: TextField(
                  controller: activityController,
                  decoration: const InputDecoration(
                      hintText: "Schedule a Activity",
                      suffixIcon: Icon(Icons.run_circle, color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: flexWidth - 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 20,
                        spreadRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                child: TextField(
                  controller: locationController,
                  decoration: const InputDecoration(
                      hintText: "Schedule a Location",
                      suffixIcon:
                          Icon(Icons.location_city, color: Colors.black),
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                margin: const EdgeInsets.only(top: 20),
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      const Color.fromARGB(255, 90, 13, 223).withOpacity(0.6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 1,
                      offset: const Offset(2, 2),
                    )
                  ],
                ),
                child: Center(
                  child: TextButton(
                    child: const Text(
                      "Create List",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        if (dateController.text != "" &&
                            timeController.text != "" &&
                            activityController.text != "" &&
                            locationController.text != "") {
                          schedules.insert(0, {
                            "dateRange": dateController.text,
                            "time": timeController.text,
                            "activity": activityController.text,
                            "location": locationController.text,
                            "state": "false",
                          });
                          dateController.clear();
                          timeController.clear();
                          activityController.clear();
                          locationController.clear();
                          width = double.infinity;
                          height = 200;
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: const Text(
                                "Please Fill The Data above!!",
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("ok"))
                              ],
                            ),
                          );
                        }
                      });
                    },
                  ),
                ),
              ),
              const Divider(
                height: 60,
                indent: 50,
                endIndent: 50,
                thickness: 1,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(right: 10, left: 10),
                child: Column(
                  children: schedules.map((item) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      margin: const EdgeInsets.only(bottom: 20),
                      curve: Curves.easeInOut,
                      width: width,
                      height:
                          item["activity"]!.length > 16 ? height + 30 : height,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 20,
                            spreadRadius: 1,
                            offset: const Offset(2, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            height: double.infinity,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: const BoxDecoration(
                              // color: Colors.purple,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "${item["dateRange"]!.split(" ")[0]}\n${item["dateRange"]!.split(" ")[1].split(",")[0]}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child:
                                      Container(width: 1, color: Colors.black),
                                ),
                                Container(
                                  child: Text(
                                    "${item["dateRange"]!.split(" ")[4]}\n${item["dateRange"]!.split(" ")[5].split(",")[0]}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 12, bottom: 12),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 87, 39, 176)
                                        .withOpacity(0.3),
                                    const Color.fromARGB(255, 87, 39, 176)
                                        .withOpacity(0.9),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        item["activity"]!,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontFamily: "sans-serif",
                                            color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 25, bottom: 5),
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.white,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              item["location"]!,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Row(
                                        children: const [
                                          Icon(
                                            Icons.location_city,
                                            color: Colors.white,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Medan, Indonesia",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 5, bottom: 5),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.timer,
                                            color: Colors.white,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            item["time"]!,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
