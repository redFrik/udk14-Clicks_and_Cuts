void setup() {
  size(800, 600);
}
void draw() {
  background(0);
  noStroke();
  
  for(int x= 0; x<10; x++) {
    
    for(int y= 0; y<50; y++) {
      
      if(random(1000)<1) {
        x= x*2;
      }
      
      rect(x*20, y*8, 4, 3);
    }
  }
}