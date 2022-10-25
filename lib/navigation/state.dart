class NavigationState {
  bool isMainScreen;
  int? taskIndex;
  NavigationState(this.isMainScreen, this.taskIndex);
  NavigationState.mainScreen()
      : isMainScreen = true,
        taskIndex = null;
  NavigationState.newTask()
      : isMainScreen = false,
        taskIndex = null;
  NavigationState.oldTask(int index)
      : isMainScreen = false,
        taskIndex = index;

  @override
  String toString() => "MainScreen: $isMainScreen, book: $taskIndex";
}
