import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class FiatRecipientItem extends Equatable {
  const FiatRecipientItem({
    required this.label,
    required this.key,
    required this.controller,
    this.enterValue,
    this.options,
  });

  final String label;
  final String key;
  final List? options;
  final String? enterValue;
  final TextEditingController controller;

  @override
  List<Object> get props => [
        label,
        key,
      ];
}
