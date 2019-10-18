import 'package:jsonable/jsonable.dart';

class MyData with Jsonable {
  JNum num1;
  JNum num2;
  JNum num3;
  JString string1;
  JString string2;
  MyData() {
    this.num1 = this.jNum("num1", initialValue: 1);
    this.num2 = this.jNum("num2", initialValue: 2);
    this.num3 = this.jNum("num3", initialValue: 1);
    this.string1 = this.jString("keyname", initialValue: "hello");
    this.string2 = this.jString("keyname", initialValue: "ciao");
  }

  /// Result false
  bool comparateN1andN2() => this.num2.get == this.num1.get;

  /// result false
  bool compareJNum1and2() => this.num2 == this.num1;

  /// result true
  bool compareJnum3and1() => this.num3 == this.num1;
}
