import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/color_filters.dart';
part 'color_filters_controller.g.dart';

@riverpod
class ColorFiltersController extends _$ColorFiltersController {
  @override
  ColorFilters? build() {
    return null;
  }

  set setState(ColorFilters? filter) {
    state = filter != null && filter != state ? filter : null;
  }
}
