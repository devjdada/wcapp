import 'package:flutter/material.dart';
import 'package:winners/shared/themes.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key,
      required this.buttonName,
      required this.callback,
      required this.loading})
      : super(key: key);

  final String buttonName;
  final Function callback;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.065,
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: primary,
      ),
      child: TextButton(
        onPressed: () {
          if (!loading) {
            callback();
          }
        },
        child: Text(
          loading ? "waiting ..." : buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
