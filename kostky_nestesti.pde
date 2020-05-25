//Pro GEJMRa
//©2020

int pocetCube = 27;      
int pocetEnemy = 2;
int pocetWin = 12;
int skore;    
boolean difficultyEasy;
boolean difficultyHard;

Player gejmr;            //zavedení class
Settings background;
Faller[] sleva = new Faller[pocetCube];
Enemy[] unluckyCube = new Enemy [pocetEnemy];
WinScrean konec;
Particles[] particles = new Particles[pocetWin];
Kure chicken;

void setup() {
  size(1260, 720);
  gejmr = new Player();
  background = new Settings();
  for (int i = 0; i < pocetCube; i++) {
    sleva[i] = new Faller();
  }
  for (int i = 0; i < pocetEnemy; i++) {
    unluckyCube[i] = new Enemy();
  }
  for (int i = 0; i < pocetWin; i++) {
    particles[i] = new Particles();
  }
  konec = new WinScrean();
  chicken = new Kure();

  difficultyEasy = false;
  difficultyHard = false;
}

void draw() {
  background(10, 170, 230);                     //barva pozadí
  skore = 0;                                    
  if (background.uvod) {                        //když úvod = true, zobrazí se menu
    background.menu();
    if (keyPressed) {
      if (key == '0') {
        difficultyEasy = false;
        difficultyHard = false;
        for (int i = 0; i < pocetCube; i++) {
          sleva[i].reset();
        }
      }
      if (key == '1') {
        difficultyEasy = true;
        difficultyHard = false;
        for (int i = 0; i < pocetCube; i++) {
          sleva[i].reset();
        }
      }
      if (key == '2') {
        difficultyHard = true;
        difficultyEasy = true;
        for (int i = 0; i < pocetCube; i++) {
          sleva[i].reset();
        }
      }
    }
  } else {                                      //jinak se spustí hra + hráč a kostky
    background.display();
    gejmr.run();
    for (int i = 0; i < pocetCube; i++) {
      sleva[i].run();
      if (sleva[i].landed()) {                                                
        sleva[i].reset();
      }
      if (sleva[i].isCatched) skore += 1;                                    
    }
    if (difficultyEasy) {
      unluckyCube[0].run();
      if (unluckyCube[0].landed()) unluckyCube[0].reset();
    }
    if (difficultyHard) {
      unluckyCube[1].run();
      if (unluckyCube[1].landed()) unluckyCube[1].reset();
    }

    background.bill();                                  
    for (int i = 0; i < pocetEnemy; i++) {
      unluckyCube[i].fail();
    }

    if (skore > 26) {                                   
      for (int i = 0; i < pocetCube; i++) {
        konec.run();
        chicken.run();
        konec.player();
      }
      for (int j = 0; j < pocetEnemy; j++) {
        unluckyCube[j].location.y = 0;                                
      }
      for (int i = 0; i < pocetWin; i++) {
        particles[i].run();
      }
    }
  }
}


void keyReleased() {
  if (key == ' ') {                                      //při stisknutí mezerníku -> reset
    for (int i = 0; i < pocetCube; i++) {
      sleva[i].reset();
    }
    if (difficultyEasy) {
      unluckyCube[0].reset();
    }
    if (difficultyHard) {
      unluckyCube[1].reset();
    }
    gejmr.d = 30;
    gejmr.ee = 1.5*gejmr.d;
    gejmr.ex = 2.5*gejmr.d;
    for (int i = 0; i < pocetWin; i++) {
      particles[i].location.x = (random(20, width-20));
      particles[i].location.y = random(-50, -25);
    }
  }
  if (keyCode == ENTER) {                                      //při stisknutí s, uvod = false -> skrytí úvodního menu
    background.uvod = false;
  }
  if (key == 'p') {                                      //při stisknutí m, uvod = true -> menu se zobrazí
    background.uvod = true;
    for (int i = 0; i < pocetWin; i++) {
      particles[i].location.x = (random(20, width-20));
      particles[i].location.y = random(-50, -25);
    }
  }
}
