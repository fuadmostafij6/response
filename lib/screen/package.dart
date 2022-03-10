


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shohojeeto/dialog.dart';
import 'package:shohojeeto/providers/package_provider.dart';

class Package_page extends StatefulWidget {
  const Package_page({Key? key}) : super(key: key);

  @override
  _Package_pageState createState() => _Package_pageState();
}

class _Package_pageState extends State<Package_page> {
  @override
  Widget build(BuildContext context) {
    context.read<getPackages>().fetchdata;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async{},
        child: Center(
          child: Consumer<getPackages>(
            builder: (context, value, child){
              return value.map.isEmpty && !value.error ?

                  const CircularProgressIndicator()
                  : value.error ? Text("something error ${value.errrMessege}"):
                  SingleChildScrollView(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                      itemCount: value.map["data"].length,

                        itemBuilder:(context, index){

                      return
                        CustomCard(map: value.map["data"][index]);
                    }
                    ),
                  );
            }),
          ),
        ),


    );
  }
}


class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.map}) : super(key: key);
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {



    return  Card(
     
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(

            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    const Expanded(
                      child:  Text('Package Name',
                      textAlign: TextAlign.start,),
                    ),

                    Expanded(child: Text('${map["package_name"]}')),
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     const Expanded(child: Text('package Type',
                       textAlign: TextAlign.start,)),
                    Expanded(child: Text('${map["package_type"]}')),
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                     const Expanded(child: Text('amount',
                       textAlign: TextAlign.start,)),
                    Expanded(child: Text('${map["amount"]}')),
                  ],

                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: Text('validity',
                      textAlign: TextAlign.start,)),
                    Expanded(child: Text('${map["validity"]}'))
                  ],

                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: Text('Bonus',
                      textAlign: TextAlign.start,)),
                    Expanded(child: Text('${map["bonus"]}')),
                  ],

                ),
              ),
              const SizedBox(height: 20.0,),
              TextButton(
                child: const Text('buy', style: TextStyle(color: Colors.white),),
                onPressed: () {

                    showAlertDialog(context);

                },
                style: TextButton.styleFrom(backgroundColor: Colors.blue),
              ),
              const SizedBox(height:50.0),












            ],

          ),

        ),

      
    );

  }


}
showAlertDialog(BuildContext context) {
  // Create button

  // Create AlertDialog
  AlertDialog alert =  const AlertDialog(
    title: Text("Simple Alert"),
    content: Dialog_design(),


    // actions: [
    //   Dialog_design(),
    // ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
