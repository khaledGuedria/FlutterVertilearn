import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/inherited_component.dart';
import 'package:myapp/invoice_details_screen.dart';

class InvoiceItem extends StatelessWidget {
  //var
  late String reference;
  late String date;
  late double amount;

  //constructor
  InvoiceItem(
      {required this.reference, required this.date, required this.amount});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, InvoiceDetails.routeName, arguments: reference);
      },
      child: Card(
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const  EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), color: Colors.white),
          child: Column(
            children: [
              //1
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //icon
                  const Padding(
                    padding:  EdgeInsets.only(right: 10.0),
                    child:  Icon(Icons.file_copy),
                  ),
                  //column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reference,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(date)
                    ],
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(thickness: 1,),
              ),
              Row(
                children: [
                  //RadioListTile(value: true, groupValue: groupValue, onChanged: onChanged)
                 const Padding(
                    padding:  EdgeInsets.only(right: 8.0),
                    child:  Icon(Icons.radio_button_on, color: Colors.orange,),
                  ),
                  Text(
                    "$amount TND",
                    style: const TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
