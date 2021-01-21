import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kma/controller/initial_controller.dart';
import 'package:kma/models/schedule_kma.dart';

class ScheduleCard extends StatelessWidget {
  final Schedule data;
  final int index;

  ScheduleCard({this.data, this.index});

  @override
  Widget build(BuildContext context) {
    InitialController controller = Get.find();
    return InkWell(
      onTap: () => Get.bottomSheet(
        Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${data.date}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${data.lessons[index].subjectName}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    text: "Revenue & Budget: ",
                    children: [
                      TextSpan(
                        text: '${data.lessons[index].address}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '${data.lessons.length}',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
        ignoreSafeArea: false,
      ),
      child: SizedBox(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Card(
            margin: EdgeInsets.all(6),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 6.5,
            borderOnForeground: true,
            shadowColor: Colors.grey,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      data.lessons[index].subjectName,
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
