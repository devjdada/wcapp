import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/schema/HomecellsSchema.dart';

class HomecellSearch extends SearchDelegate {
  late HomecellsSchema homecell;

  HomecellSearch(HomecellsSchema searchData) {
    homecell = searchData;
  }
  void call(String number) => launch("tel:$number");
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {}, icon: const Icon(Icons.clear_rounded))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.clear_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final soulSuggestions = homecell;
    // final soulSuggestions = query.isEmpty
    //     ? myContacts
    //     : myContacts.data!.where((p) => p.firstname!.startsWith(query));
    return ListView.builder(
        itemCount: soulSuggestions.data!.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: ValueKey(index),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  backgroundColor: Color(0xFFFE4A49),
                  foregroundColor: Colors.white,
                  icon: Icons.edit,
                  label: 'Report',
                  onPressed: (BuildContext context) {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (BuildContext context) => SoulViewScreen(
                    //           id: "${soulSuggestions.data![index].id}",
                    //           name:
                    //               "${soulSuggestions.data![index].surname} ${soulSuggestions.data![index].firstname}",
                    //           user: widget.user,
                    //         )));
                  },
                ),
                SlidableAction(
                  backgroundColor: Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.call,
                  label: 'Call',
                  onPressed: (BuildContext context) {
                    call("${soulSuggestions.data![index].phone}");
                  },
                ),
              ],
            ),
            child: InkWell(
              child: ListTile(
                  title: Text(
                    "${soulSuggestions.data![index].address}",
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  subtitle: Text(
                      "${soulSuggestions.data![index].title} ${soulSuggestions.data![index].phone}")),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (BuildContext context) => SoulViewScreen(
                //         myContactId: soulSuggestions.data![index].id!.toInt()),
                //     settings: const RouteSettings(
                //         name: 'Soul Wininng View', arguments: [])));
              },
            ),
          );
        });
  }
}
