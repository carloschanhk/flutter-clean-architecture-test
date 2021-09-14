// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/counter/counter_repository.dart' as _i4;
import '../data/note/note_repository.dart' as _i6;
import '../layout/counter/counter_page_view_model.dart' as _i8;
import '../layout/note/note_page_view_model.dart' as _i9;
import '../layout/sms_verification/sms_verification_view_model.dart' as _i7;
import '../local/counter/counter_datasource.dart' as _i3;
import '../local/note/note_datasource.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.CounterDatasource>(() => _i3.CounterDatasource());
  gh.factory<_i4.CounterRepository>(
      () => _i4.CounterRepository(get<_i3.CounterDatasource>()));
  gh.factory<_i5.NoteDatasource>(() => _i5.NoteDatasource());
  gh.factory<_i6.NoteRepository>(
      () => _i6.NoteRepository(get<_i5.NoteDatasource>()));
  gh.factory<_i7.SMSVerificationViewModel>(
      () => _i7.SMSVerificationViewModel());
  gh.factory<_i8.CounterPageViewModel>(
      () => _i8.CounterPageViewModel(get<_i4.CounterRepository>()));
  gh.factory<_i9.NotePageViewModel>(
      () => _i9.NotePageViewModel(get<_i6.NoteRepository>()));
  return get;
}
