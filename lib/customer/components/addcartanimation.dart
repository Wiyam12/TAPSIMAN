import 'dart:math' as math;

import 'package:flutter/material.dart';

/// This is used to control the button state.
enum AddToCartButtonStateId {
  /// display the normal button with an icon on the left side and a text on the center.
  idle,

  /// animating to show the users know it is loading.
  loading,

  /// when loading done, it displays a circular button with a center icon to show the uses know it is done.
  done,
}

/// Help you create a button that is used to let the users can add items to their shopping cart. This will be useful for eCommerce app.
class AddToCartButton extends StatefulWidget {
  /// [trolley] : The icon on the left side, see also [_RunningTrolley]
  final Widget trolley;

  /// [text] : The text on center, it will be disappeared during [AddToCartButtonStateId.loading] state.
  final Widget text;

  /// [check] : The icon is used for [AddToCartButtonStateId.done] state.
  final Widget check;

  /// [onPressed] : The users only are able to press on this button on [AddToCartButtonStateId.idle] state (then this will be turned to [AddToCartButtonStateId.loading] state), and on [AddToCartButtonStateId.done] state (then this will be turned to [AddToCartButtonStateId.idle] state).
  final Function(AddToCartButtonStateId id) onPressed;

  /// [duration] : The duration use to animate from [AddToCartButtonStateId.loading] state to [AddToCartButtonStateId.done]
  final Duration duration;

  /// By default, this is designed as a [RoundedRectangleBorder] button, [borderRadius] helps you fit this widget with your design.
  final BorderRadius? borderRadius;

  /// [backgroundColor] : the button background color.
  final Color? backgroundColor;

  /// [streetLineHeight] & [streetLineDashWidth] & [trolleyLeftMargin] : are used to create the [_RunningTrolley]
  final double streetLineHeight;
  final double streetLineDashWidth;
  final double trolleyLeftMargin;

  /// [stateId] : the current state of this button, its parent control this.
  final AddToCartButtonStateId stateId;

