import 'package:flutter/material.dart';

import '../helpers/size_extensions.dart';
import '../styles/text_styles.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final Widget? filterWidget;

  const BaseHeader({
    super.key,
    required this.title,
    this.searchChange,
    required this.buttonLabel,
    this.buttonPressed,
    this.filterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TextFormField(
          onChanged: searchChange,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(50.0),
            ),
            isDense: true,
            contentPadding: EdgeInsets.zero,
            suffixIcon: Visibility(
              visible: filterWidget == null,
              replacement: filterWidget ?? const SizedBox.shrink(),
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.grey,
                size: context.percentHeight(.02),
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              size: context.percentHeight(.02),
            ),
            label: Text(
              'Buscar',
              style: context.textStyles.textRegular
                  .copyWith(fontSize: 10, color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
