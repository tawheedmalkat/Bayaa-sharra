// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:iconly/iconly.dart';
//
// import '../../Constant/color&fonts.dart';
// import '../NavBar/nav-screen.dart';
//
// class StartPageController extends GetxController {
//   var repeatCount = 1.obs;
//
//   void incrementRepeatCount() {
//     repeatCount++;
//
//   }
// }
//
// class Start extends StatelessWidget {
//   final StartPageController controller = Get.put(StartPageController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:
//
//
//             VideoPlayerWidget(), // إضافة ويدجيت لتشغيل الفيديو
//     );
//   }
// }
//
// class VideoPlayerWidget extends StatefulWidget {
//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }
//
// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;
//   late Timer _timer;
//
//   @override
//   void initState() {
//     _controller = VideoPlayerController.asset(
//       'assets/videos/video5785011418008916176.mp4', // استبدل بمسار الفيديو في الـ assets
//     );
//
//     _initializeVideoPlayerFuture = _controller.initialize();
//
//     _timer = Timer.periodic(Duration(seconds: 1), (timer) {
//       if (_controller.value.isPlaying) {
//         _controller.pause();
//       } else {
//         _controller.play();
//       }
//     });
//
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _timer.cancel();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         FutureBuilder(
//           future: _initializeVideoPlayerFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return AspectRatio(
//                 aspectRatio: _controller.value.aspectRatio,
//                 child: VideoPlayer(_controller),
//               );
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//         Positioned(
//           top: 20,
//           right: 20,
//           child: InkWell(
//             onTap: () {
//               Get.to(NavBar());
//             },
//             child:Container(
//               height: 50,
//                 width: 90,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colori.mainblue
//                 ),
//                 child: IconButton(onPressed: (){
//                   Get.to(NavBar());
//                 },icon: Icon(Icons.arrow_forward,color: Colori.White,),))
//           ),
//         ),
//       ],
//     );
//   }
// }
//
//
//
//
// // AnimatedBuilder(
// //   animation: _animation,
// //   builder: (context, child) {
// //     return Transform.translate(
// //       offset: Offset(_animation.value, 0),
// //       child: child,
// //     );
// //   },
// //   child: Container(
// //     width: 250.0,
// //     height: 250.0,
// //     decoration: BoxDecoration(
// //       borderRadius: BorderRadius.circular(15.0),
// //       image: DecorationImage(
// //         image: AssetImage('assets/images/LogoBayaa.png'),
// //         fit: BoxFit.cover,
// //       ),
// //     ),
// //   ),
// // ),
// // AnimatedTextKit(
// //   animatedTexts: [
// //     TypewriterAnimatedText(
// //       'BAYAA SHARRA',
// //       textStyle: TextStyle(
// //         fontFamily: "Anta",
// //         color: Colori.DarkBlue, // تعيين لون النص
// //         fontSize: 27, // تعيين حجم الخط
// //         fontWeight: FontWeight.bold, // جعل الخط bold
// //       ),
// //       speed: Duration(milliseconds: 300),
// //     ),
// //   ],
// //   totalRepeatCount: controller.repeatCount.value,
// //   pause: Duration(milliseconds: 1000),
// //   displayFullTextOnTap: true,
// //   stopPauseOnTap: true,
// // ),
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../Constant/color&fonts.dart';
import '../NavBar/nav-screen.dart';

class StartPageController extends GetxController {
  var repeatCount = 1.obs;

  void incrementRepeatCount() {
    repeatCount++;
  }
}

class Start extends StatelessWidget {
  final StartPageController controller = Get.put(StartPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VideoPlayerWidget(),
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  late Timer _timer;
  bool _videoEnded = false;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/videos/video5796390100636012790.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    // بدء التشغيل بعد تأخير 5 دقائق
    _timer = Timer(Duration(seconds: 8), () {
      if (_controller.value.isPlaying) {
        _controller.pause();
      }
      setState(() {
        _videoEnded = true;
      });
      // انتقل إلى صفحة NavBar بعد توقف الفيديو
      Get.to(NavBar());
    });

    // Mute the audio by setting the volume to 0.0
    _controller.setVolume(0.0);

    // تشغيل الفيديو
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
