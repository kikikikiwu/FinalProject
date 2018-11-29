/*
Frame work & Methods:
- There are elements "Mountain", "Sun", "Moon", "cloud" and "Bird" in a scenario.
- Every element can be chosen and highlighted.
- Once chosen, it will evolute into current Chinese Character smoothly by matching the pixels.
- The unchosen part will moves backward and become blurry and transparent gradually.
(- As the evolution goes on, the background music change accordingly (all sound will be added in alpha version 3).)
- Also, the background color is fading into white, and the character is becoming black.
- Once the evolution ends, user can click on the character to trigger the next animation.
- When clicked, the character will break into multiple particles, in the shape of its romanized pinyin (etc. "Mountain" = "S H A N").
- Particle letter spread away and fall down with gravity, piling up.
- While space key is pressed, all the letter move and reshape into a keyboard, with the previosly chosen letter highlighted.
- Highlighted = same font in bold
- When this reshape process is done, everything fades out
- The scenario moves forward again and become less blurry and more solid. 
- Repeat.
*/
//-----------
//load images of mountain, sun, moon, clod, and bird
//create pixel array for each element

Mountain mountain = new Mountain();
Sun sun = new Sun(550, 100, 100);

void setup(){
  size(1200, 600);
  background(255);
}

void draw(){
  //scene
    //draw sun
    //store the pixel loc of sun
    for (int x = 0; x < sun.x; x+=5){
      for(int y = 0; y < sun.y; y+=5){
        color c = get(x, y);
        if (c == sun.sunC){
          while (mouseX == x && mouseY == y){
            sun.display();
            sun.highlight(); //highlighted when mouse hovered
           if (mousePressed){
             sun.evolute(); //sun evolutes into chinese character
             
           }
          }
        }
      }
    }
            
    //draw mountain, using a triangle for now
  mountain.display();
    //draw moon
    //draw cloud
    //draw bird
  
}
