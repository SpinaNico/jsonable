# Jsonable (v0.0.2)

to install:

```yaml
dependencies:
  jsonable: ^0.0.2
```

## what is Jsonable?

if you are interested in Jsoable with reflect [read here](./WithReflect.md)

Jsonable is a library that deals with offering a simple way to manage dart classes fromJson and toJson, allowing the transpiration from dart to json.
One of the main objectives and the philosophy of Jsoanble, is to remove the generated code making any object convertible into Json.

In the first version of Jsonable reflection was used, but this is not supported in the AOT compiler of dart.

**Jsonable does not use reflection or even generated code.**

## how to use?

Jsonable makes available a mixin `mixin Jsonable` within this mixin is the management of the Json scheme.
only by extending our class with the mixin, the class gets the necessary methods, but if we don't indicate the members of json, using "toJson" or "toMap" will be an empty Map / string. ({})

let's see an example:

```dart
import "package:jsonable/jsonable.dart";

class Person with Jsonable {
  Jstring name;
  Jstring surname;
  Person({String name, String surname}) {
    this.name = this.jString("name", initialValue: name);
    this.surname = this.jString("surname", initialValue: surname);
  }
}

main() {
  var p = Person(name: "Nico", surname: "Spina");
  print(p.toJson());
  // output: {"name":"Nico","surname":"Spina"}
}
```

