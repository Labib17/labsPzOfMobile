//Work with getters and setters
class Person {
  String name;
  int birthYear;

  bool get isAdult => (DateTime.now().year - birthYear) > 18;

  int get age => (DateTime.now().year - birthYear);
  set age(int val) => birthYear = (DateTime.now().year - val);

  Person(this.name, this.birthYear);
}

//Closure
//Default parameter
Function zamykannya(num n, {num a = 10}) {
  return (int m) => n * m / a;
}
//Factory constructor
class Smart {
  String name;
  static Smart phone = Smart.fromName("Samsung");

  Smart.fromName(this.name);

  factory Smart(String name) {
    if (phone.name == name) {
      phone = Smart.fromName(name);
      print("Людина купила смартфон компанії $name");
    } else {
      print("Людина купила смартфон компанії ${phone.name} ");
    }
    return phone;
  }
  void about() {
    print("Купівля");
  }
}

class Dog {
  String namedog;
  Dog(this.namedog);
  void drink() {
    print("${namedog} drinks water");
  }
}

class Cat {
  String NameOfCat = "";
  void drinkcat() {
    print(" ${NameOfCat} drinks milk");
  }
}

//Mixins
class Animal extends Dog with Cat {
  Animal(name1, name2) : super(name1) {
    NameOfCat = name2;
  }
}



//Not mandatory parameter and syntactic sugar usage
void showName(String name, [String  surname]){
  print("----------");
  print(name);
  print (surname ?? "No surname provided") ;
  
}


void main() {
  Person person1 = Person('Labib', 2001);
  print(
      'Hello ${person1.name}, you was born in ${person1.birthYear}, you are ${person1.isAdult ? 'adult' : 'not adult'}');

  Person person2 = Person('Georgiy', 1996);
  print(
      'Hello ${person2.name}, you was born in ${person2.birthYear}, you are ${person2.isAdult ? 'adult' : 'not adult'}');

  Person person3 = Person('Maxym', 2012);

  //check how setter work
  print(person3.birthYear);
  person3.age = 8;
  print(person3.birthYear);

  double a = 25;
  var b = 6.0;
  
  //syntactic sugar
  double res = a ?? b; 
  print(res);

  var c = 8;
  a = b * c / 2;
  var resultat =
      a > c ? "number greater than ${c}" : " number lesser than ${c}";
  print(resultat);

  int lambdafunction(var a) => (a + 1);

  for (int i = 0; i < 5; i++) {
    print('${i} element: ${lambdafunction(i)}');
    print('\n');
  }

  int result1 = zamykannya(20)(7);
  print(result1);

  Smart telephon1 = Smart("Samsung");
  telephon1.about();

  int factorial(int n) {
    int result = 1;

    for (int i = 1; i <= n; ++i) {
      result *= i;
    }
    //Usage of asserts
    assert(result > 0); 

    return result;
  }

  var s = factorial(8);
  print('s= ${s}\n');

  //Work with collection
  var numbersAndPhones = {1: "Samsung", 2: "Apple", 3: "LG"};
  numbersAndPhones[4] = "BlackBerry";
  for (int i = 1; i < 5; i++) print(numbersAndPhones[i]);
  print("\n");
  
  Animal alls = Animal("Cristina", "Феликс");
  alls.drink();
  alls.drinkcat();
  
  
   showName("Danys", "Moroz");
  showName("Yana");
}
