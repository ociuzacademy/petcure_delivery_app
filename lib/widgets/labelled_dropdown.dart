import 'package:flutter/material.dart';

class LabelledDropdown<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final String labelText;
  final String hintText;
  final Widget? prefixIcon;
  final String? Function(T?)? validator;
  final void Function(T?)? onChanged;
  final String Function(T) itemLabelBuilder;

  const LabelledDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.labelText,
    required this.hintText,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    required this.itemLabelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(labelText, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        DropdownButtonFormField<T>(
          initialValue: value,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: prefixIcon,
            border: const OutlineInputBorder(),
          ),
          items: items.map((T item) {
            return DropdownMenuItem<T>(
              value: item,
              child: Text(itemLabelBuilder(item)),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ],
    );
  }
}
