// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:winners/schema/ContactDetailSchema.dart';

class SoulDetailReport extends StatelessWidget {
  SoulDetailReport(this.report, {Key? key}) : super(key: key);
  ContactDetailSchema report;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: report.report!
              .map(
                (r) => Column(
                  children: [
                    Text(
                      "${report.soul!.firstname} ${report.soul!.surname}",
                      style: textTheme.titleLarge!
                          .copyWith(color: Colors.redAccent),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 3.0, right: 20, left: 20),
                      child: Text(
                        r.report.toString(),
                        style: textTheme.bodyText2!
                            .copyWith(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    r.prayer != null
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 3.0, right: 20, left: 20),
                            child: Text(
                              r.prayer.toString(),
                              style: textTheme.bodyText2!.copyWith(
                                  color: Colors.black, fontSize: 16.0),
                            ),
                          )
                        : Container(),
                    Padding(
                        padding: const EdgeInsets.only(top: 3.0, bottom: 29.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            // verticalDirection: VerticalDirection.up,
                            children: [
                              //Chip

                              r.baptised != false
                                  ? Chip(
                                      elevation: 20,
                                      padding: const EdgeInsets.all(5),
                                      backgroundColor: Colors.blueAccent[100],
                                      shadowColor: Colors.black,
                                      //CircleAvatar
                                      label: const Text(
                                        "Baptised",
                                        style: TextStyle(fontSize: 12),
                                      ), //Text
                                    )
                                  : const SizedBox(), //
                              r.bornAgain != false
                                  ? Chip(
                                      elevation: 20,
                                      padding: const EdgeInsets.all(5),
                                      backgroundColor: Colors.greenAccent[100],
                                      shadowColor: Colors.black,
                                      //CircleAvatar
                                      label: const Text(
                                        "Born Again",
                                        style: TextStyle(fontSize: 12),
                                      ), //Text
                                    )
                                  : const SizedBox(),

                              ///
                              r.foundationClass != false
                                  ? Chip(
                                      elevation: 20,
                                      padding: const EdgeInsets.all(5),
                                      backgroundColor: Colors.brown[100],
                                      shadowColor: Colors.black,
                                      //CircleAvatar
                                      label: const Text(
                                        "Foundation Class",
                                        style: TextStyle(fontSize: 12),
                                      ), //Text
                                    )
                                  : const SizedBox(),

                              r.homecell != false
                                  ? Chip(
                                      elevation: 20,
                                      padding: const EdgeInsets.all(5),
                                      backgroundColor: Colors.pinkAccent[100],
                                      shadowColor: Colors.black,
                                      //CircleAvatar
                                      label: const Text(
                                        "Joined WSF",
                                        style: TextStyle(fontSize: 12),
                                      ), //Text
                                    )
                                  : const SizedBox(), //

                              r.unit != false
                                  ? Chip(
                                      elevation: 20,
                                      padding: const EdgeInsets.all(5),
                                      backgroundColor:
                                          Colors.deepPurpleAccent[100],
                                      shadowColor: Colors.black,
                                      //CircleAvatar
                                      label: const Text(
                                        "Joined Unit",
                                        style: TextStyle(fontSize: 12),
                                      ), //Text
                                    )
                                  : const SizedBox(), //C
                            ],
                          ),
                        )),
                    // Text(
                    //   r.report.toString(),
                    //   style:
                    //       textTheme.bodyText2!.copyWith(color: Colors.white),
                    // )
                  ],
                ),
              )
              .toList()
          // children: [
          //   Text(
          //     "${report.data![index].soul!.surname.toString()} ${report.data![index].soul!.firstname.toString()} ",
          //     style: textTheme.headline6!.copyWith(color: Colors.white),
          //   ),
          //   const SizedBox(
          //     height: 9,
          //   ),
          //   Text(
          //     report.data![index].report.toString(),
          //     style: textTheme.bodyText2!.copyWith(color: Colors.white),
          //   )

          // ],
          ),
    );

    // GridView.count(
    //     crossAxisCount: 1,
    //     children: friend.data!.report!
    //         .map((report) => Padding(
    //               padding: const EdgeInsets.all(0.0),
    //               child: Container(
    //                 child: Column(
    //                   children: [
    //                     Row(
    //                       children: [
    //                         Padding(
    //                           padding: const EdgeInsets.only(top: 16.0),
    //                           child: Text(
    //                             report.report.toString(),
    //                             style: textTheme.bodyText2!.copyWith(
    //                                 color: Colors.white70, fontSize: 16.0),
    //                           ),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ))
    //         .toList());
  }
}
