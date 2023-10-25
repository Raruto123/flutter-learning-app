import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';


class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {

  final _formKey = GlobalKey<FormState>();

  final confNameController = TextEditingController();
  final speakerNameController = TextEditingController();

  String selectedConfType = "talk";
  DateTime selectedConfDate = DateTime.now();


  @override
  void dispose() {
    // TODO: implement dispose
    confNameController.dispose();
    speakerNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(//mettre ce TextFormField dans un container et créer un margin juste pour le bas
              decoration: InputDecoration(
                labelText: "Nom de la conférence",
                hintText: "Inscris le nom de la conférence",
                border: OutlineInputBorder()
              ),
              validator: (theValue) {
                if (theValue == null || theValue.isEmpty) {
                  return "Tu dois complèter ce champ";
                }
                return null;
              },
              controller: confNameController,
            ),
            SizedBox(height: 5),
            TextFormField(//mettre ce TextFormField dans un container et créer un margin juste pour le bas
              decoration: InputDecoration(
                  labelText: "Nom du conférencier",
                  hintText: "Inscris le nom du conférencier",
                  border: OutlineInputBorder()
              ),
              validator: (theValue) {
                if (theValue == null || theValue.isEmpty) {
                  return "Tu dois complèter ce champ";
                }
                return null;
              },
              controller: speakerNameController,
            ),
            //ajouter un autre SizedBox pour créer de l'espace le bouton et le formulaire
            SizedBox(height: 5,),
            DropdownButtonFormField(
                items: const [
                  DropdownMenuItem(value : "talk", child: Text("Talk Show")),
                  DropdownMenuItem(value : "demo", child: Text("Demo Code")),
                  DropdownMenuItem(value : "partner", child: Text("Partner"))
                ],
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
                value: selectedConfType,
                onChanged: (value){
                  setState(() {
                    selectedConfType = value!;
                  });
                }
            ),
            DateTimeFormField(
              decoration : const InputDecoration(
                hintStyle: TextStyle(
                    color: Colors.black45
                ),
                errorStyle: TextStyle(
                  color: Colors.redAccent
                ),
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.event_note),
                labelText: "Only time"
              ),
              mode : DateTimeFieldPickerMode.time,
              autovalidateMode : AutovalidateMode.always,
              validator : (e) => (e?.day ?? 0) == 1 ?"Please not the first day" : null,
              onDateSelected = (DateTime value) {
                setState(() {
                  selectedConfDate = value;
                });
              }
            )
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final confName = confNameController.text;
                      final speakerName = speakerNameController.text; //tu viens de créer un lien entre ce que tu écris et ce qui est écrit dans le champ des formulaires

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Envoi en cours..."))
                      );
                      FocusScope.of(context).requestFocus(FocusNode());
                      
                      print("ajout de la conf $confName par le speaker $speakerName");
                      print("le type de la conférence est $selectedConfType");
                      print("date de la conf $selectedConfDate");
                    }
                  },
                  child: Text("Envoyer")),
            )
          ],
        ),
      ),
    );
  }
}

