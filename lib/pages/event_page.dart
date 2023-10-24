import 'package:flutter/material.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  final conferences = [
  {
    "speaker" : "Damien",
    "date" : "13h à 13h30",
    "subject" : "le code legacy",
    "avatar" : "damien"
  },
  {
  "speaker" : "Lior",
  "date" : "09h à 23h30",
  "subject" : "le code clean",
  "avatar" : "lior"
  },
  {
  "speaker" : "Defend Intelligence",
  "date" : "13 à 16h30",
  "subject" : "le code non expert",
  "avatar" : "defendintelligence"
  }
  ];

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: ListView.builder(
        itemCount: conferences.length ,
        itemBuilder: (context, index) {
          final conference = conferences[index];
          final avatar = conference["avatar"];
          final speaker = conference["speaker"];
          final subject = conference["subject"];


          return Card(
            child: ListTile(
              leading: Image.asset("assets/images/$avatar.jpg"),
              title: Text("$speaker"),
              subtitle: Text("$subject"),
              trailing: Icon(Icons.info_sharp),
            ),
          );
        },
      ),
    );
  }
}
