Particle[] particles = new Particle[100];

void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
  noStroke();
  background(0);
  for (int i = 0; i < 100; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  background(0);
  rotateY(45);
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
  float vX, vY;

  Particle() {
    x = Rand.num(1000, -500);
    y = Rand.num(600, -300);
    z = Rand.num(300, -100);

    vY = Rand.num(10, 3);
  }

  void move() {
    if (y > 500) {
      y = Rand.num(0, -100);
    }
    y += vY;
    x += Rand.num(6, -3);
  }

  void show() {
    pushMatrix();
    translate(0, 0, z);
    rect(x, y, 20, 20);
    popMatrix();
  }
}

class OddballParticle {
}
