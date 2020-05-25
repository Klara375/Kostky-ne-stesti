class WinScrean {
  int d = 100;                              //zavedení proměnné pro zobrazení hráče
  int xSpeed = 4;
  int x = gejmr.x;                          //x-ová souřadnice hráče
  int ximg;
  float ee = 1.5*d;
  float ex = 2.5*d; 
  PImage BigHeadRImage;
  PImage BigHeadLImage;
  PImage CobbleImage;

  WinScrean() {
    BigHeadRImage = loadImage("BhlavaR.png");
    BigHeadLImage = loadImage("BhlavaL.png");
    CobbleImage = loadImage("Cobble.png");
  }
  void run() {                                 //obrazovka, která se zobrazí, když hráč vyhraje
    background(10, 170, 230);                  //barva pozadí
    textSize(25);
    if (difficultyHard) {
      text("COBBLESTONE WINNER!", width/2 - 115, 75);                          //a text
    } else {
      text("WINNER!", width/2 - 50, 75);
    }
    fill(#004983);
    textSize(25);
    text("space - restart", 300, 50);
    text("p - menu", 820, 50);
    fill(255);
    ximg = x;
  }
  void player() {                            
    display();
    key();
    if (difficultyHard) {
      imageMode(CENTER);
      CobbleImage.resize(0, d);
      image(CobbleImage, ximg + 1.2*d, height - ee);
    }
    border();
  }

  void display() {                          //zobrazení hráče
    strokeWeight(7);
    line (x, height - 3.1*d, x, height - d);
    line (x, height - ex, x + d, height - ee);
    line (x, height - ex, x - d, height - ee);
    line (x, height - d, x + 0.75*d, height);
    line (x, height - d, x - 0.75*d, height);
    strokeWeight(1);
  }

  void key() {                              //pohyb hráče + zobrazení obrázku hlavy
    if (key == 'a') {
      x -= xSpeed;
      imageMode(CENTER);
      BigHeadLImage.resize(0, 3*d);
      image(BigHeadLImage, ximg, height - 4.2*d);
    }
    if (key == 'd') {
      x += xSpeed;
      BigHeadRImage.resize(0, 3*d);
      image(BigHeadRImage, ximg, height - 4.2*d);
    } else {
      BigHeadLImage.resize(0, 3*d);
      image(BigHeadLImage, ximg, height - 4.2*d);
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
    if (x<d+20) x=d+20;
    if (x>width-d-20) x=width-d-20;
  }
}
