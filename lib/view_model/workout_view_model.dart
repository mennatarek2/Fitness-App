import 'package:get/get.dart';

class WorkoutViewModel extends GetxController {
  final allistfullbody = [
    {
      "name": "3/4 Sit-Up",
      "force": "pull",
      "level": "beginner",
      "idvideo": "wm47Swzn_98",
      "mechanic": "compound",
      "equipment": "body only",
      "primaryMuscles": ["abdominals"],
      "secondaryMuscles": [],
      "instructions": [
        "Lie down on the floor and secure your feet. Your legs should be bent at the knees.",
        "Place your hands behind or to the side of your head. You will begin with your back on the ground. This will be your starting position.",
        "Flex your hips and spine to raise your torso toward your knees.",
        "At the top of the contraction your torso should be perpendicular to the ground. Reverse the motion, going only ¾ of the way down.",
        "Repeat for the recommended amount of repetitions."
      ],
      "category": "strength",
      "images": 'assets/images/3_4_Sit-Up.jpg',
      "id": "3_4_Sit-Up",
      "url": "https://youtu.be/wm47Swzn_98?si=ln3TObfQPpIGMG4b"
    },
    {
      "name": "90/90 Hamstring",
      "force": "push",
      "level": "beginner",
      "idvideo": "h_yZV27H684",
      "mechanic": null,
      "equipment": "body only",
      "primaryMuscles": ["hamstrings"],
      "secondaryMuscles": ["calves"],
      "instructions": [
        "Lie on your back, with one leg extended straight out.",
        "With the other leg, bend the hip and knee to 90 degrees. You may brace your leg with your hands if necessary. This will be your starting position.",
        "Extend your leg straight into the air, pausing briefly at the top. Return the leg to the starting position.",
        "Repeat for 10-20 repetitions, and then switch to the other leg."
      ],
      "category": "stretching",
      "images": 'assets/images/90_90_Hamstring.jpg',
      "id": "90_90_Hamstring",
      "url": "https://youtu.be/h_yZV27H684?si=VxYByLVTZkQPIYbt"
    },
    {
      "name": "Ab Crunch Machine",
      "force": "pull",
      "level": "intermediate",
      "idvideo": "V7p_DmkYLZw",
      "mechanic": "isolation",
      "equipment": "machine",
      "primaryMuscles": ["abdominals"],
      "secondaryMuscles": [],
      "instructions": [
        "Select a light resistance and sit down on the ab machine placing your feet under the pads provided and grabbing the top handles. Your arms should be bent at a 90 degree angle as you rest the triceps on the pads provided. This will be your starting position.",
        "At the same time, begin to lift the legs up as you crunch your upper torso. Breathe out as you perform this movement. Tip: Be sure to use a slow and controlled motion. Concentrate on using your abs to move the weight while relaxing your legs and feet.",
        "After a second pause, slowly return to the starting position as you breathe in.",
        "Repeat the movement for the prescribed amount of repetitions."
      ],
      "category": "strength",
      "images": 'assets/images/Ab_Crunch_Machine.jpg',
      "id": "Ab_Crunch_Machine",
      "url": "https://youtu.be/V7p_DmkYLZw?si=et_GS6VG-gV6ei-a"
    },
    {
      "name": "Ab Roller",
      "force": "pull",
      "level": "intermediate",
      "mechanic": "compound",
      "equipment": "other",
      "primaryMuscles": ["abdominals"],
      "secondaryMuscles": ["shoulders"],
      "instructions": [
        "Hold the Ab Roller with both hands and kneel on the floor.",
        "Now place the ab roller on the floor in front of you so that you are on all your hands and knees (as in a kneeling push up position). This will be your starting position.",
        "Slowly roll the ab roller straight forward, stretching your body into a straight position. Tip: Go down as far as you can without touching the floor with your body. Breathe in during this portion of the movement.",
        "After a pause at the stretched position, start pulling yourself back to the starting position as you breathe out. Tip: Go slowly and keep your abs tight at all times."
      ],
      "category": "strength",
      "images": "assets/images/Ab_Roller.jpg", 
      "id": "Ab_Roller",
      "url": "https://youtu.be/zCsW9L2qi-0?si=63Cvyn84k4KFVcwv"
    },
    {
      "name": "Adductor",
      "force": "static",
      "level": "intermediate",
      "mechanic": "isolation",
      "equipment": "foam roll",
      "primaryMuscles": ["adductors"],
      "secondaryMuscles": [],
      "instructions": [
        "Lie face down with one leg on a foam roll.",
        "Rotate the leg so that the foam roll contacts against your inner thigh. Shift as much weight onto the foam roll as can be tolerated.",
        "While trying to relax the muscles if the inner thigh, roll over the foam between your hip and knee, holding points of tension for 10-30 seconds. Repeat with the other leg."
      ],
      "category": "stretching",
      "images": "assets/images/Adductor.jpg",
      "id": "Adductor",
      "url": "https://youtu.be/Nqol0T6rKDg?si=7jn-TnYh26gQayFX"
    },
    {
      "name": "Adductor/Groin",
      "force": "static",
      "level": "intermediate",
      "mechanic": null,
      "equipment": null,
      "primaryMuscles": ["adductors"],
      "secondaryMuscles": [],
      "instructions": [
        "Lie on your back with your feet raised towards the ceiling.",
        "Have your partner hold your feet or ankles. Abduct your legs as far as you can. This will be your starting position.",
        "Attempt to squeeze your legs together for 10 or more seconds, while your partner prevents you from doing so.",
        "Now, relax the muscles in your legs as your partner pushes your feet apart, stretching as far as is comfortable for you. Be sure to let your partner know when the stretch is adequate to prevent overstretching or injury."
      ],
      "category": "stretching",
      "images": "assets/images/Adductor_Groin.jpg",
      "id": "Adductor_Groin",
      "url": "https://youtu.be/Ce_ARjJ5mOQ?si=7ZEWgzzegPQJn8Je"
    },
    {
      "name": "Advanced Kettlebell Windmill",
      "force": "push",
      "level": "intermediate",
      "mechanic": "isolation",
      "equipment": "kettlebells",
      "primaryMuscles": ["abdominals"],
      "secondaryMuscles": ["glutes", "hamstrings", "shoulders"],
      "instructions": [
        "Clean and press a kettlebell overhead with one arm.",
        "Keeping the kettlebell locked out at all times, push your butt out in the direction of the locked out kettlebell. Keep the non-working arm behind your back and turn your feet out at a forty-five degree angle from the arm with the kettlebell.",
        "Lower yourself as far as possible.",
        "Pause for a second and reverse the motion back to the starting position."
      ],
      "category": "strength",
      "images": "assets/images/Advanced_Kettlebell_Windmill.jpg",
      "id": "Advanced_Kettlebell_Windmill",
      "url": "https://youtu.be/H8fmeaq8ewI?si=bkgzYCVCAxN3p6BV"
    },
    {
      "name": "Air Bike",
      "force": "pull",
      "level": "beginner",
      "mechanic": "compound",
      "equipment": "body only",
      "primaryMuscles": ["abdominals"],
      "secondaryMuscles": [],
      "instructions": [
        "Lie flat on the floor with your lower back pressed to the ground. For this exercise, you will need to put your hands beside your head. Be careful however to not strain with the neck as you perform it. Now lift your shoulders into the crunch position.",
        "Bring knees up to where they are perpendicular to the floor, with your lower legs parallel to the floor. This will be your starting position.",
        "Now simultaneously, slowly go through a cycle pedal motion kicking forward with the right leg and bringing in the knee of the left leg. Bring your right elbow close to your left knee by crunching to the side, as you breathe out.",
        "Go back to the initial position as you breathe in.",
        "Crunch to the opposite side as you cycle your legs and bring closer your left elbow to your right knee and exhale.",
        "Continue alternating in this manner until all of the recommended repetitions for each side have been completed."
      ],
      "category": "strength",
      "images": "assets/images/Air_Bike.jpg",
      "id": "Air_Bike",
      "url": "https://youtu.be/i6mPCVUrtNk?si=-27gf5WkeXHy7sGv"
    },
    {
      "name": "All Fours Quad Stretch",
      "force": "static",
      "level": "intermediate",
      "mechanic": null,
      "equipment": "body only",
      "primaryMuscles": ["quadriceps"],
      "secondaryMuscles": ["quadriceps"],
      "instructions": [
        "Start off on your hands and knees, then lift your leg off the floor and hold the foot with your hand.",
        "Use your hand to hold the foot or ankle, keeping the knee fully flexed, stretching the quadriceps and hip flexors.",
        "Focus on extending your hips, thrusting them towards the floor. Hold for 10-20 seconds and then switch sides."
      ],
      "category": "stretching",
      "images": "assets/images/All_Fours_Quad_Stretch.jpg",
      "id": "All_Fours_Quad_Stretch",
      "url": "https://youtu.be/xdFKT1R2Ot0?si=cPdyZ7Hts40uH-bj"
    },
  ].obs;
}
