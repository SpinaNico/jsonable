import 'package:jsonable/jsonable.dart';
import 'package:jsonable/src/validator/rules.dart';

class CJdynamic extends JDynamic {
  CJdynamic(Jsonable parent, keyname,
      {dynamic initialValue, List<Rule> rules: const []})
      : super(initialValue: initialValue, rules: rules);
}
