import 'package:flutter/material.dart';
import 'package:flutter_projects/pages/add_event_page.dart';
import 'package:flutter_projects/pages/event_page.dart';
import 'package:flutter_projects/pages/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{

  runApp(const MyApp());
 WidgetsFlutterBinding.ensureInitialized();

 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
 );


}
//StatelessWidget pour créer du contenu statique (image, vidéo, contenu) lorsqu'il
//n'y a rien comme interaction
// StatefulWidget pour créer du contenu dynamique qui va intéragir avec l'utilisateur'

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  int _currentIndex = 0;

  setCurentIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: [
            Text("Accueil"),
            Text("Planning des conférences"),
            Text("Formulaire d'ajout de conférence")
          ] [_currentIndex]
        ),
        body: [
          HomePage(),
          EventPage(),
          AddEventPage()
        ][_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setCurentIndex(index),
          selectedItemColor: Colors.pink,
          type: BottomNavigationBarType.fixed,
          iconSize: 21*3,
          elevation: 21 * 2,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.safety_check_rounded),
                label: "Sécurité"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sailing_rounded),
              label: "Pirate",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
              label: "Ajouter"
            )
          ],
        ),
      ),
    );
  }
}





