import 'package:flutter/material.dart';
import 'package:imageifyai/core/theme/app_styles.dart';
import '../../../../core/constants/color_constants.dart';

class TattooPromptInput extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback? onSurpriseMe;
  final Function(String)? onSubmitted;

  const TattooPromptInput({
    super.key,
    required this.controller,
    this.onSurpriseMe,
    this.onSubmitted,
  });

  @override
  _TattooPromptInputState createState() => _TattooPromptInputState();
}

class _TattooPromptInputState extends State<TattooPromptInput> {
  bool _hasText = false;
  final FocusNode _focusNode = FocusNode();
  static const int _maxLength = 400;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_updateHasText);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: _focusNode.hasFocus ? AppColors.primary : AppColors.outline.withOpacity(0.1),
        ),
        color: AppColors.surface,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 16),
            child: Align(
              alignment: Alignment.topRight,
              child: Text(
                '${widget.controller.text.length}/$_maxLength',
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          TextField(
            controller: widget.controller,
            focusNode: _focusNode,
            maxLines: 6,
            minLines: 5,
            maxLength: _maxLength,
            style: const TextStyle(color: AppColors.textPrimary),
            decoration: AppStyles.inputDecoration.copyWith(
              hintText: 'Dövme fikrinizi anlatın',
              hintStyle: const TextStyle(color: AppColors.textSecondary),
              counterText: '',
              contentPadding: const EdgeInsets.all(16),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.transparent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (!_hasText)
                  IconButton(
                    icon: const Icon(Icons.smart_toy_outlined),
                    style: AppStyles.iconButtonStyle,
                    onPressed: widget.onSurpriseMe,
                  ),
                if (_hasText)
                  IconButton(
                    icon: const Icon(Icons.close),
                    style: AppStyles.iconButtonStyle.copyWith(
                      foregroundColor: WidgetStateProperty.all(AppColors.textSecondary),
                    ),
                    onPressed: _clearText,
                  ),
                IconButton(
                  icon: const Icon(Icons.send),
                  style: AppStyles.iconButtonStyle,
                  onPressed: () => widget.onSubmitted?.call(widget.controller.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _updateHasText() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  void _onFocusChange() {
    setState(() {
      _hasText = widget.controller.text.isNotEmpty;
    });
  }

  void _clearText() {
    widget.controller.clear();
    setState(() {
      _hasText = false;
    });
  }
}