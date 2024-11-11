import 'package:flutter/material.dart';

class GlassContainer extends StatefulWidget {
  final Widget child;
  final Color? color;
  final double? height;
  final double borderRadius;
  final double borderWidth;
  final double opacity;
  final VoidCallback? onTap;

  const GlassContainer({
    super.key,
    required this.child,
    this.color = Colors.transparent,
    this.height,
    this.borderRadius = 20,
    this.borderWidth = 0.9,
    this.opacity = 0.2,
    this.onTap,
  });

  @override
  State<GlassContainer> createState() => _GlassContainerState();
}

class _GlassContainerState extends State<GlassContainer> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isPressed = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _darkenToBlack(Color color) {
    return Color.alphaBlend(Colors.black.withOpacity(0.8), color.withOpacity(widget.opacity));
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = widget.color == Colors.transparent ? Colors.transparent : _darkenToBlack(widget.color!);
    final BoxDecoration containerDecoration = BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(widget.borderRadius),
      border: Border.all(
        color: widget.color!.withOpacity(0.4),
        width: widget.borderWidth,
      ),
      boxShadow: [
        BoxShadow(
          color: (widget.color ?? Colors.transparent).withOpacity(0.1),
          blurRadius: 2,
          spreadRadius: 0,
        ),
      ],
    );

    if (widget.onTap != null) return gestureOperations(containerDecoration);

    return Container(
      height: widget.height,
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
        scale: _isPressed ? 0.80 : 1.0,
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
