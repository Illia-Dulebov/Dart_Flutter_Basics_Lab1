//Main test class
class MyClass {
  int x, y;
  int? _z;
  MyClass(this.x, this.y, this._z);
  MyClass.initNumbers(this.x, {this.y = 10, z = 15}) {
    _z = z;
  }

  factory MyClass.stateConstruct(x, g, [state = 0]) {
    return state == 0 ? TestClass.initSomeNum(x, g) : MyClass.initNumbers(x);
  }

  void addFuncX(int value) => print('Sum of numbers: ${this.x + value}');
  void multipleFuncX(int value) => print('Prod of numbers:${this.x * value}');

  int? get zValue => this._z;
  set zValue(value) => _z = value;

  @override
  String toString() => 'Obj has: [x=${this.x},y=${this.y}, z=${this._z}]';
}

//Secondary Class
class TestClass extends MyClass {
  int? g;

  TestClass.initSomeNum(int x, int g) : super.initNumbers(x);
}

//Interface with test classes
class Person {
  String? name;

  Person(this.name);

  void display() {
    print('Person`s name: ' + name!);
  }
}

class Worker implements Person {
  String? name;

  void display() {
    print('Workers`s name: ' + name!);
  }
}

//Mixin
mixin SomeStuff {
  int k = 8;
  double del(int a, int b) => a / b;
}

class MixinClass with SomeStuff {
  double del(int a, int b) => a / b + 12;
  void display() => print(k);
}

//Closure function
Function addString(String some) {
  return (String sentence) => sentence + some;
}

//Functions parametrs test
int someFunc(a, [b, c = 5]) {
  return a + b + c;
}

void main(List<String> arguments) {
  //var obj = new MyClass(1, 2);
  var obj1 = new MyClass.initNumbers(1, y: 2);
  print(obj1);

//Operator is
  if (obj1 is MyClass) {
    print('obj1 is MyClass type');
  }

//Operator ??=
  int? a;
  a ??= 3;
  print('variable a: ${a}');

//Operator ? - ternary operator
  var c = (a >= 10) ? a : 5;
  print(c);

//Object`s methods calling with ..method()
  obj1
    ..multipleFuncX(5)
    ..addFuncX(3);

//Closure test
  var addStr = addString('abcd');
  print('String Concat: ' + addStr('efgh'));

//Functions parametrs
  print('Result of some param func: ${someFunc(3, 7)}');
  print('Result of some param func: ${someFunc(5, 4, 10)}');

//Factory check
  var test1 = MyClass.stateConstruct(3, 2, 1);
  var test2 = MyClass.stateConstruct(7, 2);
  print(test2 is TestClass);

//Interface check
  Person Artem = Worker();
  Artem.name = 'Artem';
  Artem.display();

//Mixin
  var del1 = MixinClass();
  print(del1.del(2, 3));
  del1.display();

//List Set Map
  var list = [1, 2, 3];
  var listConcat = [...list, 6, 7, if (a < 5) 8, for (var i in list) i];
  var set = <String>{'a', 'b', 'c'};
  var map = {'one': 1, 'two': 2, 'three': 3};
  map['five'] = 5;

  list.add(3);
  list.addAll([4, 5]);

  print(listConcat);
  print(list);

//where()
  var find = list.where((func) => func > 1);
  print(find);

//foreach
  map.forEach((key, value) => print('${key}: ${value}'));

//Generic types
  var mixList = <Object>[1, 'a', 2.4];
  print(mixList);
}
