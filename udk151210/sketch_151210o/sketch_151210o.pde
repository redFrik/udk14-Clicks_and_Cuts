void setup() {
  size(800, 600);
}
void draw() {
 //trails
 fill(0, 0, 0, 10); //black rgb + little bit of alpha channel
 rect(0, 0, width, height);
 
 fill(255);
 for(int i= 0; i<100; i= i+1) {
   float x= sin(i+frameCount*0.1);
   float y= cos(i+frameCount*0.2);
   float z= sin(frameCount*0.07)*300;
   rect(width*0.5 + (x*z), height*0.5 + (y*z), 20, 20);
 }
}