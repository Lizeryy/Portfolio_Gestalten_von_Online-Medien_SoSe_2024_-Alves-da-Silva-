ArrayList<Particle> particles = new ArrayList<Particle>(); //array particles

void setup() {
  size(800, 800);
}

void draw() {
  background(0);
  
  //schleife zum adden von neuen particles
  for (int i = 0; i < 5; i++) { //5 pro frame adden
    particles.add(new Particle(mouseX, mouseY));
  }
  
  // alle particles die nicht aufm screen sind despawnen damit es net laggt
  for (int i = particles.size() - 1; i >= 0; i--) {
    Particle p = particles.get(i); //hol particle mit index i
    p.update(); //updates alle informationen vom particle
    p.display(); //zeigt die partikel an
    if (p.isOffScreen()) { //falls off screen -> weg
      particles.remove(i);
    }
  }
}

class Particle { //partikel klasse mit allen eigenschaften
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float radius;
  color particleColor;

  Particle(float x, float y) {
    position = new PVector(x, y); //mouse koordinaten synchro
    velocity = PVector.random2D().mult(random(1, 3)); // random speed in random direction
    acceleration = new PVector();
    lifespan = 255; //wie lange leben sie
    radius = random(10, 20);
    particleColor = color(random(100, 255), 0, random(100, 255)); // lila - blau - pink
  }

  void update() { //geschwindigkeit und velocity soll kleiner werden
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    lifespan -= 2.0; // lifespan wird immer kleiner mit der zeit
  }

  void display() {
    fill(particleColor, lifespan); // kleinere lifespan = fade
    noStroke();
    ellipse(position.x, position.y, radius, radius); // radius fuer die groesse der elipse
  }

  boolean isOffScreen() {
    return (position.x < 0 || position.x > width || position.y < 0 || position.y > height || lifespan <= 0); //guckt ob der partikel off screen ist oder schon tot
  }
}
