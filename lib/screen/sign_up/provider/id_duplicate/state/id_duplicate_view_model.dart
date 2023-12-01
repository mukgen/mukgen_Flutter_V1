import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/result.dart';
import 'package:mukgen_flutter_v1/domain/use_case/auth/id_duplicate_check_use_case.dart';
import 'package:mukgen_flutter_v1/screen/sign_up/provider/id_duplicate/state/id_duplicate_state.dart';

class IdDuplicateViewModel extends StateNotifier<IdDuplicateState> {
  final IdDuplicateCheckUseCase _idDuplicateCheckUseCase;

  IdDuplicateViewModel(
      {required IdDuplicateCheckUseCase idDuplicateCheckUseCase})
      : _idDuplicateCheckUseCase = idDuplicateCheckUseCase,
        super(IdDuplicateState.initial);
  
  Future<void> idDuplicate ({required String accountId}) async {
    state = IdDuplicateState.loading;
    final res = await _idDuplicateCheckUseCase.execute(accountId: accountId);
    switch (res) {
      case Success(value: final value) :
        if (value) {
          state = IdDuplicateState.failure; // true라면 중복
        } else {
          state = IdDuplicateState.success; // false라면 중복 x
        }
      case Failure() :
        state = IdDuplicateState.failure;
      default:
    }
  }
}