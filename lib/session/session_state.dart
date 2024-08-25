import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SessionState extends Equatable {
  final ThemeMode themeMode;

  const SessionState({
    this.themeMode = ThemeMode.system,
  });

  @override
  List<Object?> get props => [
        themeMode,
      ];

  SessionState copyWith({
    ThemeMode? themeMode,
  }) {
    return SessionState(
      themeMode: themeMode ?? this.themeMode,
    );
  }
}