  /// Constructor
  /// Create an Add To Cart button.
  const AddToCartButton({
    Key? key,
    this.duration: const Duration(milliseconds: 3000),
    required this.trolley,
    required this.text,
    required this.check,
    required this.onPressed,
    this.borderRadius,
    this.backgroundColor,
    this.streetLineHeight: 2,
    this.streetLineDashWidth: 12,
    this.trolleyLeftMargin: 12,
    this.stateId = AddToCartButtonStateId.idle,
  }) : super(key: key);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton>
    with TickerProviderStateMixin {
  final TweenSequence<double> _bounceScaleTween = TweenSequence<double>([
    TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.8), weight: 0.3),
    TweenSequenceItem(tween: Tween(begin: 0.8, end: 1.2), weight: 0.3),
    TweenSequenceItem(tween: Tween(begin: 1.2, end: 1.0), weight: 0.4),
  ]);
  late Animatable<double> _disappearFirstTween;

  late AnimationController _firstController;
  late AnimationController _crossController;
  late AnimationController _secondController;
  AddToCartButtonStateId _stateId = AddToCartButtonStateId.idle;

  @override
  void initState() {
    _disappearFirstTween = Tween<double>(begin: 1.0, end: 0.0);

    final duration = widget.duration * 0.1;
    _firstController = AnimationController(vsync: this, duration: duration);
    _firstController.addListener(() {
      setState(() {});
    });
    _crossController = AnimationController(vsync: this, duration: duration);
    _crossController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondController.forward(from: 0.0);
      }
    });
    _crossController.addListener(() {
      setState(() {});
    });
    _secondController = AnimationController(vsync: this, duration: duration);
    _secondController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _firstController.dispose();
    _crossController.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AddToCartButton oldWidget) {
    if (oldWidget.stateId != widget.stateId) {
      _updateState(widget.stateId);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (_stateId == AddToCartButtonStateId.done) _buildSecond(context),
        if (_stateId != AddToCartButtonStateId.done ||
            _crossController.isAnimating)
          _buildFirst(context),
      ],
    );
  }

  /// build the [AddToCartButtonStateId.idle] & [AddToCartButtonStateId.loading] state widget.
  Widget _buildFirst(BuildContext context) {
    final borderRadius = widget.borderRadius ?? BorderRadius.circular(24);
    final double height =
        math.max(borderRadius.topLeft.y, borderRadius.topRight.y) +
            math.max(borderRadius.bottomLeft.y, borderRadius.bottomRight.y);
    return ScaleTransition(
      scale: _bounceScaleTween.animate(_firstController),
      child: ElevatedButton(
        onPressed: this._onPressedFirst,
        style: ButtonStyle(
          shape:
              MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
            borderRadius: borderRadius,
          )),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          elevation: MaterialStateProperty.all<double>(0.0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(Size.zero),
          backgroundColor: widget.backgroundColor != null
              ? MaterialStateProperty.all<Color>(widget.backgroundColor!)
              : null,
        ),
        child: SizeTransition(
          axis: Axis.horizontal,
          sizeFactor: _disappearFirstTween.animate(_crossController),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: height,
                child: FadeTransition(
                  opacity: _disappearFirstTween
                      .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn))
                      .animate(_crossController),
                  child: _RunningTrolley(
                    stateId: _stateId,
                    trolley: widget.trolley,
                    duration: widget.duration,
                    streetLineHeight: widget.streetLineHeight,
                    streetLineDashWidth: widget.streetLineDashWidth,
                    trolleyLeftMargin: widget.trolleyLeftMargin,
                  ),
                ),
              ),
              FadeTransition(
                opacity: _disappearFirstTween
                    .chain(CurveTween(curve: Curves.fastLinearToSlowEaseIn))
                    .animate(_firstController),
                child: Center(
                  child: widget.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// build the [AddToCartButtonStateId.done] state widget.
  Widget _buildSecond(BuildContext context) {
    return ScaleTransition(
      scale: _bounceScaleTween.animate(_secondController),
      child: ElevatedButton(
        onPressed: this._onPressedSecond,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(CircleBorder()),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          elevation: MaterialStateProperty.all<double>(0.0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: MaterialStateProperty.all<Size>(Size.zero),
          backgroundColor: widget.backgroundColor != null
              ? MaterialStateProperty.all<Color>(widget.backgroundColor!)
              : null,
        ),
        child: widget.check,
      ),
    );
  }

  /// update state from parent to start the animation.
  void _updateState(AddToCartButtonStateId stateId) {
    this._stateId = stateId;
    switch (stateId) {
      case AddToCartButtonStateId.loading:
        _loading();
        break;
      case AddToCartButtonStateId.done:
        _done();
        break;
      default:
        _reset();
        break;
    }
  }

  /// start the loading state animation.
  void _loading() {
    _firstController.forward(from: 0.0);
  }

  /// start the done state animation.
  void _done() {
    _crossController.forward(from: 0.0);
  }

  /// reverse to the idle state.
  void _reset() {
    _firstController.reset();
    _secondController.reset();
    _crossController.reverse();
  }

  /// When users are pressed on the idle & loading state.
  /// Handle for idle state only.
  void _onPressedFirst() {
    if (_stateId == AddToCartButtonStateId.idle) {
      widget.onPressed(_stateId);
    }
  }

  /// When users are pressed on the done state.
  /// Handle for done state only.
  void _onPressedSecond() {
    if (_stateId == AddToCartButtonStateId.done) {
      widget.onPressed(_stateId);
    }
  }
}

/// Paint a trolley runs on a street.
class _RunningTrolley extends StatefulWidget {
  final Widget trolley;
  final Duration duration;
  final AddToCartButtonStateId stateId;
  final double streetLineHeight;
  final double streetLineDashWidth;
  final double trolleyLeftMargin;

  /// Constructor
  /// [duration] is duration of the [trolley] runs from the left to right side.
  /// [stateId] is used to know the current state of this button from the parent, lets the parent control this.
  /// To flexible the start point of the trolley, you can use [trolleyLeftMargin].
  /// [streetLineHeight] & [streetLineDashWidth] are used to draw the street.
  const _RunningTrolley({
    Key? key,
    this.stateId: AddToCartButtonStateId.idle,
    required this.trolley,
    required this.duration,
    required this.streetLineHeight,
    required this.streetLineDashWidth,
    required this.trolleyLeftMargin,
  }) : super(key: key);

  @override
  _RunningTrolleyState createState() => _RunningTrolleyState();
}

class _RunningTrolleyState extends State<_RunningTrolley>
    with TickerProviderStateMixin {
  late AnimationController _streetController;
  late AnimationController _trolleyController;
  late AnimationController _disappearController;

  late TweenSequence<double> _trolleyScaleTween;
  late TweenSequence<double> _trolleyRotateTween;
  TweenSequence<Offset>? _trolleyTranslateTween;
  late TweenSequence<double> _streetTween;
  late Animatable<double> _disappearTween;

  @override
  void initState() {
    _disappearTween = Tween<double>(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Curves.linear));

    _trolleyScaleTween = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.5), weight: 0.1),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: 1.0), weight: 0.1),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.0), weight: 0.8),
    ]);
    _trolleyRotateTween = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: _convertDegToRad(-20.0)), weight: 0.1),
      TweenSequenceItem(
          tween: Tween(
              begin: _convertDegToRad(-20.0), end: _convertDegToRad(20.0)),
          weight: 0.1),
      TweenSequenceItem(
          tween: Tween(begin: _convertDegToRad(20.0), end: 0.0), weight: 0.8),
    ]);
    _streetTween = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 0.0), weight: 0.1),
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -1.0), weight: 0.9),
    ]);

    _streetController =
        AnimationController(vsync: this, duration: widget.duration);
    _streetController.addListener(() {
      setState(() {});
    });
    final trolleyDuration = widget.duration * 0.8;
    _trolleyController =
        AnimationController(vsync: this, duration: trolleyDuration);
    _trolleyController.addListener(() {
      setState(() {});
    });
    final disappearDuration = widget.duration * 0.1;
    _disappearController =
        AnimationController(vsync: this, duration: disappearDuration);
    _disappearController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant _RunningTrolley oldWidget) {
    if (oldWidget.stateId != widget.stateId) {
      switch (widget.stateId) {
        case AddToCartButtonStateId.loading:
          _start();
          break;
        case AddToCartButtonStateId.done:
          _disappear();
          break;
        default:
          _reset();
          break;
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _streetController.dispose();
    _trolleyController.dispose();
    _disappearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var box = context.findRenderObject() as RenderBox?;
    final double width = box?.hasSize == true ? box!.size.width : 0;
    if (_trolleyTranslateTween == null && width > 0) {
      final left = Offset(widget.trolleyLeftMargin, 0.0);
      _trolleyTranslateTween = TweenSequence([
        TweenSequenceItem(tween: Tween(begin: left, end: left), weight: 0.1),
        TweenSequenceItem(
            tween: Tween(begin: left, end: Offset(width, 0.0)), weight: 0.9),
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.translate(
              offset: _trolleyTranslateTween == null
                  ? Offset.zero
                  : _trolleyTranslateTween!
                      .chain(CurveTween(curve: Curves.fastOutSlowIn))
                      .evaluate(_trolleyController),
              child: Transform.rotate(
                angle: _trolleyRotateTween.evaluate(_trolleyController),
                child: ScaleTransition(
                  scale: _trolleyScaleTween.animate(_trolleyController),
                  alignment: Alignment.bottomLeft,
                  child: width > 0 ? widget.trolley : SizedBox(),
                ),
              ),
            ),
          ],
        ),
        FadeTransition(
          opacity: _disappearTween.animate(_disappearController),
          child: Container(
            height: widget.streetLineHeight,
            child: CustomPaint(
              painter: _StreetLinePainter(
                dashWidth: widget.streetLineDashWidth,
                translateFactor: _streetTween
                    .chain(CurveTween(curve: Curves.fastOutSlowIn))
                    .evaluate(_streetController),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// start the animation, the trolley starts running.
  void _start() {
    _disappearController.stop();
    _disappearController.reset();

    _trolleyController.forward(from: 0.0);
    _streetController.forward(from: 0.0);
  }

  /// reset to idle state.
  void _reset() {
    _disappearController.stop();
    _disappearController.reset();
    _trolleyController.stop();
    _trolleyController.reset();
    _streetController.stop();
    _streetController.reset();
  }

  /// when the trolley reaches the right side, start disappearing this widget.
  void _disappear() {
    Future.delayed(_disappearController.duration!, () {
      _disappearController.forward(from: 0.0);
    });
  }
}

/// Paint the street animation by translating a dash line
class _StreetLinePainter extends CustomPainter {
  final double dashWidth;
  final double translateFactor;

  /// Constructor
  /// [translateFactor] is the animation controller value that controls this.
  _StreetLinePainter({
    this.dashWidth: 12.0,
    this.translateFactor: 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;
    final gapPaint = Paint()
      ..color = Colors.transparent
      ..strokeWidth = paint.strokeWidth
      ..strokeCap = StrokeCap.round;
    final distance = size.width * 3;
    final numberOfHorizontalDash = distance ~/ dashWidth + 2;
    var left = size.centerLeft(Offset.zero);
    left +=
        Offset(size.width + dashWidth * 2 + translateFactor * distance, 0.0);

    for (int i = 0; i < numberOfHorizontalDash; i++) {
      canvas.drawLine(
          left + Offset(i * dashWidth, 0),
          left + Offset(i * dashWidth + dashWidth, 0),
          (i % 2 == 0) ? paint : gapPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/// convert from degree value to radian value
double _convertDegToRad(double deg) => deg * math.pi / 180.0;
