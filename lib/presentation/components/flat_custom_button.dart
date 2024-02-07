import 'package:flutter/material.dart';
import 'package:user_app/presentation/helpers/sizes.dart';

typedef GetHover = Widget Function(bool value);
typedef OnHover = Function(bool value);

class FlatCustomButton extends StatefulWidget {
  final double radius;
  final Color? color;
  final Color? borderColor;
  final VoidCallback?  onTap;
  final VoidCallback?  onLongPress;
  final Icon? icon;
  final AnimatedIcon? animIcon;
  final Color? splashColor;
  final Image? imageIcon;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderWidth;
  final CrossAxisAlignment alignment;
  final GetHover? getHover;
  final OnHover? onHover;
  final String? text;
  final Color? textColor;
  final bool? rowAling;

  const FlatCustomButton({Key? key,
    this.color, this.onTap, this.icon,
    this.imageIcon, this.splashColor, this.animIcon,
    this.radius = 4.0, this.child, this.borderColor,
    this.height, this.width, this.padding, this.margin, this.borderWidth,
    this.onLongPress, this.alignment = CrossAxisAlignment.center,
    this.onHover,
    this.getHover, this.text, this.textColor, this.rowAling = false}) : super(key: key);

  @override
  State<FlatCustomButton> createState() => _FlatCustomButtonState();
}

class _FlatCustomButtonState extends State<FlatCustomButton> {
  var isHover = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Material(
        color: Colors.transparent,
        child: _getContainer(
          widget.height,
          widget.width,
          widget.margin,
          decoration: BoxDecoration(
            color: widget.color,
            border: widget.borderColor != null ? Border.all(color: widget.borderColor!, width: widget.borderWidth ?? 1.5) : null,
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastLinearToSlowEaseIn,
              color: isHover ? widget.splashColor  : widget.color,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(widget.radius),
                ),
                // hoverColor: widget.splashColor,
                // highlightColor: splashColor!.withOpacity(0.5),
                // splashColor: widget.splashColor ?? Colors.white30,
                // highlightColor: widget.splashColor ?? Colors.white30,// splash color
                onTap: widget.onTap,
                onHover: (val) {
                  widget.onHover?.call(val);
                  setState(() {
                    isHover = val;
                  });
                },
                onLongPress: widget.onLongPress,// labelLarge pressed
                child: Container(
                  padding: widget.padding,
                  child: widget.rowAling! == false ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: widget.alignment,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.fastLinearToSlowEaseIn,
                          child: widget.getHover?.call(isHover) ?? Container()),
                      widget.animIcon ?? Container(),
                      widget.icon ?? Container(),
                      widget.imageIcon ?? Container(),
                      widget.child ?? Container(),
                      widget.text != null ? Text(widget.text!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: widget.textColor ?? Colors.white70, letterSpacing: 2, fontWeight: FontWeight.w600, fontSize: Sizes.p20),
                      ) : Container(),
                    ],
                  ) :  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: widget.alignment,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 200),
                          switchInCurve: Curves.decelerate,
                          switchOutCurve: Curves.decelerate,
                          child: widget.getHover?.call(isHover) ?? Container()),
                      widget.animIcon ?? Container(),
                      widget.icon ?? Container(),
                      widget.imageIcon ?? Container(),
                      widget.child ?? Container(),
                      widget.text != null ? Text(widget.text!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelMedium!.copyWith(color: widget.textColor ?? Colors.white70, letterSpacing: 2, fontWeight: FontWeight.w600, fontSize: Sizes.p20),
                      ) : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _getContainer(double? height, double? width, EdgeInsets? margin, {required BoxDecoration decoration, required Widget child}) {
    if (height != null || width != null) {
      // assert(width != null);
      return Container(
        height: height,
        width: width,
        margin: margin,
        decoration: decoration,
        child: child,
      );
    } else {
      return Container(
        decoration: decoration,
        margin: margin,
        child: child,
      );
    }
  }
}