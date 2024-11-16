import 'package:fitness_app/view/photo_progress/photo_progress_view.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/tap_botton.dart';
import 'package:fitness_app/view/Profile/profile_view.dart';
import 'package:fitness_app/view/home/home_view.dart';
import 'package:fitness_app/view/home/workout_view.dart';

class MainTapView extends StatefulWidget {
  const MainTapView({super.key});

  @override
  State<MainTapView> createState() => _MainTapViewState();
}

class _MainTapViewState extends State<MainTapView> {
  int selectedtap = 0;
  PageStorageBucket pageBucket = PageStorageBucket();
  Widget curenttab = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: pageBucket, child: curenttab),
      backgroundColor: Tcolo.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 70,
        width: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: Tcolo.primary),
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 2,
                      offset: Offset(0, -2))
                ]),
            child: Icon(
              Icons.search,
              color: Tcolo.white,
              size: 35,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
            color: Tcolo.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TapBotton(
                  icon: 'assets/img/Home.png',
                  selecticon: 'assets/img/Home2.png',
                  onTap: () {
                    curenttab = const HomeView();
                    selectedtap = 0;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectedtap == 0),
              TapBotton(
                  icon: 'assets/img/Activity (1).png',
                  selecticon: 'assets/img/Activity.png',
                  onTap: () {
                    curenttab = const WorkoutTrackerView();
                    selectedtap = 1;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectedtap == 1),
              const SizedBox(
                width: 40,
              ),
              TapBotton(
                  icon: 'assets/img/Camera (1).png',
                  selecticon: 'assets/img/Camera.png',
                  onTap: () {
                    curenttab = const PhotoProgressView();
                    selectedtap = 2;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectedtap == 2),
              TapBotton(
                  icon: 'assets/img/Profile2.png',
                  selecticon: 'assets/img/Profile (1).png',
                  onTap: () {
                    curenttab = const ProfileView();
                    selectedtap = 3;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectedtap == 3),
            ],
          ),
        ),
      ),
    );
  }
}
