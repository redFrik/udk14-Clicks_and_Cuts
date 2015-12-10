spirals
--

* [sketch_151210a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210a/sketch_151210a.pde)
* [sketch_151210b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210b/sketch_151210b.pde)
* [sketch_151210c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210c/sketch_151210c.pde)
* [sketch_151210d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210d/sketch_151210d.pde)
* [sketch_151210e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk151210/sketch_151210e/sketch_151210e.pde)

![spiral.png](spiral.png?raw=true "spiral.png")

fm synthesis
--

```
s.boot;

{BLowPass4.ar(SinOsc.ar(99, SinOsc.ar(SinOsc.ar([50, 50.1])*200)*MouseX.kr(0, 40)))}.play;
```
