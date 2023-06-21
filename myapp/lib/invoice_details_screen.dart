import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/main.dart';

class InvoiceDetails extends StatefulWidget {
  //route
  static const String routeName = '/invoiceDetails';

  //final String ref;
  const InvoiceDetails({super.key});

  @override
  State<InvoiceDetails> createState() => _InvoiceDetailsState();
}

class _InvoiceDetailsState extends State<InvoiceDetails> with TickerProviderStateMixin{
    //var
  late AnimationController animationController;
  late Animation animation;

  //states
  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 15 , end: 75).animate(animationController, CurvedAnimation(parent: animationController, curve: Curves.easeIn));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var ref = ModalRoute.of(context)!.settings.arguments as String;
        return  Scaffold(
      appBar: AppBar(),
      body:  InkWell(
        onTap: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LaunchScreen(),), (route) => false),
        child: Center(child: Text('Invoice details : $ref', style: TextStyle(fontSize: animation.value),),)),);
  }
}