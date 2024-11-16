import 'package:fitness_app/common/colo_exetion.dart';
import 'package:fitness_app/view_model/workout_view_model.dart';
import 'package:flutter/material.dart';
import 'package:custom_youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';


class ShowViewVideo extends StatefulWidget {
  final String id;
  const ShowViewVideo({
    super.key, required this.id,
  });

  @override
  State<ShowViewVideo> createState() => _ShowViewVideoState();
}

// List<String> videostraning = [
//   "https://youtu.be/wm47Swzn_98?si=ln3TObfQPpIGMG4b",
//   "https://youtu.be/h_yZV27H684?si=VxYByLVTZkQPIYbt",
//   "https://youtu.be/V7p_DmkYLZw?si=et_GS6VG-gV6ei-a"
// ];
// Map<String, String> mdata = {
//   "id": 'wm47Swzn_98',
//   "id1": 'h_yZV27H684',
//   "id2": 'V7p_DmkYLZw',
// };

// List<String> ids = [
//   'wm47Swzn_98',
//   'h_yZV27H684',
//   'V7p_DmkYLZw',
// ];

 String id = 'h_yZV27H684';
// bool isvisible = false;
final svObj = Get.put(WorkoutViewModel());

// IdVideoModel? _idVideoModel;

class _ShowViewVideoState extends State<ShowViewVideo> {
  final YoutubePlayerController _controller = YoutubePlayerController(
    
    initialVideoId: id,
    flags: const YoutubePlayerFlags(
      autoPlay: true,
      loop: false,
      disableDragSeek: false,
      controlsVisibleAtStart: false,
      hideControls: false,
    ),
  );
  @override
  void initState() {
    super.initState();
    // _idVideoModel = IdVideoModel(idvideo:id);
    // _idVideoModel?.idvideo ??'';
    // switch (id) {
    //   case 'wm47Swzn_98':
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => ShowViewVideoOne(video: ids.toString())));
    //     break;
        
    //   case 'h_yZV27H684':
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => ShowViewVideoTwo(video: ids.toString())));
    //     break;
    //   case 'V7p_DmkYLZw':
    //     Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) => ShowViewVideoThree(video: ids.toString())));
    //     break;
    //   default:
    //     return;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolo.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Tcolo.LightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              'assets/img/black_btn.png',
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Training',
          style: TextStyle(
              color: Tcolo.black, fontWeight: FontWeight.w700, fontSize: 17),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Tcolo.LightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                'assets/img/more_btn.png',
                width: 12,
                height: 12,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: YoutubePlayer(
                bottomActions: [
                  CurrentPosition(
                    controller: _controller,
                  ),
                  ProgressBar(isExpanded: true),
                ],
                actionsPadding: const EdgeInsets.all(12),
                showVideoProgressIndicator: false,
                controller: _controller,
                progressIndicatorColor: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
