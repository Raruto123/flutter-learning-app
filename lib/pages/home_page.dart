import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:flutter_projects/pages/event_page.dart";

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //ou Image.asset("assets/images/(nom de l'image)") pour ce qui est non svg
          SvgPicture.asset("assets/images/5G2hpI4rAa0k6jx0DaAjnr-KwBqdCM-jq64SjgRM5o8.svg",
            color: Colors.pink,
          ),
          const Text("Asynconf 2022",
            style: TextStyle(
                fontSize: 21*2,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontFamily: "Poppins"
            ),
          ),
          const Text("Salon virtuel de l'informatique du 27 au 29 Octobre 2022",
            style : TextStyle(
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          //ElevatedButton.icon(
          //  style: ButtonStyle(
            //  backgroundColor: MaterialStatePropertyAll(Colors.pink),
              //padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
           // ),
            //onPressed: () {
            //  Navigator.push(
            //     context,
            //      PageRouteBuilder(
            //          pageBuilder: (_, __, ___) => EventPage()
            //      )
           //   );
           // },
          //  label: Text("Afficher le planning",
          //    style: TextStyle(
          //      fontSize: 20,
          //    ),
         //   ),
          //  icon: Icon(Icons.calendar_today),
          //)
        ],
      ),
    );
  }
}
