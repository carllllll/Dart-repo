import 'dart:convert';
import 'dart:io';

void main() async {
  List<Map<String, dynamic>> logEntries = [];

  print("Enter text (type 'exit' to quit):");
  while (true) {
    stdout.write("> ");
    String? input = stdin.readLineSync();

    if (input == null || input.toLowerCase() == 'exit') break;

    // String Manipulations
    String concatenated = input + " (concatenated)";
    String interpolated = "You entered: $input";
    String substring = input.length >= 3 ? input.substring(0, 3) : input;
    String upper = input.toUpperCase();
    String lower = input.toLowerCase();
    String reversed = input.split('').reversed.join('');
    int length = input.length;

    // Print manipulations
    print("Concatenated: $concatenated");
    print("Interpolated: $interpolated");
    print("Substring: $substring");
    print("Uppercase: $upper");
    print("Lowercase: $lower");
    print("Reversed: $reversed");
    print("Length: $length");

    // Store in a Map (like a DB record)
    Map<String, dynamic> entry = {
      'original': input,
      'upper': upper,
      'lower': lower,
      'reversed': reversed,
      'length': length,
      'timestamp': DateTime.now().toIso8601String(),
    };

    // Add to list
    logEntries.add(entry);
  }

  // Save to file
  String filename = 'string_log.json';
  try {
    File file = File(filename);
    await file.writeAsString(jsonEncode(logEntries), mode: FileMode.write);
    print("Entries saved to $filename");
  } catch (e) {
    print("Error writing file: $e");
  }

  // Demonstrate reading file
  try {
    File file = File(filename);
    if (await file.exists()) {
      String content = await file.readAsString();
      List<dynamic> savedLogs = jsonDecode(content);
      print("\n📘 Saved Entries:");
      for (var log in savedLogs) {
        print("${log['timestamp']}: ${log['original']} (Reversed: ${log['reversed']})");
      }
    }
  } catch (e) {
    print("Error reading file: $e");
  }

  // Date and Time Utilities
  DateTime now = DateTime.now();
  DateTime future = now.add(Duration(days: 7));
  DateTime past = now.subtract(Duration(days: 30));

  print("\n🕒 Date Info:");
  print("Now: $now");
  print("7 days from now: $future");
  print("30 days ago: $past");
  print("Days between now and past: ${now.difference(past).inDays}");
}

