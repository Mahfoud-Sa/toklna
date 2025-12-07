import 'dart:math';

import 'package:flutter/material.dart';

////////////////////////////////////////////////////////////////////////////////////////////
/// PROGRESS SQUARE WIDGET
////////////////////////////////////////////////////////////////////////////////////////////

class ProgressSquare extends StatefulWidget {
  final double progress; // 0..1
  final double strokeWidth;
  final Color trackColor;
  final Color progressColor;
  final bool auto;
  final Duration duration;
  final double speed; // 1.0 = normal, >1 faster, <1 slower
  final double size;
  final Widget? child;

  const ProgressSquare({
    Key? key,
    this.progress = 0.0,
    this.strokeWidth = 8.0,
    this.trackColor = const Color(0xFFE0E0E0),
    this.progressColor = const Color(0xFF1976D2),
    this.auto = false,
    this.duration = const Duration(seconds: 3),
    this.speed = 1.0,
    this.size = 150,
    this.child,
  }) : super(key: key);

  @override
  State<ProgressSquare> createState() => _ProgressSquareState();
}

class _ProgressSquareState extends State<ProgressSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get currentProgress =>
      widget.auto ? _controller.value : widget.progress.clamp(0.0, 1.0);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    if (widget.auto) {
      final periodMs =
          (widget.duration.inMilliseconds /
                  (widget.speed <= 0 ? 1 : widget.speed))
              .round();
      _controller.repeat(
        period: Duration(milliseconds: periodMs > 0 ? periodMs : 1),
      );
    } else {
      _controller.value = widget.progress.clamp(0.0, 1.0);
    }
  }

  @override
  void didUpdateWidget(covariant ProgressSquare oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If auto mode toggled or duration/speed changed while auto, restart repeat with new period
    if (oldWidget.auto != widget.auto ||
        (widget.auto &&
            (oldWidget.duration != widget.duration ||
                oldWidget.speed != widget.speed))) {
      if (widget.auto) {
        final periodMs =
            (widget.duration.inMilliseconds /
                    (widget.speed <= 0 ? 1 : widget.speed))
                .round();
        _controller.repeat(
          period: Duration(milliseconds: periodMs > 0 ? periodMs : 1),
        );
      } else {
        _controller.stop();
      }
    }

    // If not auto and progress changed, animate to the new progress value (smooth), scaled by speed
    if (!widget.auto && oldWidget.progress != widget.progress) {
      final target = widget.progress.clamp(0.0, 1.0);
      final animMs = (300 / (widget.speed <= 0 ? 1 : widget.speed)).round();
      _controller.animateTo(
        target,
        duration: Duration(milliseconds: animMs > 0 ? animMs : 1),
        curve: Curves.linear,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Child widget (e.g., image) in center
          if (widget.child != null) widget.child!,
          // Animated progress square on top
          AnimatedBuilder(
            animation: _controller,
            builder: (context, _) {
              return CustomPaint(
                size: Size(widget.size, widget.size),
                painter: _SquarePainter(
                  progress: currentProgress,
                  strokeWidth: widget.strokeWidth,
                  trackColor: widget.trackColor,
                  progressColor: widget.progressColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _SquarePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color trackColor;
  final Color progressColor;

  _SquarePainter({
    required this.progress,
    required this.strokeWidth,
    required this.trackColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paintTrack = Paint()
      ..color = trackColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final paintProgress = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final s = min(size.width, size.height);
    final left = (size.width - s) / 2;
    final top = (size.height - s) / 2;
    final right = left + s;
    final bottom = top + s;

    final topCenter = Offset(left + s / 2, top);
    final topRight = Offset(right, top);
    final bottomRight = Offset(right, bottom);
    final bottomLeft = Offset(left, bottom);
    final topLeft = Offset(left, top);

    final path = Path()
      ..moveTo(topCenter.dx, topCenter.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(topLeft.dx, topLeft.dy)
      ..lineTo(topCenter.dx, topCenter.dy);

    canvas.drawPath(path, paintTrack);

    final total = 4 * s;
    final needed = progress * total;

    double drawn = 0;
    final pp = Path();
    bool pathStarted = false;

    void drawSeg(Offset a, Offset b) {
      final len = (b - a).distance;
      final remain = needed - drawn;

      if (remain <= 0) return;

      if (!pathStarted) {
        pp.moveTo(a.dx, a.dy);
        pathStarted = true;
      }

      if (remain >= len) {
        pp.lineTo(b.dx, b.dy);
        drawn += len;
      } else {
        final t = remain / len;
        final mid = Offset(a.dx + (b.dx - a.dx) * t, a.dy + (b.dy - a.dy) * t);
        pp.lineTo(mid.dx, mid.dy);
        drawn = needed;
      }
    }

    drawSeg(topCenter, topRight);
    drawSeg(topRight, bottomRight);
    drawSeg(bottomRight, bottomLeft);
    drawSeg(bottomLeft, topLeft);
    drawSeg(topLeft, topCenter);

    if (pathStarted) {
      canvas.drawPath(pp, paintProgress);
    }
  }

  @override
  bool shouldRepaint(covariant _SquarePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}
