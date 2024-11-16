import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/common_widget/on_bording_page.dart';
import 'package:fitness_app/view/login/sign_up_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      selectPage = controller.page?.round() ?? 0;
      setState(() {});
    });
  }

  List pageArr = [
    {
      'title': 'Track Your Goal',
      'subtitle':
          'Don\'t worry if you have trouble determining your goals, We can help you determine your gools and track your goals',
      'image': 'assets/img/on_1.png',
    },
    {
      'title': 'Get Burn',
      'subtitle':
          'Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever',
      'image': 'assets/img/on_2.png',
    },
    {
      'title': 'Eat Well',
      'subtitle':
          'Let\'s start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun',
      'image': 'assets/img/on_3.png',
    },
    {
      'title': 'Improve Sleep  Quality',
      'subtitle':
          'Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning',
      'image': 'assets/img/on_4.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolo.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return OnBordingPage(pObj: pObj);
            },
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    color: Tcolo.primarycolor1,
                    value: (selectPage + 1) / 4,
                    strokeWidth: 2,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Tcolo.primarycolor1,
                      borderRadius: BorderRadius.circular(35)),
                  child: IconButton(
                      onPressed: () {
                        if (selectPage < 3) {
                          selectPage = selectPage + 1;
                          controller.animateToPage(selectPage,
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.bounceInOut);

                          setState(() {});
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpView()));
                        }
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
