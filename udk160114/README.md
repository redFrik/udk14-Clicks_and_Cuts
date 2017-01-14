ascii
--

ascii art, ascii graphics using processing and supercollider

sound
--

supercollider...

```supercollider
s.boot

65.asAscii
90.asAscii
120.asAscii
130.asAscii
255.asAscii

//0-127

"ABx".ascii

{SinOsc.ar( "xv".ascii )}.play  //left and right channels
{SinOsc.ar( "xv".ascii*10 )}.play
{SinOsc.ar( "ac".ascii.midicps )}.play
65.midicps

{SinOsc.ar( Duty.ar(0.1, 0, Dseq("abcfz".ascii.midicps, inf)))}.play

{SinOsc.ar( Duty.ar(0.1, 0, Dseq(("abcfz".ascii-36).midicps, inf)))}.play

{SinOsc.ar( Duty.ar(0.1, 0, Dseq("@@@@@@@@@@@                ..alasjdkjha....  ".ascii.midicps, inf)))}.play

{SinOsc.ar( [Duty.ar(0.1, 0, Dseq("ab  @ . Ac".ascii.midicps, inf)), Duty.ar(0.1001, 0, Dseq("ab  @ . Acd".ascii.midicps, inf))] )}.play

{SinOsc.ar( Duty.ar(0.1, 0, Dseq("ABCDEFGHIJKLMNOPQRSTUVWXYZ".ascii.midicps, inf)))}.play

{SinOsc.ar( Duty.ar(0.1, 0, Dseq("xxxxxxxxxxxx            ©@£|§|©∞@£|§∞..........".ascii.midicps, inf)))}.play

{LFPulse.ar( Duty.ar([0.06, 0.05], 0, Dseq("xxxxxxxxxxxx            ©@£|§|©∞@£|§∞..........".ascii.midicps, inf)))}.play

{BLowPass4.ar(LFPulse.ar( Duty.ar([0.06, 0.05], 0, Dseq("xxxxxxxxxxxx            ©@£|§|©∞@£|§∞..........".ascii.midicps, inf))))}.play

//now rewrite any example from above as Ndef so that we can change it dynamically

Ndef(\text).play
Ndef(\text, {SinOsc.ar( Duty.ar(0.1, 0, Dseq("ABCDEFGHIJKLMNOPQRSTUVWXYZ".ascii.midicps, inf)))})
//you can keep changing the code and reevaluating the lines below - i.e. don't stop in between changes

Ndef(\text, {SinOsc.ar( Duty.ar(0.1, 0, Dseq("@@@@@@@@@@@@@@@@ @@@@@@ @ @@@@ z".ascii.midicps, inf)))!2})
Ndef(\text2, {SinOsc.ar( Duty.ar(0.1, 0, Dseq("@@@@@@@@@@@@@@@@ @@@@@@ @ @@@@ zo".ascii.midicps, inf)))!2}).play
Ndef(\text3, {SinOsc.ar( Duty.ar(0.1, 0, Dseq("@@@@@@@@@@@@@@@@ @@@@@@ @ @@@@ zoo".ascii.midicps, inf)))!2}).play
Ndef(\text4, {SinOsc.ar( Duty.ar(0.2, 0, Dseq("xxxxxx   ".ascii.midicps, inf)))!2}).play

NdefMixer(s) //makes a gui automatically
```

```supercollider
s.reboot;

Ndef(\ascii).play;

Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("lkjasdlkjalsjk".ascii.midicps, inf)), 0, 0.5)!2});

Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("A B C D".ascii.midicps, inf)), 0, 0.5)!2});

Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("A B C d".ascii.midicps, inf)), 0, 0.5)!2});

Ndef(\ascii).stop;
```

graphics
--

open sketches sketch_160114a to sketch_160114j in processing.

* [sketch_160114a](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114a/sketch_160114a.pde)
* [sketch_160114b](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114b/sketch_160114b.pde)
* [sketch_160114c](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114c/sketch_160114c.pde)
* [sketch_160114d](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114d/sketch_160114d.pde)
* [sketch_160114e](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114e/sketch_160114e.pde)
* [sketch_160114f](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114f/sketch_160114f.pde)
* [sketch_160114g](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114g/sketch_160114g.pde)
* [sketch_160114h](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114h/sketch_160114h.pde)
* [sketch_160114i](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114i/sketch_160114i.pde)
* [sketch_160114j](https://github.com/redFrik/udk14-Clicks_and_Cuts/tree/master/udk160114/sketch_160114j/sketch_160114j.pde)

![ascii0.png](ascii0.png?raw=true "ascii0.png")

![ascii1.png](ascii1.png?raw=true "ascii1.png")

![ascii2.png](ascii2.png?raw=true "ascii2.png")

reading
--

<https://en.wikipedia.org/wiki/ASCII_art>

<http://www.belpercomputing.com/wp-content/uploads/2015/12/ASCII-Table.svg>

extra
--

open Terminal and type `telnet towel.blinkenlights.nl`

also related...

[Rocky's Printer - Eye of the tiger on a dot matrix printer ](https://www.youtube.com/watch?v=u8I6qt_Z0Cg)
