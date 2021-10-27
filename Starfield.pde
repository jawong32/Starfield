Particle[] particles = new Particle[2000];

void setup() {
  size(750, 750, P3D);
  rectMode(CENTER);
  noStroke();
  background(0);
  for (int i = 0; i < particles.length; i++) {
    particles[i] = new Particle();
  }
}

void draw() {
  background(0);
  rotateX(degrees(90));
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
    x = Rand.num(1500, -750);
    y = Rand.num(1500, -750);
    z = Rand.num(1500, -750);

    vY = Rand.num(10, 3);

    rgb = color(Rand.num(256, 0), Rand.num(256, 0), Rand.num(256, 0));

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

class OddballParticle {
}
