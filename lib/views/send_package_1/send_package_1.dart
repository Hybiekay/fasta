import 'package:ziklogistics/views/send_package_1/body.dart';
import 'package:ziklogistics/global_components/ziklogistics.dart';

class SendPackage_1 extends StatelessWidget {
  static const String routeName = '/sendPackage1';
  const SendPackage_1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Body(),
    );
  }
}
