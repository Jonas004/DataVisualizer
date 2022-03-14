String[] produkte;
String[] kategorien;
String[][] regeln1;
String[][] regeln1Kat;
String[][] regeln2Kat;
String[][] regelnVergleich;
float scale = 0.8;
float scaleSpeed = 1.05;
float xPan;
float yPan;
float panSpeed = 50;
boolean zoomIn = false;
boolean zoomOut = false;
boolean panUp = false;
boolean panDown = false;
boolean panLeft = false;
boolean panRight = false;
int mode = 1;

void setup() {
  //frameRate(30);
  fullScreen();
  //size(1900, 1000);
  textSize(14);
  xPan = width/2;
  yPan = height/2;
  background(255);
  produkte = new Daten().getProdukte();
  regeln1 = new Daten().getRegeln1();
  regeln1Kat = new Daten().getRegeln1Kat();
  regeln2Kat = new Daten().getRegeln2Kat();
  kategorien = new Daten().getKategorien();
  regelnVergleich = new Daten().getRegelnVergleich();
}

void draw() {
  translate(width/2, height/2);
  scale(scale);
  translate(-xPan, -yPan);
  background(255);
  stroke(0);
  
  if (mode == 1) {
    drawText(produkte, 0);
    drawLines(produkte, regeln1, 0);
  } else if (mode == 2) {
    drawText(kategorien, 0);
    drawLines(kategorien, regeln1Kat, 0);
  } else if (mode == 3) {
    drawText(kategorien, 0);
    drawLines(kategorien, regeln2Kat, 0);
  } else if (mode == 4) {
    drawText(kategorien, 0);
    drawLines(kategorien, regelnVergleich, 0);
  } else if (mode == 5) {
    drawText(kategorien, 0);
    drawLines(kategorien, regelnVergleich, 0);
    drawText(kategorien, 2200);
    drawLines(kategorien, regeln2Kat, 2200);
  }
  
  fill(0);
  checkChange();
}

int findIndex(String[] array, String name) {
  for(int i = 0; i < array.length; i++) {
    if (array[i].equals(name)) {
      return i;
    }
  }
  return -1;
}

void drawLines(String[] array, String[][] regeln, int offset) {
  for(int i = 0; i < regeln.length; i++) {
    int p1 = findIndex(array, regeln[i][0]);
    int p2 = findIndex(array, regeln[i][1]);
    line(250 + offset, 30*p1+25, 1600 + offset, 30*p2+25);
  }
}

void drawText(String[] array, int offset) {
  for(int i = 0; i < array.length; i++) {
    text(array[i], 10 + offset, 30*i+30);
    circle(250 + offset, 30*i+25, 10);
    text(array[i], 1650 + offset, 30*i+30);
    circle(1600 + offset, 30*i+25, 10);
  }
}

void checkChange() {
  if(zoomIn) {
    scale *= scaleSpeed;
  }
  if(zoomOut) {
    scale /= scaleSpeed;
  }
  if(panUp) {
    yPan -= panSpeed;
  }
  if(panDown) {
    yPan += panSpeed;
  }
  if(panLeft) {
    xPan -= panSpeed;
  }
  if(panRight) {
    xPan += panSpeed;
  }
}

void keyPressed() {
  if (keyCode == UP) {
    zoomIn = true;
    zoomOut = false;
  }
  if (keyCode == DOWN) {
    zoomIn = false;
    zoomOut = true;
  }
  if (keyCode == 'W') {
    panUp = true;
    panDown = false;
  }
  if (keyCode == 'S') {
    panDown = true;
    panUp = false;
  }
  if (keyCode == 'A') {
    panLeft = true;
    panRight = false;
  }
  if (keyCode == 'D') {
    panRight = true;
    panLeft = false;
  }
  if (keyCode == '1') {
    mode = 1;
  }
  if (keyCode == '2') {
    mode = 2;
  }
  if (keyCode == '3') {
    mode = 3;
  }
  if (keyCode == '4') {
    mode = 4;
  }
  if (keyCode == '5') {
    mode = 5;
  }
  if (keyCode == 'Z') {
    scale = 0.015;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    zoomIn = false;
  }
  if (keyCode == DOWN) {
    zoomOut = false;
  }
  if (keyCode == 'W') {
    panUp = false;
  }
  if (keyCode == 'S') {
    panDown = false;
  }
  if (keyCode == 'A') {
    panLeft = false;
  }
  if (keyCode == 'D') {
    panRight = false;
  }
}
