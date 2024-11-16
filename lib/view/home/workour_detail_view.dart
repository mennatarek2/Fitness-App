import 'package:fitness_app/common_widget/exercises_set_section.dart';
import 'package:fitness_app/view/home/exercises_stpe_details.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';

import 'package:fitness_app/common_widget/icon_title_next_row.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/view/home/workout_schedule_view.dart';
import 'package:get/get.dart';

import '../../view_model/workout_view_model.dart';

class WorkoutDetailView extends StatefulWidget {
  final Map dObj;
  final String? vidoId;

  const WorkoutDetailView(
      {super.key, required this.dObj, required this.vidoId});

  @override
  State<WorkoutDetailView> createState() => _WorkoutDetailViewState();
}

class _WorkoutDetailViewState extends State<WorkoutDetailView> {
  final alllistWorkout = Get.put(WorkoutViewModel());

  List<String> ids = [
    'wm47Swzn_98',
    'h_yZV27H684',
    'V7p_DmkYLZw',
  ];
  List youArr = [
    {"image": "assets/img/barbell.png", "title": "Barbell"},
    {"image": "assets/img/skipping_rope.png", "title": "Skipping Rope"},
    {"image": "assets/img/bottle.png", "title": "Bottle 1 Liters"},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: Tcolo.primary)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Tcolo.LightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/img/black_btn.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Tcolo.LightGray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "assets/img/more_btn.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              ],
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/img/detail_top.png",
                  width: media.width * 0.75,
                  height: media.width * 0.8,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ];
        },
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Tcolo.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                            color: Tcolo.gray.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(3)),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                'Fitness'.toString(),
                                  style: TextStyle(
                                      color: Tcolo.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${widget.dObj["exercises"].toString()} | ${widget.dObj["time"].toString()} | 320 Calories Burn",
                                  style: TextStyle(
                                      color: Tcolo.gray, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Image.asset(
                              "assets/img/fav.png",
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/time.png",
                          title: "Schedule Workout",
                          time: "5/27, 09:00 AM",
                          color: Tcolo.primarycolor2.withOpacity(0.3),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      WorkoutScheduleView(dObj: widget.dObj)),
                            );
                          }),
                      SizedBox(
                        height: media.width * 0.02,
                      ),
                      IconTitleNextRow(
                          icon: "assets/img/difficulity.png",
                          title: "Difficulity",
                          time: "Beginner",
                          color: Tcolo.scandrycolor2.withOpacity(0.3),
                          onPressed: () {}),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You'll Need",
                            style: TextStyle(
                                color: Tcolo.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${widget.dObj.length} Items",
                              style: TextStyle(color: Tcolo.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.5,
                        child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:youArr.length,
                            itemBuilder: (context, index) {
                             var yObj = youArr[index] as Map? ?? {};
                              return Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: media.width * 0.35,
                                        width: media.width * 0.35,
                                        decoration: BoxDecoration(
                                            color: Tcolo.LightGray,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                          yObj["image"].toString(),
                                          width: media.width * 0.2,
                                          height: media.width * 0.2,
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          yObj["title"].toString(),
                                          style: TextStyle(
                                              color: Tcolo.black, fontSize: 12),
                                        ),
                                      )
                                    ],
                                  ));
                            }),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Exercises",
                            style: TextStyle(
                                color: Tcolo.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "${widget.dObj.length} Sets",
                              style: TextStyle(color: Tcolo.gray, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      ListView.builder(
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: alllistWorkout.allistfullbody.length,
                          itemBuilder: (context, index) {
                            var sObj = alllistWorkout.allistfullbody[index];
                            // var idv =
                            //     alllistWorkout.allistfullbody[index]['idvideo'];
                            return ExercisesSetSection(
                                sObj: sObj,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ExercisesStepDetails(
                                                  eObj: sObj)));
                                },
                            );
                                // idvideo: idv.toString());
                            // return ExercisesSetSection(
                            //   sObj: sObj,
                            //   onPressed: (obj) {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => ExercisesStepDetails(
                            //           eObj: obj,
                            //         ),
                            //       ),
                            //     );
                            //   },
                            // );
                          }),
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                    ],
                  ),
                ),
                SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RoundBottom(title: "Start Workout", onPressed: () {})
                    ],
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
