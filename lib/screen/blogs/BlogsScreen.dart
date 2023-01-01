import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:winners/api/BlogApi.dart';
import 'package:winners/schema/BlogsSchema.dart';
import 'package:winners/screen/blogs/BlogDetailsScreen.dart';
import 'package:winners/shared/AppDrawer.dart';
import 'package:winners/shared/loader.dart';

class BlogsScreen extends StatefulWidget {
  BlogsScreen({Key? key}) : super(key: key);

  @override
  _BlogsScreenState createState() => _BlogsScreenState();
}

class _BlogsScreenState extends State<BlogsScreen> {
  late BlogsSchema blogs;
  late List img;
  bool loadingBlog = false;

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: const Drawer(
          child: AppDrawer(),
        ),
        body: loadingBlog == false
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Loader(),
                  const Text('Loading please wait...'),
                ],
              ))
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
                        onPressed: () {},
                      ),
                    ],
                    flexibleSpace: FlexibleSpaceBar(
                      title: const Text('Blog Post', textScaleFactor: 1),
                      background: Image.asset(
                        'assets/images/blog.png',
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
                        children: loadingBlog == false
                            ? []
                            : blogs.data!
                                .map((blg) => Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        children: <Widget>[
                                          InkWell(
                                            child: Column(
                                              children: [
                                                // ignore: unnecessary_null_comparison
                                                blg.image != null
                                                    ? Hero(
                                                        tag:
                                                            'blogBanner${blg.id}',
                                                        child: Image(
                                                          image: NetworkImage(
                                                              blg.image
                                                                  .toString()),
                                                          width: width * 0.9,
                                                          height: width * 0.31,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      )
                                                    : Container(),

                                                Row(
                                                  children: [
                                                    Text(
                                                      blg.title.toString(),
                                                      style: const TextStyle(
                                                        fontSize: 14.0,
                                                      ),
                                                      maxLines: 3,
                                                      softWrap: true,
                                                      overflow:
                                                          TextOverflow.fade,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            onTap: () {
                                              Get.to(
                                                BlogDetailsScreen(
                                                  img: blg.image.toString(),
                                                  id: blg.id!.toInt(),
                                                  date:
                                                      blg.createdAt.toString(),
                                                  title: blg.title.toString(),
                                                  doc: blg.content.toString(),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList()),
                  ),
                ],
              ));
  }

  Future fetchData() async {
    try {
      var tsyList = await BlogApi().getBlog();
      setState(() {
        blogs = tsyList; //
        loadingBlog = true;
      });
    } on Exception catch (err) {
      print(err);
    }
  }
}
