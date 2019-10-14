### 0.0.2+2

* add JType operator "<<" for set value internal Jtype  and operator ">>" for get value internal Jtype
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