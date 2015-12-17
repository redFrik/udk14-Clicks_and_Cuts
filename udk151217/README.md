glitches
--

doing it all 'wrong'

```
{Limiter.ar(Saw.ar(1)%Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)|Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)<Saw.ar(8))}.play
{Limiter.ar(Saw.ar([1, 1.1])<Saw.ar(8))}.play
{Limiter.ar(Saw.ar(1)&Saw.ar(8))}.play
{sin(Saw.ar(1)+Saw.ar(8)+Saw.ar(0.25))}.play
{Limiter.ar(Saw.ar(8, SinOsc.ar([50, 51])))}.play
{Limiter.ar(Saw.ar(8, Saw.ar([50, 51])))}.play
```


download and install sc3 plugins (3.6 SC3ExtPlugins-universal.dmg for osx, sc3-plugins-3.6.0-win32.zip for win)

http://sourceforge.net/projects/sc3-plugins/files/

```
{Limiter.ar(GlitchBPF.ar(Saw.ar([500, 600]), -2, 1000))}.play
{Limiter.ar(FreeVerb.ar(GlitchBPF.ar(Saw.ar, Saw.ar(1), SinOsc.ar([0.4, 0.5])*2000)))}.play
{Limiter.ar(GlitchRHPF.ar(SinOsc.ar(1000), Saw.ar(8)*2, SinOsc.ar([4.01, 3.06])*2000))}.play
```
