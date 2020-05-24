class Enemy {
  PVector location;                  //zavedení vektorů
  PVector velocity;
  PVector acceleration;

  PImage EnemyLImage;                //zavedení obrázků
  PImage EnemyRImage;
  PImage DeathImage;
  PImage TNTImage;
  PImage WitherImage;
  int d;                             //zavedení proměnné pro velikost nepřítele
  float topspeed;                    //zavedení maximální rychlosti
  boolean failed;                    //zavedení proměnné, která určuje, jestli nepřítel srazil hráče nebo ne

  Enemy() {
    location = new PVector(random (0, width), 0);    //nastavení původní lokace nepřítele
    velocity = new PVector(0, 5);    //nastavení rychlosti
    EnemyLImage = loadImage("kostkaE.png");    //načtení obrázků
    EnemyRImage = loadImage("kostkaER.png");
    DeathImage = loadImage("death.png");
    TNTImage = loadImage("TNT.png");
    WitherImage = loadImage("wither.png");
    d = 85;
    topspeed = 4;
    failed = false;
  }
  void run() {              //zabalení tří funkcí do jedné funkce - pro zjednodušení kódu
    update(gejmr);
    display(gejmr);
    fall(gejmr);
  }

  void update(Player gejmr) {                              //pohyb
    acceleration = new PVector(gejmr.x - location.x, 0);     //zrychlení směrem ke hráčovi
    acceleration.normalize();                                 //normalizace vektoru
    acceleration.mult(0.035);                                  //zmenšení zrychlení
    velocity.add(acceleration);                               //přidání zrychlení k rychlosti
    velocity.limit(topspeed);                                 //limitování maximální rychlosti
    location.add(velocity);                                   //přičtení rychlosti k lokaci
  }

  void display(Player gejmr) {                               //zobrazení obrázku
    if (gejmr.x - location.x<0) {                            //otočení obrázku směrem k hráči
      imageMode(CENTER);
      EnemyLImage.resize(0, d);
      image(EnemyLImage, location.x, location.y);
    } else {
      imageMode(CENTER);
      EnemyRImage.resize(0, d);
      image(EnemyRImage, location.x, location.y); 
      //fill(0);
      //circle(location.x, location.y, d*0.8);
      //fill(255);
    }
  }

  void fall(Player gejmr) {
    if (failed) {                                  //když nepřítel narazí do hráče, zůstane na statických souřadnicích
      location.x = gejmr.x;
      location.y = height - 3*gejmr.d;
    } else location.add(velocity);                 //jinak se pohybuje - k souřadnicím se přičítá rychlost
  }

  boolean landed() {                               //určení, jestli se nachází pod oknem
    if (location.y > height+20) return true;
    else return false;
  }

  void reset() {                                   //resetování rychlosti a lokace
    velocity = new PVector(0, 4);
    location.x = (int) random(20, width - 20);
    location.y = (int) random(-50, 100);
    failed = false;
  }

  boolean hit(Player gejmr) {                            //porovnání souřadnic nepřítele a hráče
    boolean isInside = (gejmr.x - 0.9*d < location.x && gejmr.x + 0.9*d > location.x );
    boolean isTouching = location.y + 0.5*d> height - 4.5*gejmr.d;

    if (isInside && isTouching)return true;                 //když nepřítel narazí do hráče, hit = true
    else return false;
  }

  void fail() {
    for (int i = 0; i < pocetEnemy; i++) {
      if (unluckyCube[i].hit(gejmr)) {                      //když nepřítel narazí do hráče, spustí se "failScreen"
        background(0);                              //obsahuje spoustu textu a obrázky
        fill(255);
        textSize(35);
        text("'The chance of this cube was destruction... Probably'", 170, 100);
        textSize(60);
        text(" BUM!"+ " \n" +" BÁC!", width/2-100, height/2-110);
        text("  KONEC HRY" + " \n" + "Zkus to znovu" + " \n" + "      :( :( :(", width/2-205, height/2+70);
        fill(#004983);
        textSize(25);
        text("space - restart", 325, height - 50);
        text("p - menu", 750, height - 50);
        unluckyCube[i].failed = true;
        imageMode(CORNERS);
        DeathImage.resize(0, 380);
        image(DeathImage, width-430, height-350);
        TNTImage.resize(0, 300);
        image(TNTImage, 70, 330);
        image(TNTImage, 790, 145);
        WitherImage.resize(0, 300);
        image(WitherImage, 185, 93);
        skore = -1;
      }
    }
  }
}
