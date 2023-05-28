import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ws2/widgets/text_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _cityTextController = TextEditingController();
  final _streetTextController = TextEditingController();
  final _numberTextController = TextEditingController();
  final _phoneTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 55),
            child: Column(
              children: [
                // EMAIL Filed
                TextForm(
                  textEditingController: _emailTextController,
                  textInputType: TextInputType.emailAddress,
                  hintText: "Masukan Email",
                  labelText: "Email",
                  anotherValidation: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(
                        errorText: "Silakan masukan email yang benar"),
                  ],
                ),

                // Password Filed
                TextForm(
                  textEditingController: _passwordTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Password",
                  labelText: "Password",
                  anotherValidation: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: "Minimal 6 Karakter",
                    ),
                  ],
                ),

                // Username Filed
                TextForm(
                  textEditingController: _usernameTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Username",
                  labelText: "Username",
                  anotherValidation: [
                    FormBuilderValidators.required(),
                    FormBuilderValidators.minLength(
                      6,
                      errorText: "Minimal 6 Karakter",
                    ),
                  ],
                ),

                // First Name Filed
                TextForm(
                  textEditingController: _firstNameTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Nama Depan",
                  labelText: "Nama Depan",
                ),

                // last Name Filed
                TextForm(
                  textEditingController: _lastNameTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Nama Belakang",
                  labelText: "Nama Belakang",
                ),

                // City Filed
                TextForm(
                  textEditingController: _cityTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Kota Tinggal",
                  labelText: "Kota",
                ),

                // Street Filed
                TextForm(
                  textEditingController: _streetTextController,
                  textInputType: TextInputType.text,
                  hintText: "Masukan Nama Jalan",
                  labelText: "Jalan",
                ),

                // Number Filed

                TextForm(
                  textEditingController: _numberTextController,
                  textInputType: TextInputType.number,
                  hintText: "Masukan No Rumah",
                  labelText: "No Rumah",
                ),

                // Phone Number Filed
                TextForm(
                    textEditingController: _phoneTextController,
                    textInputType: TextInputType.phone,
                    hintText: "Masukan No Hp",
                    labelText: "No Hp",
                    anotherValidation: [
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(8,
                          errorText: "Isi nomor yang valid (min 8)"),
                    ]),

                ElevatedButton.icon(
                  onPressed: () => {
                    // if (_formKey.currentState!.validate())
                    Navigator.pushNamed(context, "/homePage")
                  },
                  icon: const Icon(Icons.send),
                  label: const Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
