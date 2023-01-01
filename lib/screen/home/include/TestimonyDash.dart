import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/TestimonyApi.dart';
import 'package:winners/schema/TestimonySchema.dart';
import 'package:winners/screen/testimony/TestimoniesScreen.dart';
import 'package:winners/screen/testimony/TestimonyDetailScreen.dart';

class TestimonyDash extends StatefulWidget {
  const TestimonyDash({super.key});

  @override
  State<TestimonyDash> createState() => _TestimonyDashState();
}

class _TestimonyDashState extends State<TestimonyDash> {
  late TestimonySchema testimonies;
  bool loadingTsy = false;

  @override
  void initState() {
    super.initState();
    getTestimonies();
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
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
                  Get.to(const TestimoniesScreen());
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
                    children: testimonies.data!.map(
                  (e) {
                    return InkWell(
                      onTap: () {
                        Get.to(
                          TestimonyDetailScreen(
                            img: e.image.toString(),
                            id: e.id!.toInt(),
                            date: e.createdAt.toString(),
                            title: e.title.toString(),
                            doc: context.toString(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(
                          children: [
                            Hero(
                              tag: 'tsyBanner${e.id}',
                              child: Image(
                                image: NetworkImage(e.image.toString()),
                                width: width * 0.4,
                                height: height * 0.12,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              e.name.toString(),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14.0),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList()),
              ),
        const SizedBox(
          height: 15.0,
        ),
      ],
    );
  }
}
