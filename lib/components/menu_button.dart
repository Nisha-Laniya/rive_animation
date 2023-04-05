import 'package:rive/rive.dart';
import '../Resources/barrel_export.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.press,
    required this.riveOnInit,
  });

  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: const EdgeInsets.only(left: 16).r,
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                    color: ColorManager.black12, blurRadius: 5, offset: Offset(0, 3))
              ]),
          child: RiveAnimation.asset(
            'assets/RiveAssets/menu_button.riv',
            onInit: riveOnInit,
          ),
        ),
      ),
    );
  }
}
