feedback
--

graphics
--

minimal processing example to start with.

```cpp
void setup() {
    size(800, 600);
    background(0);
}
void draw() {
    rect(mouseX, mouseY, 20, 20);
    translate(width*0.5, height*0.5);
    scale(1.05);  //zoom in speed
    translate(-width*0.5, -height*0.5);
    image(get(), 0, 0, width, height);
}
```

now see the variations we wrote in class...

* [sketch_160121a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121a/sketch_160121a.pde)
* [sketch_160121b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121b/sketch_160121b.pde)
* [sketch_160121c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121c/sketch_160121c.pde)
* [sketch_160121d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121d/sketch_160121d.pde)
* [sketch_160121e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121e/sketch_160121e.pde)
* [sketch_160121f](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121f/sketch_160121f.pde)
* [sketch_160121g](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160121/sketch_160121g/sketch_160121g.pde)

![sketch_160121b.png](sketch_160121b.png?raw=true "sketch_160121b.png")

![sketch_160121c.png](sketch_160121c.png?raw=true "sketch_160121c.png")

![sketch_160121d.png](sketch_160121d.png?raw=true "sketch_160121d.png")

sound
--

run these examples in supercollider.  for the feedback to work use the built in laptop speakers and not headphones.  also play around with the laptop volume.

```
s.boot

//try whistling
{SinOsc.ar(Pitch.kr(SoundIn.ar)[0])!2}.play

//constantly rising
{SinOsc.ar(Pitch.kr(SoundIn.ar)[0]+5)!2}.play

//constantly falling
{SinOsc.ar(Pitch.kr(SoundIn.ar)[0]-5)!2}.play

//more falling - works really well in a big group of laptops
{SinOsc.ar(Pitch.kr(SoundIn.ar)[0]-15)!2}.play

//harsher sounds and some different settings for pitch tracker
{Pulse.ar(Pitch.kr(SoundIn.ar, 400, 50, 4000, downsample:10)[0]-15)!2}.play

//lag control with mouse
{Pulse.ar(Pitch.kr(SoundIn.ar).lag(MouseX.kr(0, 1))[0]-25)!2}.play

//with 1sec delay and no addition (no +5)
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar, 1, 1))[0])!2}.play

//delay with increasing frequency
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar, 1 ,1))[0]+15)!2}.play

//different delaytimes in left and right channel
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar, 1, [1, 0.9])).flop[0]+15)}.play

//with lag
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar, 1, 1)).lag(0.2)[0])!2}.play

//lag3 is overshooting
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar, 1, 1)).lag3(0.2)[0])!2}.play

//with low pass filter
{DelayN.ar(LPF.ar(SoundIn.ar, 4000), 1, 1)!2}.play

//with reverb effect
{GVerb.ar(SinOsc.ar(Pitch.kr(SoundIn.ar)[0]), 90)}.play

//crazy
{SinOsc.ar(0, SinOsc.ar(Pitch.kr(SoundIn.ar)[0]/MouseX.kr(1, 9))*2pi)!2}.play

//demo posting the hasFreq flag. this will detect 'clean' pitched sounds
{Pitch.kr(SoundIn.ar)[1].poll; DC.ar(0)}.play

//and with clar flag set to 1 you get 'clarity' - how 'clean' the sound is
{Pitch.kr(SoundIn.ar, clar:1)[1].poll; DC.ar(0)}.play
```

watch
--

[Mask for no-input mixer (complete version) by Marko Ciciliani](https://www.youtube.com/watch?v=CoYE4QOWl3I)
