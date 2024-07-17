MovingLines dot1, dot2, dot3, dot4, dot5, dot6, dot7;
int timeTracker, timeBetweenBranches, globalTimeStamp, pulse, pulseSecond, pulseCooldown, pulseCooldownSecond, renderImage, justPulsed, justPulsedSecond, xOfMouse, yOfMouse;
int veinCount=0;
float sizeFactor=0.0005*2;
void setup() {
  background(0);
  size(1920, 1080,P2D);
  //fullScreen();
  dot1 = new MovingLines(width/2, height/2, -3, -3);
  dot2 = new MovingLines(width/2, height/2, 3, -3);
  dot3 = new MovingLines(width/2, height/2, 2, -2);
  dot4 = new MovingLines(width/2, height/2, 1, -3);
  dot5 = new MovingLines(width/2, height/2, 2, -1);
  dot6 = new MovingLines(width/2, height/2, 2, -1);
  dot7 = new MovingLines(width/2, height/2, 1, -2);
  timeBetweenBranches=300;
  noStroke();
}

class MovingLines {
  float[] dotSizes = new float[1000];
  float[] plusSizes = new float[1000];
  float[] plusSizesSecond = new float[1000];
  int[] xPositions = new int[1000];
  int[] yPositions = new int[1000];
  int x, y, switchDirection;
  float dx, dy, changingDirectionAmount, dotSize;
  int dotCount;
  int  positionSwitch= int(random(10, 999));
  int switchAfter= int(random(2, 15));
  int  SizeSwitched=0;
  public MovingLines(int x, int y, int dx, int dy) {
    this.x=x;
    this.y=y;
    this.dx=dx;
    this.dy=dy;
  }
  void resetPosition(int newX, int newY) {
    x=newX;
    y=newY;
  }
  void plot() {
    x+=dx;
    y+=dy;
    if (dotCount+1<xPositions.length) {
      xPositions[dotCount] = x;
      yPositions[dotCount] = y;
      dotCount++;
      if (SizeSwitched==0) {
        if (dotCount == 0) {
          dotSizes[dotCount]=7;
        } else {
          dotSizes[dotCount]=dotSizes[dotCount-1]+0.2;
        }

        if (dotSizes[dotCount]>=7.2) {
          SizeSwitched=1;
        }
      }


      if (SizeSwitched==1) {
        dotSizes[dotCount]=dotSizes[dotCount-1]-0.2;
        if (dotSizes[dotCount]<=2.8) {
          SizeSwitched=0;
        }
      }
    }
    //acceleration:
    if (int(random(20))%5==1) {
      dx*=1.2;
      dy*=1.2;
    }
    //size bouncing

    if (dotCount%switchAfter==0) {
      changingDirectionAmount=0.05*int(random(-10, 10));
      dx = changingDirectionAmount*dx+(1-changingDirectionAmount)*random (-2, 2.5);
      dy = changingDirectionAmount*dy+(1-changingDirectionAmount)*random(-2, 2.5);
    }
    //corners:
    if (x>width) {
      dx=-5;
    }
    if (x<0) {
      dx=5;
    }
    if (y>height) {
      dy=-5;
    }
    if (y<0) {
      dy=5;
    }
  }
  void pulsing(int inputRenderImage) {
    if (justPulsed==2) {
      int index = inputRenderImage;
      int pulseWidth = 100;
      int pulsingSpeed=30;
      if (index*pulsingSpeed<(999)) {
        for (int i= 0; i<pulseWidth; i++) {
          if (inputRenderImage-i*index*pulsingSpeed<0 && index*pulsingSpeed-i>=0 && index*pulsingSpeed-i<xPositions.length) {
            plusSizes[index*pulsingSpeed-i]=(pulseWidth-i)*(pulseWidth-i)*sizeFactor;
          }
        }
      } else {
        justPulsed=0;
        println("f");
      }
    }
  }
  void pulsingSecond(int inputRenderImage) {
    if (justPulsedSecond==2) {
      int index = inputRenderImage;
      int pulseWidth = 100;
      int pulsingSpeed=30;
      if (index*pulsingSpeed<(999)) {
        for (int i= 0; i<pulseWidth; i++) {
          if (inputRenderImage-i*index*pulsingSpeed<0 && index*pulsingSpeed-i>=0 && index*pulsingSpeed-i<xPositions.length) {
            plusSizesSecond[index*pulsingSpeed-i]=(pulseWidth-i)*(pulseWidth-i)*sizeFactor;
          }
        }
      } else {
        justPulsedSecond=0;
        println("k");
      }
    }
  }
  void renderVein(int inputRenderImage) {
    if (inputRenderImage<dotCount)
      circle(xPositions[inputRenderImage], yPositions[inputRenderImage], (dotSizes[inputRenderImage]+plusSizes[inputRenderImage]+plusSizesSecond[inputRenderImage]));
  }
}



























void draw() {
  println(timeTracker);
  fill(0, 0, 0);
  rect(0, 0, width, height);
  pulse();
  renderImage++;

  if (veinCount>=1) {
    dot1.plot();
    dot1.renderVein(renderImage);
    dot2.plot();
    dot2.renderVein(renderImage);
    dot3.plot();
    dot3.renderVein(renderImage);
    timeTracker++;
  }
  if (timeTracker>=500) {
    dot4.plot();
    dot4.renderVein(renderImage);
    dot5.plot();
    dot5.renderVein(renderImage);
  }




  for (int i=0; i<1000; i++) {
    fill(int(50-i/40), 10, 10);
    dot3.renderVein(i);
    dot3.pulsing(pulse);
    dot3.pulsingSecond(pulseSecond);
    dot5.renderVein(i);
    dot5.pulsing(pulse);
    dot5.pulsingSecond(pulseSecond);
    
    fill(int(180-i/6), 10, 10);
    dot1.renderVein(i);
    dot1.pulsing(pulse);
    dot1.pulsingSecond(pulseSecond);
    dot2.renderVein(i);
    dot2.pulsing(pulse);
    dot2.pulsingSecond(pulseSecond);
    dot4.renderVein(i);
    dot4.pulsing(pulse);
    dot4.pulsingSecond(pulseSecond);
  }


  globalTimeStamp++;
}

void pulse() {
  pulse++;
  pulseSecond++;
}
void keyReleased() {
  veinCount++;
  if (key == ' ') {
    if (justPulsed==2 && justPulsedSecond==0) {
      justPulsedSecond=2;
      pulseSecond=0;
    }
    if (justPulsed==0) {
      justPulsed=2;
      pulse=0;
    }
  }
}
void mousePressed() {
  veinCount++;
  xOfMouse=mouseX;
  yOfMouse=mouseY;
  dot1.resetPosition(int(xOfMouse), int(yOfMouse));
  dot2.resetPosition(int(xOfMouse), int(yOfMouse));
  dot3.resetPosition(int(xOfMouse), int(yOfMouse));
  dot4.resetPosition(int(xOfMouse), int(yOfMouse));
  dot5.resetPosition(int(xOfMouse), int(yOfMouse));
}
