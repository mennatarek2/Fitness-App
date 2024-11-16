import 'package:flutter/material.dart';

class ExercisesSetSection extends StatelessWidget {
  final Map sObj;
  final String? idvideo;
  final VoidCallback onPressed;
  const ExercisesSetSection(
      {super.key, required this.sObj, required this.onPressed,  this.idvideo});

  @override
  Widget build(BuildContext context) {
    // var exercisesArr = sObj["set"] as List? ?? [];
    // var exercisesId = sObj['videoId'] as List? ?? [];
    // for (var exercisesId = 0; exercisesId < exercisesId.bitLength; exercisesId++) {
    //   ShowViewVideo(video: exercisesId.toString());
      
    // }
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      sObj['images'],
                      width: 80,
                      height: 80,
                      fit: BoxFit.contain,
                    ),
                  ),
                  
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sObj['name'].toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                sObj['category'].toString(),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ),
              ),
              // Text(
              //   sObj['idvideo'].toString(),
              //   style: const TextStyle(
              //     color: Colors.grey,
              //     fontSize: 10,
              //   ),
              // ),
            ],
          ),
        ),
        IconButton(
            splashColor: Colors.white24,
            onPressed: onPressed,
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.grey,
            )),
      ],
    );
  }
}
