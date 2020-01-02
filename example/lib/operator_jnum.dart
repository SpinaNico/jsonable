import 'package:jsonable/jsonable.dart';

class MyData with Jsonable {
  JNum num1;
  JNum num2;
  JNum num3;
  JString string1;
  JString string2;
  MyData() {
    num1 = jNum("num1", initialValue: 1);
    num2 = jNum("num2", initialValue: 2);
    num3 = jNum("num3", initialValue: 1);
    string1 = jString("keyname", initialValue: "hello");
    string2 = jString("keyname", initialValue: "ciao");
  }

  /// Result false
  bool comparateN1andN2() => num2.value == num1.value;

  /// result false
  bool compareJNum1and2() => num2 == num1;

  /// result true
  bool compareJnum3and1() => num3 == num1;
}
