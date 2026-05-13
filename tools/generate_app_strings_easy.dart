import 'dart:io';

void main() async {
  print('🔄 Generating AppStrings...\n');

  // 1. Run easy_localization:generate
  print('📦 Running easy_localization:generate...');
  final result = await Process.run('dart', [
    'run',
    'easy_localization:generate',
    '-S',
    'assets/translations',
    '-f',
    'keys',
    '-o',
    'locale_keys.g.dart',
  ]);

  if (result.exitCode != 0) {
    print('❌ Error: ${result.stderr}');
    return;
  }

  print('✅ Generated locale_keys.g.dart\n');

  // 2. Read file
  final file = File('lib/generated/locale_keys.g.dart');
  if (!file.existsSync()) {
    print('❌ Generated file not found');
    return;
  }

  String content = file.readAsStringSync();

  // 3. Transform LocaleKeys to AppStrings and handle methods
  String updatedContent = _processContent(content);

  // 4. Save to new location
  final outputFile = File('lib/core/localizations/app_strings.g.dart');
  outputFile.createSync(recursive: true);
  outputFile.writeAsStringSync(updatedContent);

  print('✅ Created: lib/core/localizations/app_strings.g.dart');
}

String _processContent(String content) {
  // Replace class name
  content = content.replaceAll('abstract class  LocaleKeys', 'abstract class AppStrings');
  
  final lines = content.split('\n');
  final transformedLines = <String>[];
  
  // List of keys that should be methods instead of getters
  const methodKeys = {
    'symptomsSaved': ['date'],
    'daysOfDays': ['day', 'total'],
    'daysRemainingText': ['days'],
    'dailyAt': ['time'],
  };

  bool addedImport = false;

  for (var line in lines) {
    if (line.contains('import')) continue; // Skip existing imports if any
    
    if (!addedImport && line.contains('abstract class')) {
      transformedLines.add("import 'package:easy_localization/easy_localization.dart';");
      transformedLines.add("");
      addedImport = true;
    }

    // Match: static const variableName = 'value';
    final match = RegExp(r"^\s*static const (\w+) = '([^']+)';").firstMatch(line);

    if (match != null) {
      final variableName = match.group(1);
      final value = match.group(2);

      if (methodKeys.containsKey(variableName)) {
        // Skip automatic getter for method keys
        continue;
      } else {
        // Transform to: static String get variableName => 'value'.tr();
        transformedLines.add("  static String get $variableName => '$value'.tr();");
      }
    } else if (line.trim() == '}') {
      // Before closing the class, add our custom methods
      transformedLines.add("");
      transformedLines.add("  // Custom Methods for keys with arguments");
      transformedLines.add("  static String symptomsSaved(String date) => 'symptomsSaved'.tr(args: [date]);");
      transformedLines.add("  static String daysOfDays(String day, String total) => 'daysOfDays'.tr(args: [day, total]);");
      transformedLines.add("  static String daysRemainingText(String days) => 'daysRemainingText'.tr(args: [days]);");
      transformedLines.add("  static String dailyAt(String time) => 'dailyAt'.tr(args: [time]);");
      transformedLines.add("  static String monthName(int m) => 'month\$m'.tr();");
      transformedLines.add("}");
    } else {
      transformedLines.add(line);
    }
  }

  return transformedLines.join('\n');
}
