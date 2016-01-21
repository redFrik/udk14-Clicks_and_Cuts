feedback
--

sound
--

```
//try whistling
{SinOsc.ar(Pitch.kr(SoundIn.ar)[0]+5)!2}.play

//with 1sec delay and no addition (no +5)
{SinOsc.ar(Pitch.kr(DelayN.ar(SoundIn.ar,1,1))[0])!2}.play
```


graphics
--

minimal processing example

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

watch
--

[Mask for no-input mixer (complete version) by Marko Ciciliani](https://www.youtube.com/watch?v=CoYE4QOWl3I)
