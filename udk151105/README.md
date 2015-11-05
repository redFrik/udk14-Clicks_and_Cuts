general course introduction
--------------------

* links to previous semesters... <http://redfrik.github.io/udk00-Audiovisual_Programming/>
* and dates + times for this course... <https://github.com/redFrik/udk14-Clicks_and_Cuts> <-save this page


software
--

* [SuperCollider](http://supercollider.github.io/download.html)
* [Processing](http://processing.org)
* [Audacity](http://audacityteam.org)
* and perhaps some [Arduino](http://www.arduino.cc)


hardware
--

* speaker element
* 1.5v battery
* wires
* resonant boxes
* 220uF capacitor
* 470ohm resistor

click experiments
--

first play with a battery (here a 1.5V) and a speaker element...

![battery_speaker.jpg](battery_speaker.jpg?raw=true "battery_speaker.jpg")

notice how the paper code pops out and sinks in depending on battery polarity (swap the cables around)

play with different speakers...

![speakers.jpg](speakers.jpg?raw=true "speakers.jpg")

and also try putting them into boxes...

![speaker_box.jpg](speaker_box.jpg?raw=true "speaker_box.jpg")

notice how different they all sound.

next connect a big capacitor (here 220uF). you should only get one click sound from the speaker. swap cables around and you will get another one. this is because energy is stored in the capacitor and it will not let more through until it is discharged (by for example swapping the poles around).

add a resistor (here 470ohm) in parallell to the capacitor like this...

![filter.jpg](filter.jpg?raw=true "filter.jpg")

now the click should be there each time you connect the cables, although it will sound a bit 'cleaner'. the resistor will slowly drain or bleed away the energy stored in the capacitor.

reading
--

https://en.wikipedia.org/wiki/Glitch_(music)


listening
--

[Ryoji Ikeda - data.matrix](https://youtu.be/F5hhFMSAuf4)

[SND - 00009 A.1](https://youtu.be/EqCjyu9YjMs)

<https://en.wikipedia.org/wiki/Clicks_%26_Cuts> compilation cd

example supercollider code
--

```
s.boot

{LFPulse.ar(0.7)}.scope //lots of dc offset - bad for the speaker
{HPF.ar(LFPulse.ar(0.7), 9)}.scope //add a high-pass filter with 9Hz cutoff
{LeakDC.ar(LFPulse.ar(0.7))}.scope //same thing using the LeakDC filter ugen

{LFPulse.ar(0.7)}.play
{Impulse.ar(1.4)}.play
{LFSaw.ar(1.4)}.play

//starting the sound at top of the sine cycle gives a click/punch
//we can do this by setting the phase to a quarter of 2pi
{SinOsc.ar(50, 0)}.scope(fadeTime:0)
{SinOsc.ar(50, 2pi/4)}.scope(fadeTime:0)

{SinOsc.ar(50)*Line.ar(1, 0, 0.1)}.scope(fadeTime:0)
{SinOsc.ar(50, 2pi/4)*Line.ar(1, 0, 0.1)}.scope(fadeTime:0)

//some experiments with band-pass filters
{BPF.ar(LFPulse.ar(1)+LFPulse.ar(1.5), 250, 0.1, 4)}.scope
{BPF.ar(LFPulse.ar(1)+LFPulse.ar(1.5), 99, 0.1, 4)}.scope
{HPF.ar(LFPulse.ar(1)+LFPulse.ar(1.5), 9)}.scope
{BPF.ar(Impulse.ar([5, 6]), [2000, 3000], 0.1, 10)}.scope
```
