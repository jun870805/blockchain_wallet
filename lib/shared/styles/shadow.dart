import 'package:flutter/material.dart';

@immutable
class BWShadow {
  const BWShadow.bright({
    this.notification = const [
      BoxShadow(
        color: Color(0x10005661),
        blurRadius: 4.0,
        offset: Offset(2, 2),
      ),
    ],
    this.actionBar = const [
      BoxShadow(
        color: Color(0x062D6788),
        blurRadius: 3.0,
        offset: Offset(0, 3),
      ),
    ],
    this.banner = const [
      BoxShadow(
        color: Color.fromRGBO(45, 103, 136, 0.08),
        blurRadius: 40.0,
        spreadRadius: 3,
        offset: Offset(0, 8),
      ),
    ],
    this.block = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.06),
        blurRadius: 16.0,
        spreadRadius: 2.0,
        offset: Offset(0, 0),
      ),
    ],
    this.dropdown = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.06),
        blurRadius: 8.0,
        spreadRadius: 2.0,
        offset: Offset(0, 0),
      ),
    ],
    this.large = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.05),
        blurRadius: 8.0,
        spreadRadius: 6.0,
        offset: Offset(0, 8),
      ),
    ],
    this.medium = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.04),
        blurRadius: 8.0,
        spreadRadius: 2.0,
        offset: Offset(0, 6),
      ),
    ],
    this.small = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.06),
        blurRadius: 8.0,
        spreadRadius: 0.0,
        offset: Offset(0, 2),
      ),
    ],
    this.externalSmall = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.05),
        blurRadius: 4.0,
        spreadRadius: 0.0,
        offset: Offset(0, 2),
      ),
    ],
  });

  const BWShadow.dark({
    this.notification = const [
      BoxShadow(
        color: Color(0x10005661),
        blurRadius: 4.0,
        offset: Offset(2, 2),
      ),
    ],
    this.actionBar = const [
      BoxShadow(
        color: Color(0x062D6788),
        blurRadius: 3.0,
        offset: Offset(0, 3),
      ),
    ],
    this.banner = const [
      BoxShadow(
        color: Color.fromRGBO(13, 13, 13, 0.05),
        blurRadius: 3.0,
        offset: Offset(0, -3),
      ),
    ],
    this.block = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.3),
        blurRadius: 16.0,
        spreadRadius: 2.0,
        offset: Offset(0, 0),
      ),
    ],
    this.dropdown = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.16),
        blurRadius: 8.0,
        spreadRadius: 2.0,
        offset: Offset(0, 0),
      ),
    ],
    this.large = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        blurRadius: 12.0,
        spreadRadius: 6.0,
        offset: Offset(0, 4),
      ),
    ],
    this.medium = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.35),
        blurRadius: 8.0,
        spreadRadius: 3.0,
        offset: Offset(0, 6),
      ),
    ],
    this.small = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.8),
        blurRadius: 4.0,
        spreadRadius: 0.0,
        offset: Offset(0, 2),
      ),
    ],
    this.externalSmall = const [
      BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.5),
        blurRadius: 4.0,
        spreadRadius: 0.0,
        offset: Offset(0, 2),
      ),
    ],
  });

  final List<BoxShadow> notification;
  final List<BoxShadow> actionBar;
  final List<BoxShadow> banner;
  final List<BoxShadow> block;
  final List<BoxShadow> dropdown;

  final List<BoxShadow> large;
  final List<BoxShadow> medium;
  final List<BoxShadow> small;
  final List<BoxShadow> externalSmall;
}
