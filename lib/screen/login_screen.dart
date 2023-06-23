import 'package:day3_exemple/blocs/login_bloc/login_bloc.dart';
import 'package:day3_exemple/blocs/login_bloc/login_event.dart';
import 'package:day3_exemple/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/login_bloc/login_satetes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //var
  GlobalKey<FormState> formKey = GlobalKey();
  var user = User();

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginBlocState>(
      builder: (context, state) {
        if (state is LoginBlocInitState) {
          return ListView(
            children: [
              const SizedBox(height: 150),
              const SizedBox(height: 60),
              Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Text(
                          "Welcome",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Login to your account",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (newValue) => user.email = newValue!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Email should not be empty!";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Username",
                                prefixIcon: const Icon(Icons.person_outline),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                        const SizedBox(height: 20),
                        TextFormField(
                            onSaved: (newValue) => user.password = newValue!,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Password should not be empty!";
                              }
                            },
                            decoration: InputDecoration(
                                labelText: "Password",
                                prefixIcon: const Icon(Icons.password),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () async {
                              //context.read<LoginBloc>().add(LoginButtonPressedEvent());
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                //await UserService().loginFunction(user).then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Current User : ${value.email}"))));
                                context.read<LoginBloc>().add(
                                    LoginButtonPressedEvent(user, context));
                              }
                            },
                            child: const Text("Connexion"))
                      ],
                    ),
                  ))
            ],
          );
        }
        if (state is LoginBlocLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is LoginBlocErrorState) {
          return const Center(
            child: Text("No available data"),
          );
        }
        return Container();
      },
    ));
  }
}
