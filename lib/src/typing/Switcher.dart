import 'package:jsonable/jsonable.dart';

switcher({
  Function(JString) jstring,
  Function(JNum) jnum,
  Function(JBool) jbool,
  Function(JClass) jclass,
  Function(JList) jlist,
  Function(JList<Jsonable>) jlisJsonable,
}) {}
