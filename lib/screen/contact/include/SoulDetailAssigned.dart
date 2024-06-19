import 'package:flutter/material.dart';
import 'package:winners/schema/ContactDetailSchema.dart';

// ignore: must_be_immutable
class SoulDetailAssigned extends StatelessWidget {
  SoulDetailAssigned(this.contacts, {Key? key}) : super(key: key);
  ContactDetailSchema contacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contacts.assigned!.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: ListTile(
            leading: Hero(
              tag: "invitte_hero_${contacts.assigned![index].id}",
              child: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    contacts.assigned![index].assignTo!.name![0]
                        .toString()
                        .toUpperCase(),
                    //"${myContactList[index]['surname'][0].toString().toUpperCase()}${myContactList[index]['firstname'][0].toString().toUpperCase()}",
                    style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  )),
            ),
            title: Text(
              "${contacts.assigned![index].assignTo!.name} ",
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent),
            ),
            subtitle: Text(
              " ${contacts.assigned![index].assignTo!.phone}",
              style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.blueGrey),
            ),
          ),
          onTap: () {},
        );
      },
    );
  }
}
