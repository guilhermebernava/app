abstract class BottomBarEvent {}

class ChangeIndex implements BottomBarEvent {
  int index;

  ChangeIndex({
    required this.index,
  });
}
