class Kure {
  PImage chickenImage;
  float x = width/2;
  float y = 50;
  float xSpeed = 0.25;
  float ySpeed = 0.15;
  int d = 150;

  Kure() {
    chickenImage = loadImage ("kure.png");
  }

  void run() {
    smooth();
    move();
    display();
    border();
  }

  void move() {
    x += xSpeed;
    y += ySpeed;
  }
  void display() {
    imageMode(CENTER);
    chickenImage.resize(0, d);
    image(chickenImage, x, y);
  }

  void border() {
    if (x > width || x < 0) {
      xSpeed = xSpeed *-1;
    }
    if (y > height || y < 0) {
      ySpeed = ySpeed *-1;
    }
  }
}
