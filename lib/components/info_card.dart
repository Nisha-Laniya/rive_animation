import 'package:flutter/cupertino.dart';
import 'components.dart';
import '../Resources/resources.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key, required this.name, required this.profession,
  });

  final String name;
  final String profession;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorManager.white24,
        child: Icon(
          CupertinoIcons.person,
          color: ColorManager.white,
        ),
      ),
      title: Text(name,style: TextStyle(color: ColorManager.white),),
      subtitle: Text(profession,style: TextStyle(color: ColorManager.white),),
    );
  }
}
