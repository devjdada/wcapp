import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winners/api/HomecellApi.dart';
import 'package:winners/api/UserApi.dart';
import 'package:winners/schema/HomecellsSchema.dart';
import 'package:winners/schema/LogUserSchema.dart';
import 'package:winners/screen/profile/ProfileScreen.dart';

class HomecellSearch extends SearchDelegate {
  final HomecellsSchema homecell;

  HomecellSearch(this.homecell);

  void call(String number) => launch("tel:$number");

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSuggestionList();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestionList();
  }

  Widget _buildSuggestionList() {
    final suggestions = query.isEmpty
        ? homecell.data!
        : homecell.data!
            .where(
              (p) =>
                  p.title!.toLowerCase().contains(query.toLowerCase()) ||
                  p.phone!.toLowerCase().contains(query.toLowerCase()) ||
                  p.address!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return Slidable(
          key: ValueKey(index),
          startActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Join',
                onPressed: (BuildContext context) {
                  _joinHomecell(suggestion.id);
                },
              ),
              SlidableAction(
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.call,
                label: 'Call',
                onPressed: (BuildContext context) {
                  call(suggestion.phone!);
                },
              ),
            ],
          ),
          child: InkWell(
            child: ListTile(
              title: Text(
                suggestion.address!,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                "${suggestion.title} ${suggestion.phone}",
              ),
            ),
            onTap: () {
              // Uncomment and implement navigation to detail screen
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SoulViewScreen(
              //         myContactId: suggestion.id!.toInt()),
              //     settings: const RouteSettings(
              //         name: 'Soul Winning View', arguments: [])));
            },
          ),
        );
      },
    );
  }

  getUser() async {
    return UserApi().getLogUser();
  }

  void _joinHomecell(id) async {
    LogUserSchema user = await getUser();
    var data = {"homecell_id": id};

    await HomecellApi().joinHomecell(data).then((value) {
      Get.to(ProfileScreen(user));
    });
  }
}
