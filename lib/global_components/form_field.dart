import 'package:ziklogistics/global_components/ziklogistics.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class Formfied extends StatelessWidget {
  const Formfied({
    Key? key,
    this.keyboardType = TextInputType.name,
    required this.hintText,
    required this.emailController,
  }) : super(key: key);

  final TextInputType keyboardType;
  final String hintText;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      height: 45,
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: TextFormField(
          controller: emailController,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: GoogleFonts.dmSans(),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
