import 'package:flutter/material.dart';
import 'package:flutter_task_2/models/contactModel.dart';
import 'package:flutter_task_2/screens/contact/contactScreen.dart';
import 'package:provider/src/provider.dart';


typedef FavoritChangedCallback = Function(bool isFavorit, Contact contact);

class ContactListItem extends StatelessWidget {
  ContactListItem(
      {Key? key,
        required this.contact,
        required this.isFavorited,
        required this.onFavoritChanged})
      : super(key: key);

  Contact contact;
  final bool isFavorited;
  final FavoritChangedCallback onFavoritChanged;

  Color _getColor(BuildContext context) {
    return isFavorited ? Colors.blue : Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        Navigator.pushNamed(context, ContactScreen.routeName,
            arguments: contact) as Contact;
        // if(result != null){
        //   contact = result;
        // }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  onFavoritChanged(isFavorited, contact);
                },
                icon: Icon(
                  Icons.star,
                  color: _getColor(context),
                )),
            CircleAvatar(
              foregroundImage: contact.avatarPhoto,
              backgroundColor: Colors.cyanAccent,
              radius: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.firstName + " " + contact.lastName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    contact.company,
                    style: TextStyle(
                      color: Colors.black38,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
