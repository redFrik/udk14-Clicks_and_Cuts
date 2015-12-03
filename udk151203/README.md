sines
--

width the math function sin(x), for whatever x is you will always get an output number somewhere between -1.0 and 1.0.

```
sin(0) = 0.0

sin(1.57) ≈ 1.0     //top of curve

sin(3.14) ≈ 0.0     //middle point

sin(4.71) ≈ -1.0    //bottom of curve

sin(6.28) ≈ 0.0     //back to beginning (zero)
```

so with the x value going in small steps from 0 to 2pi (2 * 3.1415≈ 6.28), we get a smooth sine curve.


processing examples
--

```
void setup() {
    size(800, 600);
}
void draw() {
    float x= frameCount%width;
    float y= sin(frameCount*0.01)*100+(height*0.5);
    rect(x, y, 1, 1);
}
```

the `100` above is scaling from -1.0 to 1.0 to -100 to 100 pixels in height.
the `+(height*0.5)` is just offsetting the drawing down to the middle of the screen. so the final curve will vary between 600 * 0.5 - 100 = 200 and 600 * 0.5 + 100 = 400.
the `frameCount*0.01` counts slowly upwards in 0.01 steps.  try changing this number to something else (e.g. 0.1)

the first example above just draws one little black dot each frame update (60 times per second by default).
we can draw many more each frame and plot a complete sine curve each frame.

```
void setup() {
    size(800, 600);
}
void draw() {
    background(0);  //clear previous frame and set background to black
    stroke(255);    //set drawing to white
    for(int x= 0; x<width; x++) {
        float y= sin((frameCount+x)*0.01)*100+(height*0.5);
        rect(x, y, 1, 1);
    }
}
```

start playing with the numbers and also change the code inside the sin function.

```
void setup() {
    size(800, 600);
}
void draw() {
    background(0);
    stroke(255);
    for(int x= 0; x<width; x++) {
        float y= sin(frameCount*0.01+x)*100+(height*0.5);
        rect(x, y, 1, 1);
    }
}
```

and start adding more sin functions here and there.

```
void setup() {
    size(800, 600);
}
void draw() {
    background(0);
    stroke(255);
    for(int x= 0; x<width; x++) {
        float y= sin(frameCount*0.01+x)*100+(height*0.5);
        float xx= sin(frameCount*0.03+x)*100+(width*0.5);
        rect(xx, y, 1, 1);
    }
}
```

try nesting them...

```
void setup() {
    size(800, 600);
}
void draw() {
    background(0);
    stroke(255);
    for(int x= 0; x<width; x++) {
        float y= sin(frameCount*0.01+x*sin(frameCount*0.002))*100+(height*0.5);
        rect(x, y, 1, 1);
    }
}
```

and so on.

there is also the function cos.  this is just sin starting at 1.0 instead of 0.0.  that is, it is starting one quarter into the wave.

```
cos(0) = 1.0

cos(1.57) ≈ 0.0

cos(3.14) ≈ -1.0

cos(4.71) ≈ 0.0

cos(6.28) ≈ 1.0     //back to beginning (one)
```

so cos(x) is the same as sin(pi*0.5+x)

cos is mainly useful when you want to draw circles.

```
void setup() {
    size(800, 600);
}
void draw() {
    float y= sin(frameCount*0.1)*100+(height*0.5);
    float x= cos(frameCount*0.1)*100+(width*0.5);
    rect(x, y, 10, 10);
}
```

here an example with 10 dots evenly distributed around a circle.

```
void setup() {
    size(800, 600);
}
void draw() {
    background(0);
    stroke(255);
    for(int i= 0; i<10; i++) {  //10 is number of dots, i is index 0-9
        float y= sin(frameCount*0.01+(i/10.0*6.28))*100+(height*0.5);
        float x= cos(frameCount*0.01+(i/10.0*6.28))*100+(width*0.5);
        rect(x, y, 10, 10);
    }
}
```
i / 10.0 * 6.28 is what makes the dots spread out evenly (i is index 0-9 and /10.0 * 6.28 scales 0-9 from 0.0 up to two pi).
try chaning one of the 0.01 and see what happens.

and again start adding sin and cos functions here and there...

```
void setup() {
    size(800, 600);
}
void draw() {
    float num= 10;  //number of dots
    for(int i= 0; i<num; i++) {
        float y= sin(frameCount*0.01+(i/num*6.28))*sin(frameCount*0.03)*200+(height*0.5);
        float x= cos(frameCount*0.01+(i/num*6.28))*200+(width*0.5);
        rect(x, y, 10, 10);
    }
}
```

listen
--

<https://www.youtube.com/watch?v=giFk55cBjww> Ø (Mika Vainio) - Stratostaatti

excercise1
--

start audacity and select Tone from generate menu.

make it a sine, 100hz and 40ms long.

![sine2.png](sine2.png?raw=true "sine2.png")

now select all and do fade out.  listen.  it should sound like a kick drum.

cut away a little bit in the beginning and listen to how the click changes character.

![sine.png](sine.png?raw=true "sine.png")

last set the cursor at the end, select Silence from the generate menu and make it around 2 seconds long.
select all and apply the reverb effect - play around with different reverb settings.

