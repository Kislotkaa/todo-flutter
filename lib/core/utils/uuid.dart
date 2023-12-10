import 'package:uuid/uuid.dart';

const uuid = Uuid();

String genUuid() => uuid.v4();
