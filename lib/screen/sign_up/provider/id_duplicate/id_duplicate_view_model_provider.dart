import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/providers/id_duplicate_check_use_case_provider.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/id_duplicate/state/id_duplicate_state.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/id_duplicate/state/id_duplicate_view_model.dart';

final idDuplicateViewModelProvider = StateNotifierProvider<IdDuplicateViewModel, IdDuplicateState>((ref) =>
    IdDuplicateViewModel(idDuplicateCheckUseCase: ref.watch(idDuplicateCheckUseCaseProvider)));

final idControllerProvider = StateProvider<bool>((ref) => false);
final pwdControllerProvider = StateProvider<bool>((ref) => false);
final pwdCheckControllerProvider = StateProvider<bool>((ref) => false);