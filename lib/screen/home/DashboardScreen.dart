import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/GalleryApi.dart';
import 'package:winners/api/TestimonyApi.dart';
import 'package:winners/api/YtApi.dart';
import 'package:winners/schema/GallerySchema.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/schema/TestimonySchema.dart';
import 'package:winners/schema/YtSchema.dart';
import 'package:winners/screen/Auth/LoginScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/data/AppStore.dart';
import 'package:winners/shared/data/AppString.dart';
import 'package:youtube_api/youtube_api.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List img;
  bool loading = false;
  bool loadingTsy = false;
  bool loadingGal = false;
  bool loadingYT = false;
  bool loadingYTPre = false;
  late LogUserSchema logUser;
  late String userPhone;
  late TestimonySchema testimonies;
  late GallerySchema galleries;

  bool loadGallery = false;

  bool loadingUserData = false;
  bool isUserLogedIn = false;
  bool logged = false;
  late LogUserSchema userInfo;
  late YtSchema liveYT;
  late YtSchema yT;
  YoutubeAPI youtube = YoutubeAPI(AppString.yTKey, maxResults: 5);
  List<YouTubeVideo> videoResult = [];

  @override
  void initState() {
    super.initState();
    getTestimonies();
    getLiveYT();
    gallery();
    // _intro();
    initUserData();
  }

  initUserData() async {
    var userRef = await AppStore.getUserData();
    try {
      var decodeUser = LogUserSchema.fromJson(json.decode(userRef!));
      setState(() {
        userInfo = decodeUser;
        logged = true;
      });
    } catch (e) {
      print(e);
    }
    if (!logged) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const LoginScreen()));
    }
  }

  Future getLiveYT() async {
    var tsyList = await YtApi().getYT();
    // print(tsyList);
    setState(() {
      yT = tsyList;
      if (yT.pageInfo.totalResults != 0) {
        loadingYT = true;
      }
    });
    if (yT.pageInfo.totalResults == 0) {
      getVideoList();
    }
  }

  Future<void> getVideoList() async {
    var video = await youtube.channel(AppString.yTChannel);

    setState(() {
      videoResult = video;
      loadingYTPre = true;
    });
  }

  Future gallery() async {
    try {
      var gallist = await GalleryApi().getGallery();
      setState(() {
        galleries = gallist; //
        loadGallery = true;
      });
    } on Exception catch (err) {
      print(err);
    }
  }

  Future getTestimonies() async {
    try {
      var tsyList = await TestimonyApi().getTestimony();
      setState(() {
        testimonies = tsyList; //
        loadingTsy = true;
      });
    } on Exception catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppString.dashboardScreen,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: const Drawer(
          child: AppDrawer(),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: Container(
                              height: 100.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: const Color(0xFFFD7384)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    child: const Column(
                                      children: <Widget>[
                                        Icon(
                                          Icons.home,
                                          color: Colors.white,
                                        ),
                                        Text("WSF",
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                    onTap: () {
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (BuildContext context) =>
                                      //             const HomecellScreen(),
                                      //         settings: const RouteSettings(
                                      //             name: 'homecell',
                                      //             arguments: [])));
                                    },
                                  )
                                ],
                              ),
                            ),
                          )),
                          Expanded(
                              child: SizedBox(
                            height: 100.0,
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 2.5, right: 2.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0XFF2BD093),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    Icons.headset,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('Mp3',
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                            onTap: () {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext
                                              //                 context) =>
                                              //             Mp3MsgScreen(),
                                              //         settings:
                                              //             const RouteSettings(
                                              //                 name:
                                              //                     'mp3_message',
                                              //                 arguments: [])));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 2.5, right: 2.5),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: const Color(0XFFFC7B4D),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          InkWell(
                                            child: const Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    Icons.video_label,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                Text('Video',
                                                    style: TextStyle(
                                                        color: Colors.white))
                                              ],
                                            ),
                                            onTap: () {
                                              // Navigator.of(context).push(
                                              //     MaterialPageRoute(
                                              //         builder: (BuildContext
                                              //                 context) =>
                                              //             VideoMessageScreen(),
                                              //         settings:
                                              //             const RouteSettings(
                                              //                 name:
                                              //                     'video_messages',
                                              //                 arguments: [])));
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                            child: SizedBox(
                              height: 100.0,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.5, bottom: 2.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0XFF53CEDB),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              child: const Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Icon(
                                                      Icons.account_balance,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text('Give',
                                                      style: TextStyle(
                                                          color: Colors.white))
                                                ],
                                              ),
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (BuildContext
                                                //                 context) =>
                                                //             const GivingScreen(),
                                                //         settings:
                                                //             const RouteSettings(
                                                //                 name: 'give',
                                                //                 arguments: [])));
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 2.5, top: 2.5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0XFFF1B069),
                                            borderRadius:
                                                BorderRadius.circular(5.0)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            InkWell(
                                              child: const Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Icon(
                                                      Icons.note,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  Text('Blogs',
                                                      style: TextStyle(
                                                          color: Colors.white))
                                                ],
                                              ),
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (BuildContext
                                                //                 context) =>
                                                //             BlogScreen(),
                                                //         settings:
                                                //             const RouteSettings(
                                                //                 name: 'blogs',
                                                //                 arguments: [])));
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: [
                          socialLink(
                              "https://twitter.com/wchapelphc", "twitter.png"),
                          socialLink("https://www.instagram.com/wchapelphc",
                              "instagram.png"),
                          socialLink("https://www.youtube.com/c/DadaJohnsons",
                              "youtube.png"),
                          socialLink(
                              "https://web.facebook.com/Winnerschapelphc",
                              "facebook.png"),
                          socialLink("https://t.me/lfcdline", "telegram.png"),
                          socialLink("http://dev24.winnerschapelphc.org/",
                              "website.png"),
                        ],
                      ),
                      const SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        children: <Widget>[
                          loadingYT
                              ? Expanded(
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height:
                                        MediaQuery.of(context).size.width / 2.1,
                                    child: Column(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context)
                                                .pushNamed('/live');
                                            const RouteSettings(
                                                name: 'canaanland',
                                                arguments: []);
                                            // goLive(yT.items[0].id.videoId);
                                          },
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2.1,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(yT
                                                        .items[0]
                                                        .snippet
                                                        .thumbnails
                                                        .medium
                                                        .url),
                                                    fit: BoxFit.cover)),
                                            child: const Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    FontAwesomeIcons.youtube,
                                                    color: Colors.red,
                                                    size: 60.0,
                                                  ),
                                                  Text(
                                                    "LIVE",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 30.0),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          loadingYTPre
                              ? Expanded(
                                  child: SizedBox(
                                    height: 250.0,
                                    child: Column(
                                      children: <Widget>[
                                        InkWell(
                                          onTap: () {
                                            // Navigator.of(context).push(
                                            //   MaterialPageRoute(
                                            //     builder:
                                            //         (BuildContext context) =>
                                            //             PlayYoutube(
                                            //       videoId: videoResult[0]
                                            //           .id
                                            //           .toString(),
                                            //     ),
                                            //     settings: const RouteSettings(
                                            //         name: 'domi_radio',
                                            //         arguments: []),
                                            //   ),
                                            // );
                                          },
                                          child: Container(
                                            height: 250.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${videoResult[0].thumbnail.small.url}"),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                            child: Text(
                              "Testimonies",
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              child: const Text(
                                "View All",
                                style: TextStyle(color: Color(0XFF2BD093)),
                                textAlign: TextAlign.end,
                              ),
                              onTap: () {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (BuildContext context) =>
                                //         TestimonyScreen(),
                                //     settings: const RouteSettings(
                                //         name: 'testimony', arguments: [])));
                              },
                            ),
                          )
                        ],
                      ),
                      loadingTsy == false
                          ? const Center(
                              child: Text("No Testimonies Found"),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: testimonies.data!.map((e) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: NetworkImage(e.image.toString()),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }).toList()),
                            ),
                      Row(
                        children: <Widget>[
                          const Expanded(
                              child: Text("Gallery",
                                  style: TextStyle(fontSize: 16.0))),
                          Expanded(
                              child: InkWell(
                            child: const Text(
                              "View All",
                              style: TextStyle(color: Color(0XFF2BD093)),
                              textAlign: TextAlign.end,
                            ),
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         const GalleryScreen(),
                              //     settings: const RouteSettings(
                              //         name: 'gallery', arguments: [])));
                            },
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      loadGallery == false
                          ? const Center(
                              child: Text("No Gallery Found"),
                            )
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                  children: galleries.data!.map((e) {
                                return Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    image: DecorationImage(
                                        image: NetworkImage(e.image.toString()),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              }).toList()),
                            ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: SizedBox(
                              height: 120.0,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/radio.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 120.0,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                        height: 100.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: Hero(
                                          tag: 'domi_radio',
                                          child: Image(
                                            image: const AssetImage(
                                                'assets/images/domi.png'),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.31,
                                            fit: BoxFit.cover,
                                          ),
                                        )),
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/radio');
                                      const RouteSettings(
                                          name: 'canaanland', arguments: []);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 120.0,
                              child: Column(
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                      height: 100.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/d_arc.png'),
                                              fit: BoxFit.cover)),
                                    ),
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/canaanland');
                                      const RouteSettings(
                                          name: 'canaanland', arguments: []);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }

  socialLink(url, img) {
    return Expanded(
      child: SizedBox(
        height: 40.0,
        width: 40.0,
        child: Column(
          children: <Widget>[
            InkWell(
              onTap: () {
                _launchURL(url);
                //  Navigator.of(context).pushNamed('/live');
              },
              child: Container(
                height: 40.0,
                width: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image: AssetImage("assets/images/$img"),
                        fit: BoxFit.cover)),
              ),
            )
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _intro() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isUserLogedIn = pref.getBool(AppString.isUserLoggedIn)!;
    if (isUserLogedIn != null) {
      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (BuildContext context) => IntroScreen(),
      //     settings: RouteSettings(name: 'intro', arguments: [])));
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => const DashboardScreen(),
          settings: RouteSettings(name: 'dashboard', arguments: []),
        ),
      );
    }
  }
}
