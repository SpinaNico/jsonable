# Jsonable

#### Main functions

+ `dynamic mapable(Object o) ` 

  > This function transforms any object into a Map / List.
  >
  > The keys of the map are the names of the "getters" and of the variables, while the values are the associated values, or that are returned.

+ `String jsonable(Object o)`

  > This method uses `mapable` and simply transforms into json.

+ `JsonableReportError validate(Object o, {JsonableReportError report})`

  > This function validates the values inside the objects, to create the validation criteria you must use "JsonValidator" which is an annotation `@JsonValidator()`

## Why did I create this package?

Currently I have not found anything useful and expendable to transform and validate a json in dart.

I tried this library: [json_serializable](https://pub.dev/packages/json_serializable)

But its operation passes from external tools.
`Jsonable` works in runtime does not need any tools, and you do not need any "generated" files

## How to use?

A simple, understandable example of how it works

```dart
import "package:jsonable/jsonable.dart";

class Person {
  String name = "Nico";
  String surname = "Spina";
}

main() {
  var result = jsonable(Person());
  print(result);
}

```

output in terminal:

```
{"name":"Nico","surname":"Spina"}
```

#### Classes Composed

to allow json compounds Jsonable offers two classes: `Jsonable` `Mapapble`

They are the object-oriented programming version of the primary functions.

they also offer `fromJson` and` fromMap`

example:

```dart
import "package:jsonable/jsonable.dart";

class Contact extends Jsonable {
  String name;
  String surname;
  Contact({this.name, this.surname});
}

class Person extends Jsonable {
  String name = "Mark";
  String surname = "Zuckerberg";
  List<Contact> contacts = [
    Contact(name: "Mario", surname: "Bross"),
    Contact(name: "Elon", surname: "Musk")
  ];
}

main() {
  var result = jsonable(Person());
  print(result);
  print(Person().toJson());
}

```

output in terminal: *(I added the indentation)*

```
{
   "name":"Mark",
   "surname":"Zuckerberg",
   "contacts":[
      {"name":"Mario","surname":"Bross"},
      {"name":"Elon","surname":"Musk"}
   ]
}

{
   "name":"Mark",
   "surname":"Zuckerberg",
   "contacts":[
      {"name":"Mario","surname":"Bross"},
      {"name":"Elon","surname":"Musk"}
   ]
}
```



### fromMap() fromJson()

a simple example to understand fromMap:

```dart
import "package:jsonable/jsonable.dart";

class Person extends Mapable {
  String name;
  String surname;
  String date;
}

main() {
  Map<String, dynamic> m = {"name": "Nico", "surname": "Spina"};
  var p = Person();
  p.fromMap(m);
  print([p.name, p.surname, p.date]);
}

```

outputs:

```
[Nico, Spina, null]
```

The date is null because it was not found within the map

---

a simple example to understand fromJson:

```dart
import "package:jsonable/jsonable.dart";

class Person extends Jsonable {
  String name;
  String surname;
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  print([p.name, p.surname, p.date]);
}
```

outputs:

```
[Nico, Spina, null]
```

---

#### Annotation (@)

within this package there are two important annotations.

* `@JsonNote({String keyName, bool exclude})`

  params:

  *   `String keyName` with this field indicate to Jsonable, that the name of that variable / getter must be the one expressed in KeyName and not the original
  * `bool exclude`  This indicates to jsonable that it must skip this variable / getter

* `@JsonValidator`

  Params:

  * `int max` check that the length is maximum that number.
    check strings, Lists, numbers (turning them into strings the characters)

  * `int min` Check the minimum of characters or elements
  * `bool required`  If set it reports an error in case the field is not present
  * `int lenght`check that the length is exactly the same

#### Example JsonNote

an example to understand JsonNote

```dart
import "package:jsonable/jsonable.dart";

class Person extends Jsonable {
  String name;
  @JsonNote(keyName: "SURNAME")
  String surname;
  @JsonNote(exclude: true)
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  print([p.name, p.surname, p.date]);
  p.surname = "Spina!";
  print(p.toJson());
}

```

outputs:

```
[Nico, null, null]
{"name":"Nico","SURNAME":"Spina!"}
```

#### Example JsonValidator

an example to understand JsonValidator

```dart
import 'package:jsonable/jsonable.dart';

class Person extends Jsonable {
  @JsonValidator(min: 3, max: 10, required: true)
  String name;
  @JsonValidator(min: 4, max: 20, required: true)
  String surname;
  @JsonValidator(required: true)
  String date;
}

main() {
  var p = Person();
  p.fromJson("""{"name": "Nico", "surname": "Spina"}""");
  var report = validate(p);
  print(report.toMap());
}

```

outputs 

```
{errors: [Error date is required field.], error: true}
```





# Roadmap

* Add the "indent" parameter in the jsonable function
* Write more tests to make it more solid
* add more tests in `JsonValidator`
* 





### Conclusion

If you want you can support the development by offering me a beer: [paypal](https://www.paypal.com/donate/?token=vm8zFQO-fdND2nUoQj1Qlasgv_-HBXfWnCPrQByr004Dhj5jc2AeBesdxe9AVcIiPYlezG&country.x=IT&locale.x=IT)

If you can't buy beer, you can always leave me a star on [github](https://github.com/SpinaNico/jsonable).

thanks!