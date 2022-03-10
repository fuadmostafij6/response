// ignore: camel_case_types
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Dialog_design extends StatefulWidget {
  const Dialog_design({Key? key}) : super(key: key);

  @override
  _Dialog_designState createState() => _Dialog_designState();
}

class _Dialog_designState extends State<Dialog_design> {

  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
   final List<String> _wallet = ["select wallet","main wallet", "shopping wallet"];

   late  String _selectedWallet = "select wallet";

   late String Value = "";
  File? image;
  Future getImage() async {
    try {
      final image =  await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) {
        return ;
      }
      else{
        // ignore: non_constant_identifier_names
        final ImageTemp = File(image.path);

        setState(() {
          this.image = ImageTemp;
        });
      }
    } on PlatformException
    catch(e){
      print(e.toString());

    }

  }
  postTest() async {
    const uri = 'https://hooks.zapier.com/hooks/catch/6864535/biqeouu/';

    http.Response response = await http.post(
        Uri.parse(uri), body: {
      'id':'1',
      'transition_number':myController1.text,
      'transition_id':myController2.text,
      'image':image.toString(),
      'shopping_wallet': Value.toString(),


    });

    print(response.body);
    print(myController2.text);
    print(myController1.text);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(

      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Column(

        children:   [
          DropdownButton(
            hint:  const Text('Please choose a wallet', ), // Not necessary for Option 1
            value: _selectedWallet,
            onChanged: (newValue) {
              setState(() {
                _selectedWallet = newValue as String;
                if(newValue == "main wallet"){
                  Value = "main";

                }
                else if(newValue == "shopping wallet"){
                  Value = "shopping";
                }
                else{
                  Value = "";
                }
                print(Value);
              });
            },
            items: _wallet.map((location) {
              return DropdownMenuItem(
                child: Text(location),
                value: location,
              );
            }).toList(),
          ),

          TextField(
            controller: myController1,
            decoration: const InputDecoration(
              labelText: "Transition Number",
            ),
          ),
          const SizedBox(
            height: 30,
          ),


          TextField(
            controller: myController2,
            decoration: const InputDecoration(
              labelText: "transition_id",
            ),
          ),

          // if (myController1.text!="") Text(myController1.text) else const Text("image_path"),
          if (image!=null) const Text("picked") else const Text(""),

          TextButton(
            onPressed: () {
              getImage();
            },

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text('Screen Shot'),
                Icon(Icons.burst_mode_sharp)
              ],
            ),

          ),

          TextButton(onPressed: (){
            postTest();
          }, child: const Text("Submit"))




        ],
      ),
    );
  }
}

