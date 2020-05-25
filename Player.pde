class Player {
  int d = 30;                                //zavedení proměnné pro zobrazení hráče
  int xSpeed = 6;
  int x = width/2;                           //x-ová souřadnice hráče
  int ximg;
  float ee = 1.5*d;
  float ex = 2.5*d;
  PImage HeadLImage;                         //zavedení obrázků
  PImage HeadRImage;


  Player() {
    HeadLImage = loadImage("hlavaL.png");    //načtení obrázků
    HeadRImage = loadImage("hlavaR.png");
  }
  void run() {                               //funkce, která spustí hráče - spuštění tří funkcí najednou, aaby byl kód v hlavní části přehlednější
    display();
    key();
    border();
  }

  void display() {                          //zobrazení hráče
    //circle(x, height - 3.5*d, d+5);
    strokeWeight(2);
    line (x, height - 3.1*d, x, height - d);
    line (x, height - ex, x + d, height - ee);
    line (x, height - ex, x - d, height - ee);
    line (x, height - d, x + 0.75*d, height);
    line (x, height - d, x - 0.75*d, height);
    strokeWeight(1);
    ximg = x;
  }

  void key() {                               //pohyb hráče + zobrazení obrázku hlavy směrem, kterým se pohybuje
    if (key == 'a') {
      x -= xSpeed;
      imageMode(CENTER);
      HeadLImage.resize(0, 3*d);
      image(HeadLImage, ximg, height - 4.2*d);
    }
    if (key == 'd') {
      x += xSpeed;
      imageMode(CENTER);
      HeadRImage.resize(0, 3*d);
      image(HeadRImage, ximg, height - 4.2*d);
    } else {
      imageMode(CENTER);
      HeadLImage.resize(0, 3*d);
      image(HeadLImage, ximg, height - 4.2*d);
    }
    if (keyPressed) {
      if (key == 'w') {
        ee = 3*d;
        ex = 2*d - d/6;
      }
      if (key == 's') {
        ee = 1.5*d;
        ex = 2.5*d;
      }
    }
  }

  void border() {                            //nastavení hranice, aby hráč nemohl mimo okno
    if (x<d+10) x=d+10;
    if (x>width-d-10) x=width-d-10;
  }
}
