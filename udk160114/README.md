ascii
--

ascii art, ascii graphics using processing and supercollider

open sketch_160114a in processing.

sound
--

supercollider...

```
s.boot

Ndef(\ascii).play;

//you can keep changing the code and reevaluating the lines below - i.e. don't stop in between changes
Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("lkjasdlkjalsjk".ascii.midicps, inf)), 0, 0.5)!2});

Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("A B C D".ascii.midicps, inf)), 0, 0.5)!2});

Ndef(\ascii, {SinOsc.ar(Duty.ar(0.1, 0, Dseq("A B C d".ascii.midicps, inf)), 0, 0.5)!2});
```

reading
--

<https://en.wikipedia.org/wiki/ASCII_art>

<http://www.belpercomputing.com/wp-content/uploads/2015/12/ASCII-Table.svg>

extra
--

open Terminal and type `telnet towel.blinkenlights.nl`

also related...

[Rocky's Printer - Eye of the tiger on a dot matrix printer ](https://www.youtube.com/watch?v=u8I6qt_Z0Cg)
