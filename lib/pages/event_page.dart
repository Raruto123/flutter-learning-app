import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: StreamBuilder(
        //nous renvoie tous les documents de notre collection Events
        stream: FirebaseFirestore.instance.collection("Events").snapshots(),
        //builder nous permet de construire ce qui a été amené de la base de de données
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting ) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData) {
            return Text("Aucune conférence trouvée");
          }

          List<dynamic> conferences = [];

          snapshot.data!.docs.forEach((element) {
            conferences.add(element);
          });

          return ListView.builder(
            itemCount: conferences.length ,
            itemBuilder: (context, index) {
              final conference = conferences[index];
              final avatar = conference["avatar"].toString().toLowerCase();
              final speaker = conference["speaker"];
              final subject = conference["subject"];
              final Timestamp timestamp = conference["date"];
              final String date = DateFormat.yMd().add_jm().format(timestamp.toDate());


              return Card(
                child: ListTile(
                  leading: Image.asset("assets/images/$avatar.jpg"),
                  title: Text("$speaker à $date"),
                  subtitle: Text("$subject"),
                  trailing: Icon(Icons.info_sharp),
                ),
              );
            },
          );

        },
      )
    );
  }
}
