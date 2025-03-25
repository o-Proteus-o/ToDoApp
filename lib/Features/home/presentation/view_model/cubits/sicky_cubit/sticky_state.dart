part of 'sticky_cubit.dart';

@immutable
sealed class StickyState {}

final class StickyInitial extends StickyState {}

final class StickyLoading extends StickyState {}

final class StickySuccess extends StickyState {}

final class StickyFailed extends StickyState {
  final String errMessage;
  StickyFailed(this.errMessage);
}
