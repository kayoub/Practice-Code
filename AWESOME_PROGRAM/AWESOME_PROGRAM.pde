int grey = 0;
int change = 1;
void setup() {
  size(800, 800);
  frameRate(555);
  background(0);
}

void draw() {
  for (int y=0; y<=height; y+= 200) {
    strokeWeight(.001);
    if (mouseX>=width/3 && mouseX<=2*width/3 && mouseY>=height/3 && mouseY<=2*height/3) {
      stroke(random(255), random(255), random(255));
    }
    else {  
      stroke(grey);
    }
    line(width/3, height/3, mouseX, mouseY);
    line(2*width/3, 2*height/3, mouseX, mouseY);
  }
  grey+=change;
  if (grey >= 255) {
    change = -1;
  }
  if (grey <= 0) {
    change = 1;
  }
}

