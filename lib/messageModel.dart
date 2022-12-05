import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MessageModel MessageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String MessageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.message,
    required this.buttons,
    required this.check,
    this.controller,
  });

  String message;
  List<String> buttons;
  bool check;
  AnimationController? controller;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        buttons: List<String>.from(json["buttons"].map((x) => x)),
        check: json["check"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "buttons": List<dynamic>.from(buttons.map((x) => x)),
        "check": check,
      };
}
