int numCells = 350; // Number of blood cells
BloodCell[] cells = new BloodCell[numCells];

void setup() {
  size(1000, 800); 
  noStroke(); 
  for (int i = 0; i < numCells; i++) {
    cells[i] = new BloodCell();
  }
}

void draw() {
  background(0); 
  for (int i = 0; i < numCells; i++) {
    cells[i].move();
    cells[i].display();
  }
}

class BloodCell {
  float x, y, cellSize, xSpeed, ySpeed;
  color cellColor, centerColor;

  BloodCell() {
    x = random(width);
    y = random(height);
    cellSize = random(20, 50);
    xSpeed = random(-0.8, 0.3); 
    ySpeed = random(-0.8, 0.3); 
    updateColors();
  }

  void move() {
    // Calculate direction away from the mouse
    float dx = x - mouseX;
    float dy = y - mouseY;
    float distance = dist(x, y, mouseX, mouseY);

    // If the mouse is close enough, repel the cell
    if (distance < 100) {
      float repelStrength = map(distance, 0, 100, 0.3, 0); 
      xSpeed += (dx / distance) * repelStrength;
      ySpeed += (dy / distance) * repelStrength;
    }

    // Move the cell
    x += xSpeed;
    y += ySpeed;

    // Wrap around edges
    if (x > width) x = 0;
    if (x < 0) x = width;
    if (y > height) y = 0;
    if (y < 0) y = height;

    updateColors();
  }

  void display() {
    fill(cellColor);
    ellipse(x, y, cellSize, cellSize); 
    fill(centerColor);
    ellipse(x, y, cellSize * 0.5, cellSize * 0.3);
    ellipse(x, y, cellSize * 0.5, cellSize * 0.5);
    ellipse(x, y, cellSize * 0.8, cellSize * 0.8);
  }

  void updateColors() {
    float r = map(x, 0, width, 150, 255); // Map x to red-pink gradient
    float b = map(y, 0, height, 150, 255); // Map y to blue-purple gradient
    cellColor = color(r, 0, b, random(150, 200));
    centerColor = color(255, 200, b, random(150, 200));
  }
}
