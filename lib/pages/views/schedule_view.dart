import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kma/controller/initial_controller.dart';
import 'package:kma/enum/enums.dart';
import 'package:kma/widgets/schedule_card.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class ScheduleView extends GetView<InitialController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schedule KMA"),
      ),
      resizeToAvoidBottomInset: false,
      body: Obx(
        () {
          Status statusMV = controller.statusGetSchedule.value;
          return SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, left: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Schedule',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
                statusMV == Status.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : statusMV == Status.error
                        ? Center(
                            child: Text(
                                'There is an error occured while looking for movie(s) :('),
                          )
                        : WaterfallFlow.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) =>
                                ScheduleCard(
                              data: controller.schedule.value.schedule[index],
                              index: index,
                            ),
                            itemCount:
                                controller.schedule.value.schedule.length,
                            gridDelegate:
                                SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5.0,
                              mainAxisSpacing: 5.0,
                              lastChildLayoutTypeBuilder: (index) => index ==
                                      controller.schedule.value.schedule.length
                                  ? LastChildLayoutType.foot
                                  : LastChildLayoutType.none,
                            ),
                          ),
              ],
            ),
          );
        },
      ),
    );
  }
}
