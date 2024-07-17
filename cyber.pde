int numParticles = 500;


float[] x = new float[numParticles];
float[] y = new float[numParticles];
float[] xSpeed = new float[numParticles];
float[] ySpeed = new float[numParticles];
float[] hue = new float[numParticles];
float[] saturation = new float[numParticles];
float[] brightness = new float[numParticles];
float[] alpha = new float[numParticles];
float[] size = new float[numParticles];

void setup() {
  size(800, 800);
  colorMode(HSB, 60, 100, 100, 100); //Farbe 
  smooth();
  noStroke();
  
  for (int i = 0; i < numParticles; i++) {
    x[i] = random(width);
    y[i] = random(height);
    xSpeed[i] = random(-2, 2);
    ySpeed[i] = random(-2, 2);
    hue[i] = random(200, 260);
    saturation[i] = random(50, 100);
    brightness[i] = random(50, 100);
    alpha[i] = random(50, 100);
    size[i] = random(1, 5);
  }
}

void draw() {
 
  fill(0, 0, 0, 20);
  rect(0, 0, width, height);
 
  for (int i = 0; i < numParticles; i++) {
   
    x[i] += xSpeed[i];
    y[i] += ySpeed[i];
    
    // Rand
    if (x[i] < 0 || x[i] > width) xSpeed[i] *= -1;
    if (y[i] < 0 || y[i] > height) ySpeed[i] *= -1;
    
  
    fill(hue[i], saturation[i], brightness[i], alpha[i]);
   
    ellipse(x[i], y[i], size[i], size[i]);
    
   
    hue[i] = (hue[i] + random(-1, 1)) % 360;
    
    //maus nähe
    float distanceToMouse = dist(mouseX, mouseY, x[i], y[i]);
    if (distanceToMouse < 100) {
      hue[i] = random(360);
      saturation[i] = random(50, 100);
      brightness[i] = random(50, 100);
      alpha[i] = random(50, 100);
    }
  }
  
  //linien zwischen partikeln
  for (int i = 0; i < numParticles; i++) {
    for (int j = i + 1; j < numParticles; j++) {
      float distance = dist(x[i], y[i], x[j], y[j]);
      if (distance < 100) {
        stroke(hue[i], saturation[i], brightness[i], map(distance, 0, 100, 100, 0));
        line(x[i], y[i], x[j], y[j]);
      }
    }
  }
}
