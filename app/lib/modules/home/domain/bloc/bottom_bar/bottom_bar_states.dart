abstract class BottomBarState {}

class BottomBarSuccess implements BottomBarState {
  final int index;

  BottomBarSuccess({
    required this.index,
  });
}

class BottomBarError implements BottomBarState {
  final String message;

  BottomBarError({required this.message});
}
