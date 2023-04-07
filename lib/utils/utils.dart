//import "dart:io";

import "package:calendar_manager/models/EventModel.dart";
import "package:tuple/tuple.dart";

class Util {
  static Tuple2<String, List<Event>> fromCSVToJSON(String data) {
    Stopwatch stopwatch = Stopwatch()..start();

    List<Event> events = csvToEventsList(data);

    String jsonString = "";

    jsonString = events.map((e) => e.toJson()).join(",\n");
    jsonString = '{ "events": [$jsonString] }';

    /*File jsonFile = File(
        "C:/Users/lcvia/OneDrive/Documentos/GitHub/ES-2023-2Sem-Quarta-Feira-LEI-GrupoG/assets/files/events.json");

    jsonFile.writeAsStringSync(jsonString);
    */
    stopwatch.stop();
    print('Time elapsed: ${stopwatch.elapsedMilliseconds} milliseconds');
    return Tuple2(jsonString, events);
  }

  static List<Event> csvToEventsList(String data) {
    List<Event> events = [];
    List<String> eventsStrings = data.split("\n");
    for (int i = 1; i < eventsStrings.length; i++) {
      events.add(Event.fromCSV(eventsStrings[i]));
    }
    return events;
  }
}
