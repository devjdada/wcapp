import 'package:flutter/material.dart';
import 'package:winners/api/TestimonyApi.dart';
import 'package:winners/schema/TestimonySchema.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';

class TestimoniesScreen extends StatefulWidget {
  const TestimoniesScreen({super.key});

  @override
  State<TestimoniesScreen> createState() => _TestimoniesScreenState();
}

class _TestimoniesScreenState extends State<TestimoniesScreen> {
  late TestimonySchema testimonies;
  bool loading = false;

  Future getTestimonies() async {
    try {
      var tsyList = await TestimonyApi().getTestimony();
      setState(() {
        testimonies = tsyList; //
        loading = true;
      });
    } on Exception catch (err) {
      print(err);
    }
  }

  @override
  void initState() {
    super.initState();
    getTestimonies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      body: !loading
          ? Center(
              child: Loader(),
            )
          : testimonies == null || testimonies.data == null
              ? const Center(
                  child: Text("No Testimonies"),
                )
              : CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverAppBar(
                      expandedHeight: 250.0,
                      stretch: true,
                      pinned: true,
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () {
                            // showSearch(
                            //   context: context,
                            //   delegate: HomecellSearch(homecells),
                            // );
                          },
                        ),
                      ],
                      flexibleSpace: FlexibleSpaceBar(
                        title: const Text(
                          'Testimonies',
                          textScaler: TextScaler.linear(1),
                        ),
                        background: Image.asset(
                          'assets/images/wsf.png',
                          fit: BoxFit.fill,
                        ),
                        stretchModes: const <StretchMode>[
                          StretchMode.zoomBackground
                        ],
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(8.0),
                      sliver: SliverGrid.count(
                          crossAxisSpacing: 0.0,
                          crossAxisCount: 2,
                          children: loading == false
                              ? []
                              : testimonies.data!
                                  .map((wsf) => Padding(
                                        padding: const EdgeInsets.all(0.0),
                                        child: Card(
                                          child: Center(
                                            child: Column(
                                              children: <Widget>[
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    wsf.title.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            'Roboto-Regular'),
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.map),
                                                            onPressed: () {
                                                              // Navigator.of(context).push(
                                                              //     MaterialPageRoute(
                                                              //         builder: (BuildContext
                                                              //                 context) =>
                                                              //             WsfMapScreen()));
                                                            },
                                                            color: Colors
                                                                .deepOrangeAccent,
                                                          )),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(2.0),
                                                          child: IconButton(
                                                            icon: const Icon(
                                                                Icons.call),
                                                            onPressed: () {
                                                              // call(
                                                              //   wsf.phone
                                                              //       .toString(),
                                                              // );
                                                            },
                                                            color: Colors
                                                                .greenAccent,
                                                          )),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList()),
                    ),
                  ],
                ),
    );
  }
}
