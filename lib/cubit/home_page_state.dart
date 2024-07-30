import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  final String name;

  const HomePageState({
    this.name = '',
  });

  @override
  List<Object?> get props => [
        name,
      ];

  HomePageState copyWith({
    String? name,
  }) {
    return HomePageState(
      name: name ?? this.name,
    );
  }
}
