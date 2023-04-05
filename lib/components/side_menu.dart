import 'package:rive/rive.dart';
import '../Resources/barrel_export.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {

  RiveAsset selectedMenu = sideMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288.w,
        height: double.infinity,
        color: ColorManager.backgroundColor,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const InfoCard(
                name: 'Nisha Patel',
                profession: 'Flutter Developer',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16).r,
                child: Text(
                  'Browse'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.white70),
                ),
              ),
              ...sideMenus.map((menu) => SideMenuTile(
                    menu: menu,
                    press: () {
                      menu.input!.change(true);
                      Future.delayed(const Duration(seconds: 1), () {
                        menu.input!.change(false);
                      });
                      setState(() {
                        selectedMenu = menu;
                      });
                    },
                    riveOnInit: (artboard) {
                      StateMachineController controller = RiveUtils.getRiveController(artboard,stateMachineName: menu.stateMachineName);
                      menu.input = controller.findSMI('active');
                    },
                    isActive: selectedMenu == menu,
                  ),),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16).r,
                child: Text(
                  'History'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: ColorManager.white70),
                ),
              ),
              ...sideMenu2.map((menu) => SideMenuTile(
                menu: menu,
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                riveOnInit: (artboard) {
                  StateMachineController controller = RiveUtils.getRiveController(artboard,stateMachineName: menu.stateMachineName);
                  menu.input = controller.findSMI('active');
                },
                isActive: selectedMenu == menu,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
