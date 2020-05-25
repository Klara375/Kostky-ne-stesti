class Faller {
  PVector location;                        //zavedení vektorů
  PVector velocity;
  PVector acceleration;

  PImage SlevaImage;                       //zavedení obrázku
  float topspeed;                          //zavedení maximální rychlosti
  int d;                                   //zavedení proměnné pro velikost
  boolean isCatched;                       //zavedení proměnné, která určuje, jestli hráč kostku chytil


  Faller() {
    location = new PVector(random (20, width), random (0, 80));       //nastavení původní lokace
    velocity = new PVector(0, 5);                                     //nastavení rychlosti

    SlevaImage = loadImage("kostkaF.png");                            //načtení obrázku
    topspeed = 4;
    d = 70;
    isCatched = false;
  }

  void run() {                                                        //zabalení funkcí do jedné funkce - čistě jen pro zjednodušení kódu
    display();
    update();
    fall(gejmr);
    catche(gejmr);
  }

  void display() {                                                    //zobrazení obrázku
    imageMode(CENTER);
    SlevaImage.resize(0, d);
    image(SlevaImage, location.x, location.y); 
    //circle(location.x, location.y, d);
  }

  void update() {                                                     //pohyb
    acceleration = new PVector(gejmr.x - location.x, 0);              //zrychlení směrem od hráče
    acceleration.normalize();                                         //normalizace vektoru
    acceleration.mult(0.027);                                         //zmenšení zrychlení
    velocity.sub(acceleration);                                       //přidání zrychlení k rychlosti
    velocity.limit(topspeed);                                         //limitování maximální rychlosti
    location.add(velocity);                                           //přičtení rychlosti k lokaci
  }

  void fall(Player gejmr) {                      
    if (isCatched) {                                                 //když hráč kostku chytí, zůstane na statických souřadnicích
      location.x = gejmr.x + 1.7*gejmr.d;
      location.y = height - 1.2*gejmr.ee;
    }
    location.add(velocity);                                          //jinak se pohybuje - k souřadnicím se přičítá rychlost
  }

  boolean landed() {                                                 //určení, jestli se nachází pod oknem
    if (location.y>height) return true;
    else return false;
  }

  void reset() {                                                     //resetování rychlosti a lokace
    velocity = new PVector(0, 4);
    location.x = (int) random(20, width - 20);
    location.y = (int) random(-50, 150);
    isCatched = false;
  }

  void catche(Player gejmr) {                                        //porovnání souřadnic kostky a hráče
    boolean isInside = (gejmr.x - d < location.x && gejmr.x + d > location.x );
    boolean isTouching = location.y > height - 5*gejmr.d;

    if (isInside && isTouching) isCatched = true;                    //když hráč chytí kostku, isCatched = true
  }
}
