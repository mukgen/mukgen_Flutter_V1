import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/domain/repository/mail_repository/mail_repository_provider.dart';
import 'package:mukgen_flutter_v1/domain/use_case/mail/send_mail_use_case.dart';

final sendMainUseCaseProvider = Provider<SendMailUseCase>((ref) => SendMailUseCase(mailRepository: ref.watch(mailRepositoryProvider)));