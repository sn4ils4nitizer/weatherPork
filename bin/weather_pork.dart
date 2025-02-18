import 'package:weather_pork/weather_pork.dart' as weather_pork;
import 'dart:convert';
import 'dart:io';
import 'package:args/args.dart';

void main(List<String> arguments) {
  var parser = ArgParser();
  parser.addOption('location', abbr: 'l', defaultsTo: 'Chicago');
}
