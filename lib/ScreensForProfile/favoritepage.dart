import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 70,),
        Center(
          child: Lottie.asset('assets/animation/Animation - 1710667899676.json',
              height: 200,reverse: true,repeat: true,fit: BoxFit.cover),
        ),
        SizedBox(height: 10,),
        Text("There are no Favorite Products !")
      ],
    );
  }
}