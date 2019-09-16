import 'package:jsonable/jsonable.dart';

class CJstring extends Jstring {
  CJstring({String initialValue}) : super(initialValue: initialValue);
}

class CJnum extends Jnum {
  CJnum({num initialValue}) : super(initialValue: initialValue);
}

class CJbool extends Jbool {
  CJbool({bool initialValue}) : super(initialValue: initialValue);
}

class CJlist extends Jlist {
  CJlist({List initialValue}) : super(initialValue: initialValue);
}

class CJobject extends Jobject {
  CJobject(JsonableConstructor initialValue)
      : super(initialValue: initialValue()) {}
}
