import 'package:flutter/material.dart';

class TestimonyDetailScreen extends StatefulWidget {
  TestimonyDetailScreen(
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
  _TestimonyDetailScreenState createState() => _TestimonyDetailScreenState();
}

class _TestimonyDetailScreenState extends State<TestimonyDetailScreen> {
  @override
  void initState() {
    super.initState();
    // fetchData(widget.blog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              stretch: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.title.toString(), textScaleFactor: 1),
                background: Hero(
                  tag: 'tsyBanner${widget.id}',
                  child: Image.network(
                    widget.img,
                    fit: BoxFit.fill,
                  ),
                ),
                stretchModes: const <StretchMode>[StretchMode.zoomBackground],
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
                            fontSize: 22.0,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Roboto-Regular'),
                      ),
                    ),
                    Text(widget.doc)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
