Detuning scanlines shader
---
Detuning scanlines shader is a cheap scanline shader for low-end devices(verified on an i3-6100T iGPU).    
The shader is pre-tuned for use with 1080p screens at default settings.

The main project goals were to:
1. To act as a smooth introduction to shaders, this is my "Hello shader". (I'm not sure if the configuration options are runtime inputs or should I treat them like compile-time macro varriables).
2. I wanted to see how scanlines shader would look on gamecube.

How to use it?
---
Just drag and drop it from and into the relevent shader folder:
* [Dolphin](Dolphin.md)
* [Duckstation](Duckstation.md)
* You might have luck using this shader in other emulators of your choice.

Generic tuning instructions:
1. Start the game.
2. Pick the scanline size.
3. Pick the speed you would like to use.
4. Set Vertical/Horizontal brightness to 1.0 and Horizontal/Vertical to 0.0.
5. Tune the `time sync` of the shader as such that no jarring jump occurs (you have to use magnifiying glass program/item, high speed phone camera, get really close to the screen and tune).
6. Done. If you have a really good tune or use multiples of the speed you tuned then for the most part you might be able to just omit the steps 4 and 5.

[Shader differences](Shader.md).

Results
---
Before and after:
![montage](.videos/1080p_montage.webm)

Linear scalling vs Nearest/AreaSampling.
---
Do note this shader can be used both with nearest and linear resolution scalling.    
Best case scenario non-pixel art 2D, 3D:    
![Best case](.images/Zelda/00.png)
![Best case](.images/Zelda/01.png)
![Best case](.images/AutoModelista/00.png)
![Best case](.images/TimeSplitters2/00.png)

AntiAliassing:    
![AA case](.images/Zelda/00_AA.png)

Worst case scenario 2D pixel art, white backgrounds:    
![Worst case](.images/CapcomSNK2/00.png)
![Worst case](.images/CapcomSNK2/01.png)
![Worst case](.images/CapcomSNK2/02.png)
![Worst case](.images/Zelda/00_WhiteBackground.png)
![Worst case](.images/Auto_Modelista/00_WhiteBackground.png)

Possible changes that can be introduced in the future:
---
1. Auto-tuning given the resolution and speed.
2. I'm not very happy that I had to use 2 divissions(modulo and ) instead of 1(modulo) for static scanlines.

Known won't fix issues:
---
1. When chainging resolution from default window size to fullscreen you might see that a couple first frames produce a glitched result.
2. Use of modulo with an incrementing FP32 value(from `getTime()`) eventually leads to a `detune`. Basically floating-point numbers get less accurate the bigger they are leading to a `detune`, however in regular play sessions of 2 hours I haven't noticed the issue occuring. I do hope it shouldn't occur during 4 hour long sessions.
3. I don't have an `1440p` nor `4k` screen, I can't synchronize the scanlines for those types of screens, I can however tune it to any resolution that is confined to `1080p`.
4. When loading occurs the scanlines stop moving and a `big jump` occurs. This is, because the post-processing pass stops when the game doesn't push a frame. Also do note the shader operates on the `game session playtime` rather than `frame count`.

License
---
MIT License, afaik feel free to use in commercial projects without attribution and without sharing back the source code.