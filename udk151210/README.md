spirals
--

* [sketch_151210a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210a/sketch_151210a.pde)
* [sketch_151210b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210b/sketch_151210b.pde)
* [sketch_151210c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210c/sketch_151210c.pde)
* [sketch_151210d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210d/sketch_151210d.pde)
* [sketch_151210e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210e/sketch_151210e.pde)

![spiral.png](spiral.png?raw=true "spiral.png")

and the code we wrote in class...

* [sketch_151210f](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210f/sketch_151210f.pde)
* [sketch_151210g](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210g/sketch_151210g.pde)
* [sketch_151210h](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210h/sketch_151210h.pde)
* [sketch_151210i](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210i/sketch_151210i.pde)
* [sketch_151210j](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210j/sketch_151210j.pde)
* [sketch_151210k](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210k/sketch_151210k.pde)
* [sketch_151210l](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210l/sketch_151210l.pde)
* [sketch_151210m](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210m/sketch_151210m.pde)
* [sketch_151210n](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210n/sketch_151210n.pde)
* [sketch_151210o](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210o/sketch_151210o.pde)


bonus
--

```cpp
void setup() {
    size(800, 600);
    background(0);
    noStroke();
}
void draw() {
    float x= sin(frameCount*0.012)*width*0.4;
    float y= cos(frameCount*0.011)*height*0.4;
    x= x*sin(frameCount*sin(frameCount*0.014)*0.03)*0.3;
    y= y*sin(frameCount*sin(frameCount*0.013)*0.03)*0.3;
    rect(width*0.5+x, height*0.5+y, 2, 2);
}
```

fm synthesis
--

```
s.boot;

{BLowPass4.ar(SinOsc.ar(99, SinOsc.ar(SinOsc.ar([50, 50.1])*200)*MouseX.kr(0, 40)))}.play;
```

```
s.scope

{SinOsc.ar(500, 0, 0.5)+SinOsc.ar(840, 0, 0.5)}.play

{SinOsc.ar([500, 501])}.play
{SinOsc.ar([500, 499])}.play
{SinOsc.ar([500, 500.5])}.play
{SinOsc.ar([500, 502.35])}.play

//beating sines (binaural beats)
{SinOsc.ar([870, 853])}.play

//Splay mix lots of oscillators into stereo
{Splay.ar(SinOsc.ar([500, 601, 707, 800]))}.play

//additive synthesis
{SinOsc.ar(500)+SinOsc.ar(8000, 0, 0.1)}.play

{Splay.ar(SinOsc.ar([400, 500, 600, 700, 800], 0, [0.5, 0.4, 0.3, 0.2, 0.1]))}.play

{Splay.ar(SinOsc.ar([400, 500, 602, 700, 801], 0, SinOsc.ar([0.1, 0.21, 0.31, 0.405, 0.5])))}.play

//frequency modulation

{SinOsc.ar(500+ (SinOsc.ar(2)*100))}.play

{SinOsc.ar(500+ (SinOsc.ar(201)*100))}.play

{SinOsc.ar(500+ (SinOsc.ar(20)*100))}.play

{SinOsc.ar([500, 500]+ (SinOsc.ar(20)*(SinOsc.ar(1)*100)))}.play

{SinOsc.ar([500, 600]+ (SinOsc.ar(20*(SinOsc.ar(1)*10))*100))}.play

{SinOsc.ar([500, 500] + (SinOsc.ar(4)*400))}.play
{SinOsc.ar([500, 500] + (SinOsc.ar(SinOsc.ar(0.1)*40)*400))}.play
{SinOsc.ar([500, 500] + (SinOsc.ar(SinOsc.ar(SinOsc.ar(0.5)*40)*400)*400))}.play

{Splay.ar(SinOsc.ar([500, 505, 600, 800] + (SinOsc.ar(SinOsc.ar(SinOsc.ar([0.5, 0.6])*[40, 50, 60])*400)*[400, 40, 500])))}.play


//amplitude modulation / ring modulation
{SinOsc.ar([500, 600])}.play
{SinOsc.ar(500)*SinOsc.ar(100)}.play
{SinOsc.ar([500, 600])*SinOsc.ar([103, 200])*SinOsc.ar([402, 500])*SinOsc.ar([801, 900])}.play


{Splay.ar(SinOsc.ar([500, 600, 700, 800])*SinOsc.ar([0.1, 0.2, 0.3, 0.4])*SinOsc.ar([0.1, 0.2, 0.3, 0.4]+1.1))}.play

```
