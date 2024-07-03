import 'package:hummus_admin_panel/core/core_export.dart';
import 'package:hummus_admin_panel/core/networkV2/models/network_exception.dart';

typedef FutureEitherType<T> = Future<Either<NetworkException, T>>;
