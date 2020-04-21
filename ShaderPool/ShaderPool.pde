boolean rotateRight, rotateLeft, zoomOut, zoomIn, lightUp, lightDown, pause, shaderOff;
PVector posCam;
float camMov, z, x, light;
PImage ballTexture;
PShape ball;
ArrayList<PShape> balls = new ArrayList<PShape>();
float angleX[] = new float[15];
float angleY[] = new float[15];
PShader sh;

void setup() {
  fullScreen(P3D);
  x = width/2.0;
  z = width;
  light = x;
  camMov=0;
  posCam = new PVector(width/2, height/2-180, -width/2);
  pause = true;
  shaderOff = false;
  for (int i =0; i<15; i++) {
    balls.add(createBall("./images/"+(i+1)+"ball.jpg"));
    angleX[i]=(float)Math.random()*359;
    angleY[i]=(float)Math.random()*359;
  }
  sh = loadShader("./shader/ColoreaInput.glsl");
}

PShape createBall (String path) {
  beginShape();
  ball = createShape(SPHERE, 75);
  ball.setStroke(255);
  ball.scale(1, 1, 1);
  ballTexture = loadImage(path);
  ball.setTexture(ballTexture);
  endShape();
  return ball;
}

void draw() {
  setCamera();
  if (pause) showLegend();
  else {
    background(50);
    setLight();
    drawBalls();
  }
}

void showLegend() {
  background(0);
  fill(255);

  textAlign(CENTER, CENTER);

  textFont(createFont("Arial", 30));
  text("ENABLE OR DISABLE SHADER", width/2, height/2 - 160);
  text("MODIFY SHADER ILLUMINATION", width/2, height/2);
  text("ENTER - Start/Pause", width/2, height/2 + 160);

  textFont(createFont("Arial", 24));
  text("CLICK MOUSE", width/2, height/2 - 120);
  text("MOVE MOUSE", width/2, height/2 + 40);
}

void setCamera() {
  if (pause) camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  else camera(posCam.x, posCam.y, posCam.z, x, height/2.0, 75*8+20, 0, 1, 0);
}

void setLight() {
  if (shaderOff) {
    float val = (float)light/(float)width*float(255);
    ambientLight((int)val, val, val);
    pointLight(204, 153, 0, light, height/2, 400);
  } else {
    float dirY = (mouseY / float(height) - 0.5) * 6;
    float dirX = (mouseX / float(width) - 0.5) * 6;
    directionalLight(240, 240, 240, -dirX, -dirY, -1);

    if (posCam.z > -width && posCam.z < -width/2) {
      shader(sh);
    } else if (posCam.z < -width) {
      shader(sh);
      sh.set("u_resolution", float(width), float(height));
      sh.set("u_time", float(millis())/float(1000));
    }
  }
}

void drawBalls() {

  //Ball 1
  noStroke();
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateY(radians(angleY[0]));
  rotateX(radians(angleX[14]));
  shape(balls.get(0));
  popMatrix();

  //Ball 2
  pushMatrix();
  translate(width/2-75*2, height/2, 75*8+20);
  rotateY(radians(angleY[1]));
  rotateX(radians(angleX[13]));
  shape(balls.get(1));
  popMatrix();

  //Ball 3
  pushMatrix();
  translate(width/2+75*4, height/2, 75*8+20);
  rotateY(radians(angleY[2]));
  rotateX(radians(angleX[12]));
  shape(balls.get(2));
  popMatrix();

  //Ball 4
  pushMatrix();
  translate(width/2+75, height/2, 75*2+20);
  rotateY(radians(angleY[3]));
  rotateX(radians(angleX[11]));
  shape(balls.get(3));
  popMatrix();

  //Ball 5
  pushMatrix();
  translate(width/2-75*2, height/2, 75*4+20);
  rotateY(radians(angleY[4]));
  rotateX(radians(angleX[10]));
  shape(balls.get(4));
  popMatrix();

  //Ball 6
  pushMatrix();
  translate(width/2+75, height/2, 75*6+20);
  rotateY(radians(angleY[5]));
  rotateX(radians(angleX[9]));
  shape(balls.get(5));
  popMatrix();

  //Ball 7
  pushMatrix();
  translate(width/2-75, height/2, 75*6+20);
  rotateY(radians(angleY[6]));
  rotateX(radians(angleX[8]));
  shape(balls.get(6));
  popMatrix();

  //Ball 8
  pushMatrix();
  translate(width/2, height/2, 75*4+20);
  rotateY(radians(angleY[7]));
  rotateX(radians(angleX[7]));
  shape(balls.get(7));
  popMatrix();

  //Ball 9
  pushMatrix();
  translate(width/2, height/2, 75*8+20);
  rotateY(radians(angleY[8]));
  rotateX(radians(angleX[6]));
  shape(balls.get(8));
  popMatrix();

  //Ball 10
  pushMatrix();
  translate(width/2-75, height/2, 75*2+20);
  rotateY(radians(angleY[9]));
  rotateX(radians(angleX[5]));
  shape(balls.get(9));
  popMatrix();

  //Ball 11
  pushMatrix();
  translate(width/2+75*2, height/2, 75*4+20);
  rotateY(radians(angleY[10]));
  rotateX(radians(angleX[4]));
  shape(balls.get(10));
  popMatrix();

  //Ball 12
  pushMatrix();
  translate(width/2-75*4, height/2, 75*8+20);
  rotateY(radians(angleY[11]));
  rotateX(radians(angleX[3]));
  shape(balls.get(11));
  popMatrix();

  //Ball 13
  pushMatrix();
  translate(width/2+75*3, height/2, 75*6+20);
  rotateY(radians(angleY[12]));
  rotateX(radians(angleX[2]));
  shape(balls.get(12));
  popMatrix();

  //Ball 14
  pushMatrix();
  translate(width/2-75*3, height/2, 75*6+20);
  rotateY(radians(angleY[13]));
  rotateX(radians(angleX[1]));
  shape(balls.get(13));
  popMatrix();

  //Ball 15
  pushMatrix();
  translate(width/2+75*2, height/2, 75*8+20);
  rotateY(radians(angleY[14]));
  rotateX(radians(angleX[0]));
  shape(balls.get(14));
  popMatrix();
}

void keyPressed() {
  if (keyCode == ENTER) pause = !pause;
}

void mousePressed() {
  if (!pause) shaderOff = !shaderOff;
}
