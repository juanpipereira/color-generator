import 'package:color_generator/features/home/domain/color_filters.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color_filters_controller.g.dart';

@riverpod
class ColorFiltersController extends _$ColorFiltersController {
  set setState(ColorFilters? filter) {
    state = filter != null && filter != state ? filter : null;
  }

  @override
  ColorFilters? build() {
    return null;
  }
}
