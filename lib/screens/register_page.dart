import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:ws2/bloc/Auth/auth_bloc.dart';
import 'package:ws2/models/register_model.dart';
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
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _cityTextController.dispose();
    _firstNameTextController.dispose();
    _numberTextController.dispose();
    _phoneTextController.dispose();
    _lastNameTextController.dispose();
    _streetTextController.dispose();
    _usernameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthEror) {
            print("there is eror : ${state.erorText}");
          } else if (state is AuthSuccess) {
            Navigator.pushNamed(context, "/homePage");
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 55, vertical: 55),
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
                        if (_formKey.currentState!.validate())
                          {
                            context.read<AuthBloc>().add(RegisterEvent(
                                    registerModel: RegisterModel(
                                  email: _emailTextController.text,
                                  username: _usernameTextController.text,
                                  password: _passwordTextController.text,
                                  name: Name(
                                      firstname: _firstNameTextController.text,
                                      lastname: _lastNameTextController.text),
                                  address: Address(
                                      city: _cityTextController.text,
                                      street: _streetTextController.text,
                                      number: int.parse(
                                          _numberTextController.text)),
                                  phone: _phoneTextController.text,
                                )))
                          }
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
          );
        },
      ),
    );
  }
}
