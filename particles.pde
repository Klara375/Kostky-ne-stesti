class Particles {
  PVector location;
  PVector velocity;
  PImage diaImage;
  PImage octupleImage;

  Particles() {
    velocity = new PVector(random(-1, 1), random(5, 15));
    location = new PVector(random(20, width -20), random(-50, -25));
    diaImage = loadImage("dia.png");
    octupleImage = loadImage("octuple.png");
  }

  void run() {
    update();
    display();
    if (isDead()) {
      location.x = (random(20, width-20));
      location.y = random(-50, -25);
    }
    smooth();
  }
  void update() {
    location.add(velocity);
  }

  void display() {
    if (difficultyHard) {
      octupleImage.resize(0, 55);
      image(octupleImage, location.x, location.y);
    } else if (difficultyEasy) {
      diaImage.resize(0, 35);
      image(diaImage, location.x, location.y);
    }
  }

  boolean isDead() {
    if (location.y > height + 25) {
      return true;
    } else {
      return false;                                    
  }
  }
}
