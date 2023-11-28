import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/data/data_source/mail/remote/remote_mail_data_source_provider.dart';
import 'package:mukgen_flutter_v1/data/repository/mail_repository_impl.dart';
import 'package:mukgen_flutter_v1/domain/repository/mail_repository/mail_repository.dart';

final mailRepositoryProvider = Provider<MailRepository>(
    (ref) {
      final remoteMailDataSource = ref.watch(remoteMailDataSourceProvider);
      return MailRepositoryImpl(remoteMailDataSource: remoteMailDataSource);
    }
);