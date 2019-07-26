class Event {
  String name = '';
  String creator = '';
  DateTime dateStart;
  DateTime dateEnd;
  bool cycle = false;

  static const String AppleTV = 'AppleTV';
  static const String Microphone = 'Microphone';

  Map neededFeatures = {
    AppleTV: false,
    Microphone: false
  };

 save() {
    print('saving event using a web service');
  }
}

