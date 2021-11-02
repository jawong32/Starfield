Zoomer[] Zoomers = new Zoomer[2000];

void setup() {
  size(750, 750, P3D);
  rectMode(CENTER);
  noStroke();
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
  int shape, size;
  color rgb;

  Zoomer() {
    x = Rand.num(1500, -750);
    y = Rand.num(1500, -750);
    z = Rand.num(1500, -750);
    vY = Rand.num(10, 3);
    shape = (int) Rand.num(2, 0);
    size = 30;
    rgb = color(100, 255, 100, Rand.num(256, 100));
  }

  float vX() {
    return Rand.num(4, -2);
  }

  float vZ() {
    return vX();
  }

  void move() {
    if (y < -700) {
      y = Rand.num(600, 0);
    }
    y -= mousePressed ? vY * 2 : vY;
  }

  void show() {
    pushMatrix();
    translate(0, 0, z);
    fill(rgb);
    rect(x, y, size, size);
    popMatrix();
  }
}

class Floater extends Zoomer {
  float sizeX, sizeY, driftX, driftY;
  Floater() {
    super();
    vY = Rand.num(6, 1);
    rgb = color(255, 100, 100, Rand.num(256, 100));
    size = 60;
    sizeX = size;
    sizeY = size;
    driftX = Rand.num(50, size);
    driftY = Rand.num(50, size);
  }

  void move() {
    super.move();
    sizeX += sizeX < driftX ? Rand.num(1, 0) : Rand.num(0, -1);
    sizeY += sizeY < driftY ? Rand.num(1, 0) : Rand.num(0, -1);

    if (sizeX > driftX) {
      driftX = size;
    }

    if (sizeY > driftY) {
      driftY = size;
    }

    if (sizeX < size) {
      driftX = Rand.num(50, size);
    }

    if (sizeY < size) {
      driftY = Rand.num(50, size);
    }
  }

  void show() {
    pushMatrix();
    translate(0, 0, z);
    fill(rgb);
    rotateX(degrees(-90));
    ellipse(x, y, sizeX, sizeY);
    popMatrix();
  }
}
