Particle[] particles = new Particle[1000];

void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
  noStroke();
  background(0);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  background(0);
  translate(0, 0, -350);
  rotateX(degrees(-35));
  for (Particle p : particles) {
    p.move();
    p.show();
  }
  translate(0, 0, 35);
  rotateX(degrees(-10));
  for (Particle p : particles) {
    p.move();
    p.show();
  }
}

static class Rand {
  static float num(float max, float min) {
    return (float) Math.random() * max + min;
  }
}

class Particle {
  float x, y, z;
  float vY;
  float angle;
  color rgb;

  Particle() {
    x = Rand.num(1000, -500);
    y = Rand.num(800, -400);
    z = Rand.num(600, -300);

    vY = Rand.num(10, 3);

    rgb = color(Rand.num(256, 0), Rand.num(256, 0), Rand.num(256, 0));

    angle = Rand.num(360, 0);
  }

  float vX() {
    return Rand.num(6, -3);
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
    rect(x, y, 20, 20);
    popMatrix();
  }
}

class OddballParticle {
}
