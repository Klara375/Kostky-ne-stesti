class Settings {
  PImage StromImage;                                       //zavedení obrázků
  PImage PedroStromImage;
  boolean uvod;
  PImage uvodImage;
  PImage kostkaImage;
  PImage logoImage;

  Settings() {
    StromImage = loadImage("stromek.png");                 //načtení obrázků
    PedroStromImage = loadImage("stromPedro.png");
    uvodImage = loadImage("uvodIMG.png");
    kostkaImage = loadImage("kostkaF.png");
    logoImage = loadImage("logo.png");
    uvod = true;
  }

  void menu() {
    background(10, 170, 230);                              //Úvodní pozadí a text
    imageMode(CORNER);
    uvodImage.resize(0, 480);
    image(uvodImage, 85, 235);
    logoImage.resize(0, 175);
    image(logoImage, 250, -10);
    textSize(70);
    text(" vs Chance Cubes", 510, 105);
    fill(#004983);
    textSize(33);
    text("                 Sesbírej potřebné Cuby na sestavení Giant Chance Cuby."+ " \n" + "                         Dej si ale pozor, některé mohou být zákeřné!", 25, 185);
    textSize(22);
    fill(255);
    text("Obtížnost:", 60, 400);
    if (difficultyHard) {
      text("těžká", 175, 400);
    } else if (difficultyEasy) {
      text("snadná", 175, 400);
    } else {
      text("peaceful", 175, 400);
    }
    text("Pro změnu obtížnosti stiskni 0/1/2", 60, 430);
    textSize(25);
    fill(#004983);
    text("Ovládání", 840, 470);
    stroke(#2F23E8);
    line(710, 479, 1150, 479);
    stroke(0);
    text("a                    pohyb vlevo", 720, 503);
    text("d                    pohyb vpravo", 720, 538);
    text("s                    zastavení pohybu", 720, 573);
    text("space             restart hry  ", 720, 608);
    text("p                    pauza - zobrazí menu", 720, 643);
    text("enter              start - skryje menu", 720, 680);
    fill(255);
  }


  void display() {                                                    //zobrazení obrázků ve hře
    fill(#2E8E14);
    rect(0, height-15, width, height);
    fill(255);
    imageMode(CORNER);
    StromImage.resize(0, 450);
    image(StromImage, 850, 260);

    PedroStromImage.resize(0, 450);
    image(PedroStromImage, 150, 260);

    kostkaImage.resize(0, 45);
    image(kostkaImage, 1165, 17);

    textSize(90);                                                    //informativní texty ve hře
    text("Kostky (ne)štěstí", 280, 135);
    textSize(25);
    fill(#004983);
    text("space - restart", 300, 50);
    text("p - pauza", 820, 50);
  }

  void bill() {                                                       //skóre
    fill(255);
    textSize(20);
    text(skore, 1145, 50);
    fill(255);
  }
}
