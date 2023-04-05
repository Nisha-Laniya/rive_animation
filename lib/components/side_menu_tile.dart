import 'package:rive/rive.dart';
import '../models/models.dart';
import 'components.dart';
import '../Resources/resources.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key, required this.menu, required this.press, required this.riveOnInit, required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveOnInit;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: ColorManager.white24,
            height: 1.h,
          ),
        ),
        Stack(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.fastOutSlowIn,
              height: 48.h,
              width:isActive ? 288.w : 0.w,
              decoration: BoxDecoration(
                color: ColorManager.blue,
                borderRadius: BorderRadius.circular(10).w
              ),
            ),
            ListTile(
              onTap: press,
              leading: SizedBox(
                  height: 34.h,
                  width: 34.w,
                  child: RiveAnimation.asset(
                    menu.src,
                    artboard: menu.artboard,
                    onInit: riveOnInit,
                  )),
              title: Text(
                menu.title,
                style: TextStyle(color: ColorManager.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
