import 'package:flutter/material.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/screen/profile/include/DiagonallyCutColoredImage.dart';
import 'package:winners/shared/openDrawer.dart';
import 'package:winners/shared/themes.dart';

class ProfileHeader extends StatelessWidget {
  static const BACKGROUND_IMAGE = 'assets/images/profile_header_background.png';

  const ProfileHeader(
    this.friend,
  );

  final LogUserSchema friend;

  Widget _buildDiagonalImageBackground(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return DiagonallyCutColoredImage(
      Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB8338f4),
    );
  }

  Widget _buildAvatar() {
    var img = '${friend.user!.profilePhotoUrl}';
    return Hero(
      tag: friend.user!.id!.toInt(),
      // child: friend.user!.bm != null
      //     ? CircleAvatar(
      //         radius: 55,
      //         backgroundImage: NetworkImage(img),
      //       )
      child: CircleAvatar(
          backgroundColor: primary,
          radius: 50,
          child: Text(
            friend.user!.name![0].toUpperCase(),
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )),
    );
  }

  Widget _buildFollowerInfo(TextTheme textTheme) {
    var followerStyle =
        textTheme.titleMedium!.copyWith(color: const Color(0xBBFFFFFF));

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(friend.user!.phone.toString(), style: followerStyle),
          Text(friend.user!.email.toString(), style: followerStyle),
        ],
      ),
    );
  }

  Widget _buildActionButtons(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createPillButton(
            'HIRE ME',
            backgroundColor: theme.colorScheme.secondary,
          ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white30),
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: _createPillButton(
              'FOLLOW',
              textColor: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createPillButton(
    String text, {
    Color backgroundColor = Colors.transparent,
    Color textColor = Colors.white70,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: MaterialButton(
        minWidth: 140.0,
        color: backgroundColor,
        textColor: textColor,
        onPressed: () {},
        child: Text(text),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Stack(
      children: <Widget>[
        _buildDiagonalImageBackground(context),
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: <Widget>[
              // AvatarWidget(
              //     friend.data!.avatar!.image.toString(),
              //     index,
              //     friend.data!.surname.toString(),
              //     friend.data!.firstname.toString()),
              _buildAvatar(),
              _buildFollowerInfo(textTheme),
              // _buildActionButtons(theme),
            ],
          ),
        ),
        const Positioned(
          top: 26.0,
          left: 4.0,
          child: OpenDrawer(),
        ),
        Positioned(
          top: 26.0,
          right: 4.0,
          child: PopupMenuButton(
              icon: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text("First"),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text("Second"),
                    )
                  ]),
        ),
      ],
    );
  }

  doNothing() {
    return;
  }
}
