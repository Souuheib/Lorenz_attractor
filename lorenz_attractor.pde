float x = 0.01;
float y= 0;
float z= 0;

float a = 10;
float b= 28;
float c = 8.0/3.0;


ArrayList<PVector> points = new ArrayList<PVector>();

void settings() {
  System.setProperty("jogl.disable.openglcore", "true");
  size(800,600,P3D);
}

void setup(){
  //size(800,600);
  background(0);
  colorMode(HSB);
  
}

void draw(){
  
  float dt = 0.01;
  float dx = (a * (y - x)) *dt;
  float dy = (x * (b - z) - y) *dt;
  float dz = (x * y -c *z) *dt;
  
  x = x + dx;
  y = y + dy;
  z = z + dz;
  
  points.add(new PVector(x, y, z));
  
  translate(width/2, height/3+50);
  
  scale(5);
  
  
  float hu = 0;
  beginShape();
  for(PVector v : points){
    
  
    stroke(hu,255,255,5);
    noFill();
  
    vertex(v.x, v.y, v.z);
    //vertex(v.y,v.z,v.x);
    //vertex(v.z,v.x,v.y);
    
    PVector offset = PVector.random3D();
    offset.mult(0.01);
    v.add(offset);
    
    hu += 0.01;
    println(hu);
    //pushMatrix();
    
    //popMatrix();
  
    if (hu > 255) {
      hu = 0;
    }
    
  endShape();
  rotateY(radians(hu*5));
  
  
}}
