Zoomer[] Zoomers = new Zoomer[2000];

void setup() {
  size(750, 750, P3D);
  rectMode(CENTER);
  textAlign(CENTER);
  noStroke();
  background(0);
  for (int i = 0; i < Zoomers.length; i++) {
    Zoomers[i] = Rand.num(10, 0) < 0.25 ? new Floater() : new Zoomer();
  }
}

void draw() {
  background(0);
  rotateX(degrees(90));
  for (Zoomer p : Zoomers) {
    p.move();
    p.show();
  }
}

static class Rand {
  static float num(float max, float min) {
    return (float) Math.random() * max + min;
  }
}

class Zoomer {
  float x, y, z;
  float vY;
  float angle;
  int shape;
  color rgb;
  int size;

  Zoomer() {
    x = Rand.num(1500, -750);
    y = Rand.num(1500, -750);
    z = Rand.num(1500, -750);
    vY = Rand.num(10, 3);
    rgb = color(100, 255, 100, Rand.num(256, 100));
    angle = Rand.num(360, 0);
    shape = (int) Rand.num(2, 0);
    size = 30;
  }

  float vX() {
    return Rand.num(4, -2);
  }

  float vZ() {
    return vX();
  }

  void move() {
    if (y < -500) {
      y = Rand.num(600, 0);
    }
    y -= mousePressed ? vY * 2 : vY;
  }

  void show() {
    pushMatrix();
    translate(0, 0, z);
    fill(rgb);
    textSize(size);
    text(shape, x, y);
    popMatrix();
  }
}

class Floater extends Zoomer {
  Floater() {
    super();
    rgb = color(255, 100, 100, Rand.num(256, 100));
    size = 100;
  }

  void show() {
    pushMatrix();
    rotateX(90);
    super.show();
    popMatrix();
  }
}
