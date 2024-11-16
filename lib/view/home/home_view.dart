import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/round_bottom.dart';
import 'package:fitness_app/common_widget/workout_row.dart';
import 'package:fitness_app/view/home/active_tracker_view.dart';
import 'package:fitness_app/view/home/finished_workout_view.dart';
import 'package:fitness_app/view/home/notification_view.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List lastworkootArr = [
    {
      'name': 'Fullbody Workout',
      'image': 'assets/img/Workout-Pic.png',
      'Kcal': '180 ',
      'time': '20',
      'progress': 0.3
    },
    {
      'name': 'Lowerbody Workout',
      'image': 'assets/img/Workout-Pic (1).png',
      'Kcal': '200 ',
      'time': '30',
      'progress': 0.4
    },
    {
      'name': 'Ab Workout',
      'image': 'assets/img/Workout3.png',
      'Kcal': '300 ',
      'time': '40',
      'progress': 0.7
    }
  ];

  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  List waterArr = [
    {'title': '6am - 8am', 'subtitle': '600ml'},
    {'title': '9am - 11am', 'subtitle': '500ml'},
    {'title': '11am - 2pm', 'subtitle': '1000ml'},
    {'title': '2pm - 4pm', 'subtitle': '700ml'},
    {'title': '4pm - now', 'subtitle': '900ml'},
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            Tcolo.primarycolor2.withOpacity(0.4),
            Tcolo.primarycolor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData:  FlDotData(show: false),
        gradient: LinearGradient(
          colors: Tcolo.primary,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text( 
                        'Welcome Back,',
                        style: TextStyle(color: Tcolo.gray, fontSize: 14),
                      ),
                      Text(
                        'mena',
                        style: TextStyle(
                            color: Tcolo.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NotificationView(),
                            ));
                      },
                      icon: Image.asset(
                        'assets/img/Notification-Icon.png',
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ))
                ],
              ),
              SizedBox(
                height: media.width * 0.08,
              ),
              Container(
                height: media.width * 0.4,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: Tcolo.primary),
                    borderRadius: BorderRadius.circular(media.width * 0.075)),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/img/Dots.png',
                      height: media.width * 0.3,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'BMI (Body Mass Index)',
                                style: TextStyle(
                                    color: Tcolo.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'You have a normal weight',
                                style: TextStyle(
                                    color: Tcolo.white.withOpacity(0.7),
                                    fontSize: 14),
                              ),
                              SizedBox(
                                height: media.width * 0.03,
                              ),
                              SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: RoundBottom(
                                      title: 'View More',
                                      Type: RoundedBottunType.bgSGradient,
                                      fontsize: 12,
                                      fontWeight: FontWeight.w400,
                                      onPressed: () {}))
                            ],
                          ),
                          AspectRatio(
                            aspectRatio: .7,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {},
                                ),
                                startDegreeOffset: 250,
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 1,
                                centerSpaceRadius: 0,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.08,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                    color: Tcolo.primarycolor1.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Today Target',
                      style: TextStyle(
                          color: Tcolo.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                        width: 80,
                        height: 35,
                        child: RoundBottom(
                            title: 'Check',
                            Type: RoundedBottunType.bgGradient,
                            fontsize: 12,
                            fontWeight: FontWeight.w400,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ActiveTrackerView(),
                                  ));
                            }))
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Text(
                ' Activity Status',
                style: TextStyle(
                    color: Tcolo.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: media.width * 0.4,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Tcolo.primarycolor1.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Heart Rate',
                              style: TextStyle(
                                  color: Tcolo.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            ShaderMask(
                              blendMode: BlendMode.srcIn,
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                        colors: Tcolo.primary,
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight)
                                    .createShader(Rect.fromLTRB(
                                        0, 0, bounds.width, bounds.height));
                              },
                              child: Text(
                                '78 BPM',
                                style: TextStyle(
                                    color: Tcolo.white.withOpacity(0.7),
                                    fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      ),
                      LineChart(
                        LineChartData(
                          showingTooltipIndicators:
                              showingTooltipOnSpots.map((index) {
                            return ShowingTooltipIndicators([
                              LineBarSpot(
                                tooltipsOnBar,
                                lineBarsData.indexOf(tooltipsOnBar),
                                tooltipsOnBar.spots[index],
                              ),
                            ]);
                          }).toList(),
                          lineTouchData: LineTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchCallback: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return;
                              }
                              if (event is FlTapUpEvent) {
                                final spotIndex =
                                    response.lineBarSpots!.first.spotIndex;
                                showingTooltipOnSpots.clear();
                                setState(() {
                                  showingTooltipOnSpots.add(spotIndex);
                                });
                              }
                            },
                            mouseCursorResolver: (FlTouchEvent event,
                                LineTouchResponse? response) {
                              if (response == null ||
                                  response.lineBarSpots == null) {
                                return SystemMouseCursors.basic;
                              }
                              return SystemMouseCursors.click;
                            },
                            getTouchedSpotIndicator: (LineChartBarData barData,
                                List<int> spotIndexes) {
                              return spotIndexes.map((index) {
                                return TouchedSpotIndicatorData(
                                   FlLine(
                                    color: Colors.transparent,
                                  ),
                                  FlDotData(
                                    show: true,
                                    getDotPainter:
                                        (spot, percent, barData, index) =>
                                            FlDotCirclePainter(
                                      radius: 3,
                                      color: Colors.white,
                                      strokeWidth: 3,
                                      strokeColor: Tcolo.scandrycolor1,
                                    ),
                                  ),
                                );
                              }).toList();
                            },
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Tcolo.scandrycolor1,
                              // getTooltipColor: (touchedSpot) =>
                              //     Tcolo.scandrycolor1,
                              tooltipRoundedRadius: 20,
                              getTooltipItems:
                                  (List<LineBarSpot> lineBarsSpot) {
                                return lineBarsSpot.map((lineBarSpot) {
                                  return LineTooltipItem(
                                    '${lineBarSpot.x.toInt()} mins ago',
                                    const TextStyle(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          lineBarsData: lineBarsData,
                          minY: 0,
                          maxY: 140,
                          titlesData:  FlTitlesData(show: false),
                          gridData:  FlGridData(show: false),
                          borderData: FlBorderData(
                            show: true,
                            border: Border.all(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: media.width * 0.02,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 25),
                      height: media.width * 0.95,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                            )
                          ]),
                      child: Row(
                        children: [
                          SimpleAnimationProgressBar(
                            height: media.width * 0.85,
                            width: media.width * 0.07,
                            backgroundColor: Colors.grey.shade100,
                            foregrondColor: Colors.purple,
                            ratio: 0.5,
                            direction: Axis.vertical,
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(seconds: 3),
                            borderRadius: BorderRadius.circular(15),
                            gradientColor: LinearGradient(
                                colors: Tcolo.primary,
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter),
                          ),
                          const SizedBox(
                            width: 17,
                          ),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Water Intake',
                                style: TextStyle(
                                    color: Tcolo.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                          colors: Tcolo.primary,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  '4 Liters',
                                  style: TextStyle(
                                      color: Tcolo.white.withOpacity(0.7),
                                      fontSize: 14),
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Text(
                                'Real time updates',
                                maxLines: 1,
                                style: TextStyle(
                                  color: Tcolo.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                ),
                              ),
                              const SizedBox(height: 13,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: waterArr.map(
                                  (wObj) {
                                    var isLast = wObj == waterArr.last;
                                    return Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                    color: Tcolo.scandrycolor1
                                                        .withOpacity(0.5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                              ),
                                              if (!isLast)
                                                DottedDashedLine(
                                                    height: media.width * 0.10,
                                                    width: 0,
                                                    dashColor: Tcolo
                                                        .scandrycolor1
                                                        .withOpacity(0.5),
                                                    axis: Axis.vertical)
                                            ]),
                                        
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              wObj['title'].toString(),
                                              style: TextStyle(
                                                color: Tcolo.gray,
                                                fontSize: 8,
                                              ),
                                            ),
                                            ShaderMask(
                                              blendMode: BlendMode.srcIn,
                                              shaderCallback: (Rect bounds) {
                                                return LinearGradient(
                                                        colors: Tcolo.primary,
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight)
                                                    .createShader(Rect.fromLTRB(
                                                        0,
                                                        0,
                                                        bounds.width,
                                                        bounds.height));
                                              },
                                              child: Text(
                                                wObj['subtitle'].toString(),
                                                style: TextStyle(
                                                    color: Tcolo.white
                                                        .withOpacity(0.7),
                                                    fontSize: 8),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    );
                                  },
                                ).toList(),
                              )
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: media.width * 0.05,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.maxFinite,
                          height: media.width * 0.50,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sleap',
                                style: TextStyle(
                                  color: Tcolo.black,
                                  fontSize: 14,
                                ),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                          colors: Tcolo.primary,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  '8h 20m',
                                  style: TextStyle(
                                      color: Tcolo.white.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Spacer(),
                              Image.asset(
                                'assets/img/Sleep-Graph.png',
                                width: double.maxFinite,
                                fit: BoxFit.fitWidth,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: media.width * 0.05,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: media.width * 0.45,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 25),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Calories',
                                style: TextStyle(
                                  color: Tcolo.black,
                                  fontSize: 14,
                                ),
                              ),
                              ShaderMask(
                                blendMode: BlendMode.srcIn,
                                shaderCallback: (Rect bounds) {
                                  return LinearGradient(
                                          colors: Tcolo.primary,
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight)
                                      .createShader(Rect.fromLTRB(
                                          0, 0, bounds.width, bounds.height));
                                },
                                child: Text(
                                  '760 kCal',
                                  style: TextStyle(
                                      color: Tcolo.white.withOpacity(0.7),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: media.width * 0.2,
                                  height: media.width * 0.2,
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        width: media.width * 0.15,
                                        height: media.width * 0.15,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: Tcolo.primary,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              media.width * 0.075),
                                        ),
                                        child: FittedBox(
                                          child: Text(
                                            '230kCal\nleft',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Tcolo.white,
                                                fontSize: 10),
                                          ),
                                        ),
                                      ),
                                      SimpleCircularProgressBar(
                                        progressStrokeWidth: 10,
                                        backStrokeWidth: 10,
                                        progressColors: Tcolo.primary,
                                        backColor: Colors.grey.shade100,
                                        valueNotifier: ValueNotifier(50),
                                        startAngle: -180,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Latest Workout',
                    style: TextStyle(
                        color: Tcolo.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'See more',
                      style: TextStyle(
                        color: Tcolo.gray,
                        fontSize: 14,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                  height: media.width * 0.5,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 15),
                  child: LineChart(
                    LineChartData(
                      showingTooltipIndicators:
                          showingTooltipOnSpots.map((index) {
                        return ShowingTooltipIndicators([
                          LineBarSpot(
                            tooltipsOnBar,
                            lineBarsData.indexOf(tooltipsOnBar),
                            tooltipsOnBar.spots[index],
                          ),
                        ]);
                      }).toList(),
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
                            return;
                          }
                          if (event is FlTapUpEvent) {
                            final spotIndex =
                                response.lineBarSpots!.first.spotIndex;
                            showingTooltipOnSpots.clear();
                            setState(() {
                              showingTooltipOnSpots.add(spotIndex);
                            });
                          }
                        },
                        mouseCursorResolver:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
                            return SystemMouseCursors.basic;
                          }
                          return SystemMouseCursors.click;
                        },
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((index) {
                            return TouchedSpotIndicatorData(
                               FlLine(
                                color: Colors.transparent,
                              ),
                              FlDotData(
                                show: true,
                                getDotPainter:
                                    (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                  radius: 3,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                  strokeColor: Tcolo.scandrycolor1,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: Tcolo.scandrycolor1,
                          // getTooltipColor: (touchedSpot) => Tcolo.scandrycolor1,
                          tooltipRoundedRadius: 20,
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                '${lineBarSpot.x.toInt()} mins ago',
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      lineBarsData: lineBarsData1,
                      minY: -0.5,
                      maxY: 110,
                      titlesData: FlTitlesData(
                          show: true,
                          leftTitles:  AxisTitles(),
                          topTitles:  AxisTitles(),
                          bottomTitles: AxisTitles(sideTitles: bottomTitles),
                          rightTitles: AxisTitles(sideTitles: rightTitles)),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 25,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Tcolo.gray.withOpacity(0.15),
                            strokeWidth: 2,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: media.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workout Progress',
                    style: TextStyle(
                        color: Tcolo.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: Tcolo.primary),
                        borderRadius: BorderRadius.circular(15)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        items: ['Weekly', 'Monthly']
                            .map((name) => DropdownMenuItem(
                                  value: name,
                                  child: Text(
                                    name,
                                    style: TextStyle(
                                        color: Tcolo.gray, fontSize: 14),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        icon: Icon(
                          Icons.expand_more,
                          color: Tcolo.white,
                        ),
                        hint: Text(
                          textAlign: TextAlign.center,
                          'Weekly',
                          style: TextStyle(color: Tcolo.gray, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: lastworkootArr.length,
                itemBuilder: (context, index) {
                  var wObj = lastworkootArr[index] as Map? ?? {};
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FinishedWorkoutView(),
                          ),
                        );
                      },
                      child: WorkoutRow(wObj: wObj));
                },
              ),
              SizedBox(
                height: media.width * 0.1,
              ),
            ],
          ),
        )),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = Tcolo.scandrycolor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 30,
                title: '',
                radius: 55,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  '20,1',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 12),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 42,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
          // getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );
  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          Tcolo.primarycolor2.withOpacity(0.5),
          Tcolo.primarycolor1.withOpacity(0.5)
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          Tcolo.scandrycolor2.withOpacity(0.5),
          Tcolo.scandrycolor1.withOpacity(0.5)
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData:  FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );
  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );
  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: Tcolo.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );
  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 2:
        text = Text('Mon',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 3:
        text = Text('Tue',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 4:
        text = Text('Wed',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 5:
        text = Text('Thu',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 6:
        text = Text('Fri',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      case 7:
        text = Text('Set',
            style: TextStyle(
              color: Tcolo.gray,
              fontSize: 12,
            ));
        break;
      default:
        text = const Text('');
        break;
    }
    return Container();

    // return SideTitleWidget(
    //   axisSide: meta.axisSide,
    //   space: 10,
    //   child: text,
    // );
  }
}
