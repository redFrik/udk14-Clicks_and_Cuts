s.boot;

//downsample 1000Hz
{Latch.ar(SoundIn.ar, Impulse.ar(1000))!2}.play;

//downsample with mouse control
{Latch.ar(SoundIn.ar, Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//downsample with delay
{Latch.ar(DelayN.ar(SoundIn.ar, 2, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//downsample with echo
{Latch.ar(CombN.ar(SoundIn.ar, 0.25, 0.25, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))!2}.play;

//bitreduction
{SoundIn.ar.round(0.5**3)!2}.play;

//bitreduction with mouse control
{SoundIn.ar.round(0.5**MouseX.kr(0.01, 10).poll)!2}.play;

//ring modulation 400Hz
{SoundIn.ar*SinOsc.ar(400)!2}.play

//ring modulation with mouse control
{SoundIn.ar*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//ring modulation with delay
{DelayN.ar(SoundIn.ar, 2, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//ring modulation with echo
{CombN.ar(SoundIn.ar, 0.25, 0.25, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)!2}.play

//downsample and bitreduce with mouse x/y
{Latch.ar(CombN.ar(SoundIn.ar, 0.25, 0.25, 2).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5))))!2}.play

//same but effects in different order
{CombN.ar(Latch.ar(SoundIn.ar.round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)!2}.play

//+ring modulation
{CombN.ar(Latch.ar((SoundIn.ar*SinOsc.ar(MouseX.kr(1, 1000, 1))).round(0.5**MouseY.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)!2}.play
