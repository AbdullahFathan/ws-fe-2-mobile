import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class TextForm extends StatefulWidget {
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String hintText;
  final String labelText;
  final List<String? Function(String?)>? anotherValidation;

  const TextForm({
    Key? key,
    required this.textEditingController,
    required this.textInputType,
    required this.hintText,
    required this.labelText,
    this.anotherValidation,
  }) : super(key: key);

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: widget.textEditingController,
        validator: FormBuilderValidators.compose(widget.anotherValidation ??
            [
              FormBuilderValidators.required(),
            ]),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          hintText: widget.hintText,
          labelText: widget.labelText,
          constraints: const BoxConstraints(maxWidth: 230, minWidth: 170),
        ),
      ),
    );
  }
}
