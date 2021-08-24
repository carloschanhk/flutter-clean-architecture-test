// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../counter/counter_page_view_model.dart' as _i3;
import '../data/note_repository.dart' as _i5;
import '../home/home_page_view_model.dart' as _i4;
import '../local/note_datasource.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CounterPageViewModel>(() => _i3.CounterPageViewModel());
  gh.factory<_i4.HomePageViewModel>(
      () => _i4.HomePageViewModel(get<_i5.NoteRepository>()));
  gh.singleton<_i6.NoteDatasource>(_i6.NoteDatasource());
  gh.singleton<_i5.NoteRepository>(
      _i5.NoteRepository(get<_i6.NoteDatasource>()));
  return get;
}
