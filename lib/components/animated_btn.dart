import '../Resources/barrel_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
    required RiveAnimationController btnAnimationController, required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 57.h,
        width: 260.w,
        child: Stack(
            children:[
              RiveAnimation.asset(
                'assets/RiveAssets/button.riv',
                controllers: [_btnAnimationController],
              ),
              Positioned.fill(
                top: 8.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(width: 8,),
                    Text('Start the Course',style: TextStyle(fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}