import 'package:flutter/material.dart';
import 'package:imageifyai/product/tokens/colors.dart';

class BaseContainer extends StatefulWidget {
  final Widget child;
  final Color? color;
  final double? height;
  final double? width;
  final double borderRadius;
  final double borderWidth;
  final double opacity;
  final VoidCallback? onTap;
  final bool isTransparent;

  const BaseContainer({
    super.key,
    required this.child,
    this.color = AppColors.primary,
    this.height,
    this.width,
    this.borderRadius = 20,
    this.borderWidth = 1.0,
    this.opacity = 0.8,
    this.onTap,
    this.isTransparent = false,
  });

  @override
  State<BaseContainer> createState() => _BaseContainerState();
}

class _BaseContainerState extends State<BaseContainer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _darkenToBlack(Color color) {
    return Color.alphaBlend(Colors.black.withOpacity(widget.opacity), color.withOpacity(widget.opacity));
  }

  @override
  Widget build(BuildContext context) {
    final glowColor = _isPressed ? widget.color!.withOpacity(0.9) : (widget.color ?? AppColors.primary).withOpacity(0.3);
    final borderColor = _isPressed ? widget.color! : (widget.color ?? AppColors.primary).withOpacity(0.3);

    final backgroundColor = widget.isTransparent
        ? Colors.transparent // Daha önceki opaklık değeri yerine tamamen şeffaf
        : _darkenToBlack(widget.color!).withOpacity(widget.opacity);
    final BoxDecoration containerDecoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      border: Border.all(
        color: borderColor,
        width: widget.borderWidth,
      ),
      boxShadow: !widget.isTransparent
          ? [
              BoxShadow(
                color: glowColor,
                blurRadius: _isPressed ? 16.0 : 1.0,
                spreadRadius: _isPressed ? 3.0 : 1.5,
              ),
            ]
          : [],
    );

    if (widget.onTap != null) return gestureOperations(containerDecoration);

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: containerDecoration,
      child: widget.child,
    );
  }

  GestureDetector gestureOperations(BoxDecoration containerDecoration) {
    return GestureDetector(
      onTapDown: (_) => setState(() {
        _isPressed = true;
        _controller.forward();
      }),
      onTapUp: (_) async {
        // Küçük bir gecikme ekleyip sonra normal boyuta dön
        await Future.delayed(const Duration(milliseconds: 50));
        if (mounted) {
          setState(() {
            _isPressed = false;
            _controller.reverse();
          });
        }
      },
      onTapCancel: () => setState(() {
        _isPressed = false;
        _controller.reverse();
      }),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _isPressed ? 0.90 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Container(
          height: widget.height,
          decoration: containerDecoration,
          child: widget.child,
        ),
      ),
    );
  }
}
