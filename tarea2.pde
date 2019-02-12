//Variables
ArrayList<Drawing> drawings =new ArrayList <Drawing>();
int pressfirst = 1;
int x0, y0, x2, y2;
int total = 10;

void setup() {
  size(1200, 720, P3D);
  background(0);
  fill(255);
  x2 = width / 2;
  y2 = 0;
 }
  
void draw(){
  fill(255);
  lights();
  stroke(255,120,12);
  text("1. Dibuje una figura del lado derecho de la linea,"+
  " \n   debe ser una vista lateral del objeto", 30, 30);
  line(width/2, 0, width/2, height);
  
  //Dibuja las lineas al presionar el click izquierdo
  if (mousePressed == true && pressfirst == 1) {
    line(x2, y2, mouseX, mouseY);
    drawings.add(new Drawing(x2, y2, mouseX ,mouseY));
    x2 = mouseX;
    y2 = mouseY;
  }
}


  
class Drawing {
  float x1, y1, x2, y2;
  Drawing(float ax, float ay, float bx, float by) {
    x1 = ax;
    y1 = ay;
    x2 = bx;
    y2 = by;
  }
}

void mouseReleased() {
  beginShape();
  for(Drawing k: drawings){
    float r= 200;
    for(int i=0; i < total+1 ; i++){
      float lat=map(i,0,total, 0, PI);
      vertex(k.x1, k.y1, r* cos(lat));
      vertex(k.x2, k.y2, r* cos(lat));
    }
  }
  endShape();
  drawings = new ArrayList <Drawing>();
}
