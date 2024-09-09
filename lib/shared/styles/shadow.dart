import 'package:flutter/material.dart';

@immutable
class BWShadow {
  const BWShadow.bright({
    this.extraLight = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 5,
        spreadRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
    this.extraLightOnlyBottom = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.05),
        blurRadius: 1,
        spreadRadius: 1,
        offset: Offset(0, 2),
      ),
    ],
    this.light = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.12),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    this.medium = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.2),
        blurRadius: 15,
        spreadRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
    this.heavy = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        blurRadius: 20,
        spreadRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
    this.deep = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        blurRadius: 25,
        spreadRadius: 12,
        offset: Offset(0, 3),
      ),
    ],
  });

  const BWShadow.dark({
    this.extraLight = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.05),
        blurRadius: 5,
        spreadRadius: 2,
        offset: Offset(0, 2),
      ),
    ],
    this.extraLightOnlyBottom = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.05),
        blurRadius: 1,
        spreadRadius: 1,
        offset: Offset(0, 2),
      ),
    ],
    this.light = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.12),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 3),
      ),
    ],
    this.medium = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.2),
        blurRadius: 15,
        spreadRadius: 7,
        offset: Offset(0, 3),
      ),
    ],
    this.heavy = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.3),
        blurRadius: 20,
        spreadRadius: 10,
        offset: Offset(0, 3),
      ),
    ],
    this.deep = const [
      BoxShadow(
        color: Color.fromRGBO(255, 255, 255, 0.5),
        blurRadius: 25,
        spreadRadius: 12,
        offset: Offset(0, 3),
      ),
    ],
  });

  final List<BoxShadow> extraLight;
  final List<BoxShadow> extraLightOnlyBottom;
  final List<BoxShadow> light;
  final List<BoxShadow> medium;
  final List<BoxShadow> heavy;
  final List<BoxShadow> deep;
}
