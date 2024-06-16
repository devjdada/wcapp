import 'package:flutter/material.dart';
import 'package:winners/schema/LogUserSchema.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody(this.friend, {super.key});
  final LogUserSchema friend;

  Widget _buildLocationInfo(TextTheme textTheme) {
    return Row(
      children: <Widget>[
        const Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            "${friend.user!.address}",
            style: textTheme.subtitle1!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _createCircleBadge(IconData iconData, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 16.0,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "${friend.user!.name} ",
          style: textTheme.headline5!.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: _buildLocationInfo(textTheme),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            friend.user!.address.toString(),
            style: textTheme.bodyText2!
                .copyWith(color: Colors.white70, fontSize: 16.0),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(top: 16.0),
        //   child: Row(
        //     children: <Widget>[
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(30.0),
        //         child: MaterialButton(
        //           minWidth: 60.0,
        //           color: Colors.redAccent,
        //           textColor: Colors.white,
        //           onPressed: () {},
        //           child: const Text("wsf"),
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 20,
        //       ),
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(30.0),
        //         child: MaterialButton(
        //           minWidth: 60.0,
        //           color: Colors.deepPurpleAccent,
        //           textColor: Colors.white,
        //           onPressed: () {},
        //           child: const Text("add contact"),
        //         ),
        //       ),
        //       const SizedBox(
        //         width: 20,
        //       ),
        //       ClipRRect(
        //         borderRadius: BorderRadius.circular(30.0),
        //         child: MaterialButton(
        //           minWidth: 60.0,
        //           color: Colors.deepPurpleAccent,
        //           textColor: Colors.white,
        //           onPressed: () {},
        //           child: const Text("add contact"),
        //         ),
        //       ),

        //       // _createCircleBadge(Icons.shop, Colors.white12),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
