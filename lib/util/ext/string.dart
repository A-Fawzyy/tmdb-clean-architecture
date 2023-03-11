
import 'package:platform_channels_challenge/util/index.dart';

/// Extension for [String] class
///
/// Adds a method to get the full image url
extension StringExtension on String {
  /// Returns the full TMBD full image URL
  ///
  /// Appends the base image url to the image path
  String get toImageURL =>'${Constants.imageBaseUrl}$this';
}
