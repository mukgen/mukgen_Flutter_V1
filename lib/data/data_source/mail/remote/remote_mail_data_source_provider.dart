import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mukgen_flutter_v1/core/network/networking_provider.dart';
import 'package:mukgen_flutter_v1/data/data_source/mail/remote/remote_mail_data_source.dart';

final remoteMailDataSourceProvider = Provider((ref) => RemoteMailDataSource(networking: ref.watch(networkingProvider)));