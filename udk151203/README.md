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

```cpp
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

```cpp
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

```cpp
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

```cpp
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

```cpp
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

```cpp
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

```cpp
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

```cpp
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

more advanced example...

```cpp
void setup() {
    size(800, 600);
}
void draw() {
    float num= 100;
    for(int i= 0; i<num; i++) {
        float y= sin(frameCount*0.04+cos(i/num*TWO_PI))*sin(frameCount*0.03)*(height*0.3)+(height*0.5);
        float x= cos(frameCount*0.05+sin(i/num*TWO_PI))*(width*0.3)+(width*0.5);
        ellipse(x, y, sin(frameCount*0.07)*150, sin(frameCount*0.06)*150);
    }
}
```
now try out these examples that we wrote in class...

* [sketch_151203a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203a/sketch_151203a.pde)
* [sketch_151203b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203b/sketch_151203b.pde)
* [sketch_151203c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203c/sketch_151203c.pde)
* [sketch_151203d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203d/sketch_151203d.pde)
* [sketch_151203e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203e/sketch_151203e.pde)
* [sketch_151203f](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203f/sketch_151203f.pde)
* [sketch_151203g](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203g/sketch_151203g.pde)
* [sketch_151203h](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151203/sketch_151203h/sketch_151203h.pde)

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

supercollider
--

experiments with simple sines

```
s.boot
s.scope

//first notice lack of click in the beginning - only in the end (when cmd+. to stop)
{SinOsc.ar(400, 0.5*pi)}.play

//because there is a built-in default fade-in attack time (0.02) when using {}.play
{SinOsc.ar(400, 0.5*pi)}.play(fadeTime:1);

{SinOsc.ar(400, 0.5*pi)}.play(fadeTime:0) //no attack and start sine at 1.0 by setting phase to half-pi
{SinOsc.ar(100, 0.1*pi, Line.ar(1, 0, 0.04))!2}.play(fadeTime:0) //tune attack and add quick fadeout, kickdrum
{GVerb.ar(SinOsc.ar(100, 0.1*pi, Line.ar(1, 0, 0.04)), 50)}.play(fadeTime:0)
{FreeVerb.ar(SinOsc.ar(100, 0.1*pi, Line.ar(1, 0, 0.04)), 0.5)!2}.play(fadeTime:0)


//using sine oscillators as 0/1 rhythm gates
{SinOsc.ar(400) * (SinOsc.ar(1.4)>0.9)}.play(fadeTime:0)

{SinOsc.ar(400) * (SinOsc.ar(SinOsc.ar(1.5)*10.8+0.6)>0.9)}.play(fadeTime:0)

//multi channel expansion
{SinOsc.ar([400, 800]) * (SinOsc.ar(SinOsc.ar([1.5, 1.75])*10.8+0.6)>0.9)}.play(fadeTime:0)

//using Splay to spread out x channels into the standard two channel stereo field
{Splay.ar(SinOsc.ar([400, 800, 900, 1230]) * (SinOsc.ar(SinOsc.ar([1.5, 1.75])*10.8+0.6)>0.9))}.play(fadeTime:0)


{SinOsc.ar([500, 6000]) * (SinOsc.ar([3, 4])>0)}.play

{Splay.ar(SinOsc.ar([500, 6000, 700, 503, 654]) * (SinOsc.ar([3, 4, 5, 6, 7])>0))}.play

{SinOsc.ar([500, 700]) * (SinOsc.ar([2, 3])>SinOsc.ar(0.1))}.play(fadeTime: 0)


b= [1, 2, 3, 4, 5, 6, 7, 8, 9];
{Splay.ar(SinOsc.ar( b*100 ) * (SinOsc.ar(b)>0))}.play

b= (1..5);  //same as b= [1, 2, 3, 4, 5]
{Splay.ar(SinOsc.ar( b*100 ) * (SinOsc.ar(b)>0))}.play

b= (1..5);
{Splay.ar(SinOsc.ar( b*100 ) * (SinOsc.ar(2)*SinOsc.ar(0.8)>0))}.play

b= (1..5);
{Splay.ar(SinOsc.ar( b*100 )+SinOsc.ar(b*50) * (SinOsc.ar(3)+SinOsc.ar(0.8)>0))}.play
{Splay.ar(SinOsc.ar( b*100 )*SinOsc.ar(b*50) * (SinOsc.ar(3)+SinOsc.ar(0.8)>0))}.play

{SinOsc.ar(500*SinOsc.ar(LFNoise2.ar(4)*100+300))}.play

{Splay.ar(SinOsc.ar(500*SinOsc.ar(LFNoise2.ar([3,4,5,6,7])*100+300)))}.play
```
there is also the sin(x) function...

```
//check the post window
{Sweep.ar(0, 1).poll; Silent.ar}.play
{sin(Sweep.ar(0, 1)).poll; Silent.ar}.play

//now listen and compare these two.  should be identical
{sin(Sweep.ar(0, 2pi*400))}.play
{SinOsc.ar(400)}.play
```
