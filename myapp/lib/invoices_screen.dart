import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/invoice_item.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  //var
    GlobalKey<FormState> globalKey = GlobalKey();
  String number = '';

  final  widgetList = [
    InvoiceItem(reference: "2305194214", date: "2023-05-01", amount: 44.958),
    InvoiceItem(reference: "2305194214", date: "2023-05-01", amount: 44.958),
    InvoiceItem(reference: "2305194214", date: "2023-05-01", amount: 44.958),
  ];

  //build
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  //1 app bar look alike
                  const Text(
                    "Mes Factures",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  //drop down
                  DropdownButtonFormField(
                    items: const [DropdownMenuItem(child: Text('Numero de telephone'))], onChanged: (value) {
                    print(value);
                  },),
                  //form
                  Form(
                    key: globalKey,
                    child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 8,
                    onSaved: (newValue) {
                      //InheritedComponent.of(context).number = newValue!;
                    },
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'Field should not be empty';
                      }
                       if(value.length < 8 ){
                        return 'Field should be 8 numbers';
                      }
                    },
                  ), ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ElevatedButton.icon(onPressed: () {
                      if(globalKey.currentState!.validate()){
                        globalKey.currentState!.save();                        
                      }
                    }, icon: const  Icon(Icons.check), label:const  Text('Valider')),
                  ),
                  //2 List
                  const Text(
                    "La liste des factures",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  )
                  //select all checkbox
                  ,
                  Row(
                    children: [
                      //1
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      //2
                      const Text("Sélectionner tout"),
                    ],
                  ),
                  // List
                  Container(   
                    height: 300,
                    child: ListView.builder(
                      itemCount: widgetList.length,
                      itemBuilder: (context, index) {
                        return widgetList[index];
                      },
                    ),
                  )
                ],
              ),
            )
        ;
  }
}