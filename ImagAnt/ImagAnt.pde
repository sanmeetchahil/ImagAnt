import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;

PeasyCam camera;
PImage img; // declares the album as a PImage
float iteration = 0; // creates a float theta that will determine the difference in angle

void setup() { // setup part of code
  camera = new PeasyCam(this, 1000);
  camera.setMinimumDistance(100);
  camera.setMaximumDistance(5000);
  fullScreen(P3D); // declares 3d canvas
  img = loadImage("town.jpg"); // loads image of album
  img.loadPixels(); // loads pixels
} // closes setup function

void draw() { // draw code
  float offsetX = 1; 
  float offsetY = 1;
  noStroke();
  background(255, 50); // sets the background colour to white
  for (int y = 0; y < img.height; y+= 100) { // for loop for the y coordinate of the image, going every 10 pixels
    for (int x = 0; x < img.width; x+= 100) { // for loop for the x coordinate of the image, going every 10 pixels
      int loc = x + y * img.width; // creates a variable called loc that equals to the y value multiplied by the album width plus the X value from the other loop to draw each individual pixel 
      color c = img.pixels[loc]; // sets the colour of hte pixel to the location of the current iteration of the for loop
     
      float r = red(c); // sets the red float
      float g = green(c); // sets the green float
      float b = blue(c); // sets the blue float

      fill(r, g, b); // sets the fill colour to that of the image
      pushMatrix(); // pushes matrix coordinate system
      translate(-(img.width/2) + x, -(img.height/2) + y); // translates pixel to the x and y of the iteration  
      box(50, 50, 1000); // draws a rectangle at the mouse x and y position with a size of 12
      popMatrix(); // pops the matrix back into the coordinate system
    } // closes the for loop
  } // closes the for loop
  //offsetX += 1;
  //img.updatePixels();
} // closes draw loop

void keyPressed() { // function to manage key pressed events
  if (key == 'S' || key == 's') { // if the lowercase or uppercase letter 's' is pressed, then...
    saveFrame(); // it takes a screenshot
  } // closes the if statement
} // closes the key pressed event handler