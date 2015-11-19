s.boot;

//edit to match your own soundfile
b= Buffer.read(s, "/Users/asdf/musicradar-nu-disco-samples/125bpm Loops n Lines/Main Beats/ND_BeatA125-01.wav");

//downsample 1000Hz
{Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), Impulse.ar(1000))}.play;

//downsample with mouse control
{Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//downsample with delay
{Latch.ar(DelayN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 2, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//downsample with echo
{Latch.ar(CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2), Impulse.ar((SampleRate.ir*MouseX.kr(0, 0.5)).poll))}.play;

//bitreduction
{PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**3)}.play;

//bitreduction with mouse control
{PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**MouseX.kr(0.01, 10).poll)}.play;

//ring modulation 400Hz
{PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(400)}.play

//ring modulation with mouse control
{PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//ring modulation with delay
{DelayN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 2, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//ring modulation with echo
{CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2)*SinOsc.ar(MouseX.kr(1, 1000).poll)}.play

//downsample and bitreduce with mouse x/y
{Latch.ar(CombN.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1), 0.25, 0.25, 2).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5))))}.play

//same but effects in different order
{CombN.ar(Latch.ar(PlayBuf.ar(b.numChannels, b, 1, loop:1).round(0.5**MouseX.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)}.play

//+ring modulation
{CombN.ar(Latch.ar((PlayBuf.ar(b.numChannels, b, 1, loop:1)*SinOsc.ar(MouseX.kr(1, 1000, 1))).round(0.5**MouseY.kr(0.01, 10)), Impulse.ar((SampleRate.ir*MouseY.kr(0, 0.5)))), 0.25, 0.25, 2)}.play
