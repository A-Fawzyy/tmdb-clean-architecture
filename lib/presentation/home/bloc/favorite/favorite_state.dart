part of 'favorites_cubit.dart';

class FavoriteState extends Equatable {
  const FavoriteState._({required this.isFavorite});

  final bool isFavorite;

  @override
  List<Object> get props => [isFavorite];

  factory FavoriteState.favorite() => const FavoriteState._(isFavorite: true);
  factory FavoriteState.notFavorite() => const FavoriteState._(isFavorite: false);

  FavoriteState copyWith({
    bool? isFavorite,
  }) {
    return FavoriteState._(
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

