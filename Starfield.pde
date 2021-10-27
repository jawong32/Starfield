Green[] Greens = new Green[2000];

void setup() {
  size(750, 750, P3D);
  rectMode(CENTER);
  noStroke();
  background(0);
  for (int i = 0; i < Greens.length; i++) {
    Greens[i] = Rand.num(10, 0) < 0.25 ? new Red() : new Green();
  }
}

void draw() {
  background(0);
  rotateX(degrees(90));
  for (Green p : Greens) {
    p.move();
    p.show();
  }
}

static class Rand {
  static float num(float max, float min) {
    return (float) Math.random() * max + min;
  }
}

class Green {
  float x, y, z;
  float vY;
  float angle;
  color rgb;

  Green() {
    x = Rand.num(1500, -750);
    y = Rand.num(1500, -750);
    z = Rand.num(1500, -750);

    vY = Rand.num(10, 3);

    //rgb = color(Rand.num(256, 0), Rand.num(256, 0), Rand.num(256, 0));
    rgb = color(100, 255, 100);

    angle = Rand.num(360, 0);
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
    y -= vY;
    x += vX();
    z += vZ();
  }

  void show() {
    pushMatrix();
    translate(0, 0, z);
    fill(rgb);
    rect(x, y, 15, 15);
    popMatrix();
  }
}

class Red extends Green {
  Red() {
    super();
    rgb = color(255, 100, 100);
  }
  
  @Override
  void show() {
    pushMatrix();
    rotateX(90);
    super.show();
    popMatrix();
  }
}
