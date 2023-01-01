import 'package:flutter/material.dart';

class BlogDetailsScreen extends StatefulWidget {
  BlogDetailsScreen(
      {Key? key,
      // required this.by,
      required this.img,
      required this.id,
      required this.date,
      required this.title,
      required this.doc})
      : super(key: key);

  // final String by;
  final String doc;
  final int id;
  final String img;
  final String date;
  final String title;

  @override
  _BlogDetailsScreenState createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // fetchData(widget.blog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 250.0,
                  stretch: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Text(widget.title.toString(), textScaleFactor: 1),
                    centerTitle: true,
                    titlePadding: const EdgeInsets.only(bottom: 10.0),
                    collapseMode: CollapseMode.parallax,
                    // title: Text(widget.title),
                    background: Hero(
                      tag: 'blogBanner${widget.id}',
                      child: Image.network(
                        widget.img,
                        fit: BoxFit.fill,
                      ),
                    ),
                    stretchModes: const <StretchMode>[
                      StretchMode.zoomBackground
                    ],
                  ),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto-Regular'),
                          ),
                        ),
                        Text(widget.doc),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
