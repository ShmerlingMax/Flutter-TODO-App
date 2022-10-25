enum Importance {
  low(textName: 'low'),
  basic(textName: 'basic'),
  important(textName: 'important');

  const Importance({required this.textName});

  final String textName;
}

enum Event {
  add(textName: 'add_task'),
  delete(textName: 'delete_task'),
  done(textName: 'done_task');

  const Event({required this.textName});

  final String textName;
}

const newColorEnabled = 'new_color_enabled';
const revisionKey = 'revision';
