import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/BlogApi.dart';
import 'package:winners/schema/BlogsSchema.dart';
import 'package:winners/screen/blogs/BlogDetailsScreen.dart';
import 'package:winners/screen/blogs/BlogsScreen.dart';

class BlogDash extends StatefulWidget {
  const BlogDash({super.key});

  @override
  State<BlogDash> createState() => _BlogDashState();
}

class _BlogDashState extends State<BlogDash> {
  late BlogsSchema blogs;
  bool loadGallery = false;

  @override
  void initState() {
    super.initState();
    getBlogs();
  }

  Future getBlogs() async {
    try {
      var gallist = await BlogApi().getBlog();
      setState(() {
        blogs = gallist; //
        loadGallery = true;
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
                child: Text("Blogs", style: TextStyle(fontSize: 16.0))),
            Expanded(
                child: InkWell(
              child: const Text(
                "View All",
                style: TextStyle(color: Color(0XFF2BD093)),
                textAlign: TextAlign.end,
              ),
              onTap: () {
                Get.to(BlogsScreen());
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
                    children: blogs.data!.map((e) {
                  return InkWell(
                    onTap: () {
                      Get.to(
                        BlogDetailsScreen(
                          img: e.image.toString(),
                          id: e.id!.toInt(),
                          date: e.createdAt.toString(),
                          title: e.title.toString(),
                          doc: e.content.toString(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10.0),
                      width: width * 0.56,
                      height: height * 0.18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: NetworkImage(e.image.toString()),
                            fit: BoxFit.cover),
                      ),
                      child: Hero(
                        tag: 'blogBanner${e.id}',
                        child: Image(
                          image: NetworkImage(e.image.toString()),
                          width: width * 0.56,
                          height: height * 0.18,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ),
        const SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}
