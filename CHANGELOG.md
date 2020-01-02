### 0.1.1

* `JNum` add support to logic operator and arithmetic operator
* `JString` add support to logic operator and arithmetic operator
* `JList` add support to logic operator and arithmetic operator
* `update(Map)` new method (call always pre-existent `fromMap` method)


### 0.1.0
* `add`  add support for `JMap` for `Map\<dynamic, dyanmic\>` and Map of Jsonable: `Map<String, Jsoanble>`

    ```dart
    class Person with Jsonable {
      JMap tags;
      JMap<String, Contact> contacts;
      Person() {
        this.tags = jMap("tags");
        this.contacts = jMap<String, Contact>("contacts", builder: () => Contact());
      }
    }
    
    class Contact with Jsonable {
      JString name;
      JString number;
      Contact() {
        name = jString("name");
        number = jString("number");
      }
    }
    ```

    

* `add` jDynamic new JType for dynamic

* **New** add support for validation field of Jsonable object (see readme)

* **Breaking change** delete support Jsonable with reflection use [dson](https://pub.dev/packages/dson)

* *`add`* setter and getter value 
    
    * void setValue(E value) - set value within JType
* E getValue; -  get value in JType
    
* `add`every JType has access to "value" even in a more specific way
    
    * setString(String value) / String getString()
    * setNum(num value) / num getNum()
    * setBool(bool value) / bool getBool()
    * 
    
* **Breaking Change** removed (experimental) operator "<<" and operator ">>"


### 0.0.2+2

* (experimental) add JType  operator "<<" for set value internal Jtype  and operator ">>" for get value internal Jtype
* add Jsonable operator "[]" 
* performance improvement 
* deprecation old Jsonable reflect if you use reflection use this pack: [dson](https://pub.dev/packages/dson)
* start of experiments with flutter and auto-form (soon with a new flutter package)
* add example for benchmark

### 0.0.2
Breaking change.

With the 0.0.1 management I started development with the reflection of Dart. This resulted in problems with AOT and consequently also with flutter.
In version 0.0.2 all the APIs based on reflection in jsonable / withReflect have been moved

Announcements:
0.0.2
I set out to remove the generation of dart code from my projects, it's a practice I don't like. So in version 0.0.2 I start the creation of a module that is without generation and without reflection.

For more information read [here](https://github.com/SpinaNico/jsonable).

### 0.0.1 
* frist publication. read: Readme.md