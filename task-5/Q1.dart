// parent class
class Vehicle {
  //attrubits
  int _cylcapacity;
  int _maxspeed;
  String _engineType;
  int _model;
  String _manufactor;
  double _price;

  //constructor
  Vehicle(
    this._cylcapacity,
    this._maxspeed,
    this._engineType,
    this._model,
    this._manufactor,
    this._price,
  );

  //get methods
  int get cylcapacity => _cylcapacity;
  int get maxspeed => _maxspeed;
  String get engineType => _engineType;
  int get model => _model;
  String get manufactor => _manufactor;
  double get price => _price;

  // set methods
  set cylcapacity(int value) => _cylcapacity = value;
  set maxspeed(int value) => _maxspeed = value;
  set engineType(String value) => _engineType = value;
  set model(int value) => _model = value;
  set manufactor(String value) => _manufactor = value;
  set price(double value) => _price = value;

  //print method
  void printInfo() {
    print("Cylinder Capacity: $cylcapacity");
    print("Max Speed: $maxspeed km/h");
    print("Engine Type: $engineType");
    print("Model Year: $model");
    print("Manufacturer: $manufactor");
    print("Price: $price le");
    print(
      "___________________________________________________________________________________",
    );
  }
}
//sub classes

//car
class Car extends Vehicle {
  //car specific attributs
  String _transmissionType;
  int _numofpassengers;

  //car constructor
  Car(
    int cc,
    int speed,
    String engine,
    int model,
    String manufactor,
    double price,
    this._transmissionType,
    this._numofpassengers,
  ) : super(cc, speed, engine, model, manufactor, price);

  //car getter
  String get transmissionType => _transmissionType;
  int get numofpassengers => numofpassengers;

  //car setter
  set transmissionType(String type) {
    _transmissionType = type;
  }

  set numofpassenger(int num) {
    _numofpassengers = num;
  }

  //print methode
  @override
  void printInfo() {
    print("Car information: \n");
    super.printInfo();
    print("transmissionType $_transmissionType");
    print("numofpassengers $_numofpassengers");
    print(
      "_______________________________________________________________________________",
    );
  }
}

//truck

class Truck extends Vehicle {
  //the only special attribute
  int _loadcapacity;

  //truck class

  Truck(
    int cc,
    int speed,
    String engine,
    int model,
    String manufactor,
    double price,
    this._loadcapacity,
  ) : super(cc, speed, engine, model, manufactor, price);

  //truck getter
  int get loadcapacity => _loadcapacity;

  //truck setter
  set loadcapacity(int value) {
    _loadcapacity = value;
  }

  @override
  void printInfo() {
    print("Truck information: \n");
    super.printInfo();
    print("loadcapacity $_loadcapacity");
    print(
      "_________________________________________________________________________________",
    );
  }
}

//motorcycle class
class Motorcycle extends Vehicle {
  int _numoftires;
  bool _sidecar;

  Motorcycle(
    int cc,
    int speed,
    String engine,
    int model,
    String manufactor,
    double price,
    this._numoftires,
    this._sidecar,
  ) : super(cc, speed, engine, model, manufactor, price);

  int get numoftries => _numoftires;
  bool get sidecar => _sidecar;

  set tires(int num) {
    _numoftires = num;
  }

  set sidecar(bool value) {
    _sidecar = value;
  }

  @override
  void printInfo() {
    print("Motorcycle information: \n");
    super.printInfo();
    print("Number of tires: $_numoftires");
    print("Has Sidecar: ${_sidecar ? "Yes" : "No"}");
    print("__________________________________________________________________");
  }
}

void main() {
  //Create two cars
  List<Car> cars = [
    Car(1600, 215, "Gasoline", 2023, "Peugeot", 1250000, "Automatic", 5),
    Car(1800, 244, "Hybrid", 2022, "BMW", 2350000, "Automatic", 5),
  ];

  // 2. Create two trucks
  List<Truck> trucks = [
    Truck(2000, 170, "Diesel", 2015, "Chevrolet", 1215000, 2000),
    Truck(1800, 150, "Diesel", 2024, "Daihatsu", 1720000, 1250),
  ];

  //Create two motorcycles
  List<Motorcycle> motorcycles = [
    Motorcycle(750, 110, "Electric", 2011, "Suzuki", 116000, 3, true),
    Motorcycle(1400, 200, "Gasoline", 2021, "Honda", 1040500, 2, false),
  ];

  //comparing fastest car
  Car fastestcar = cars[0];
  for (int i = 1; i < cars.length; i++) {
    if (cars[i]._maxspeed > fastestcar._maxspeed) {
      fastestcar = cars[i];
    }
  }
  fastestcar.printInfo();

  //comparing heavy truck
  Truck heavttryck = trucks[0];
  for (int i = 0; i < trucks.length; i++) {
    if (trucks[i]._loadcapacity > heavttryck._loadcapacity) {
      heavttryck = trucks[i];
    }
  }
  heavttryck.printInfo();

  //comparing cheapest motorcycle
  Motorcycle cheapest = motorcycles[0];
  for (int i = 0; i < motorcycles.length; i++) {
    if (motorcycles[i]._price < cheapest._price) {
      cheapest = motorcycles[i];
    }
  }
  cheapest.printInfo();
}
