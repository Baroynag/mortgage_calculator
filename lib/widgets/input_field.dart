import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String? value;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;

  const InputField({
    super.key,
    this.value,
    this.labelText,
    this.hintText,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
  });

  @override
  State<InputField> createState() => _InputBoxState();
}

class _InputBoxState extends State<InputField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(widget.labelText!, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: _controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: widget.hintText,
          ),
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
