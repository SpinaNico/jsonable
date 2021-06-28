import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJdynamic extends JDynamic {
  CJdynamic(Jsonable parent, dynamic keyname,
      {dynamic initialValue, List<Rule>? rules = const []})
      : super(keyname, parent, initialValue: initialValue, rules: rules);
}
