Multiplicative, Subtractive what?
---
* `{CompatibleEmulatorName}\*.glsl` - Multiplicative Shaders
* `{CompatibleEmulatorName}\Subtractive\*.glsl` - Subtractive Shaders

The `Multiplicative Shader` is what is being presented.   
If your device is slower than an `i3-6100t iGPU` then you might have to use the `Subtractive Shader`.   

The 2 shaders differ in the final assembly of the image.
The subtractive shader will `subtract` a pixel value.
The multiplicative shader will `multiply` a pixel value.
This works because in the shader the RGB values are numbers from `0.0->000` to `1.0->255`.


The `Subtractive Shader` is just the variant of the `Shader` which should work better on slower devices.   
However both shaders use a minimum of `2 divission operations` instead of `1`, which I'm not particularly happy about for a `low-end` shader.
The `brightness` option from the `Multiplicative` shader isn't compatible with the `Subtractive` shader and is replaced with a `darkenning` tunable.

Those 2 methods will have a bit different effect on visuals, use whichever you preffer.
![SubtractiveShader](.images/Differences/SubtractiveMultiplicative.png)

Static and Dynamic
---
* `000-Static*.glsl`   - static scanline
* `000-Vertical*.glsl` - dynamic scanline

The `Dynamic scanline` is what is being presented.   
This is purely cosmetic, but yes the `Static` shader will perform better, because it simply does less computations.   

With the `Dynamic scanline`, the scanline moves from the bottom of the screen to the top and right to left.   
![Stative](.videos/Differences/StativeDynamic.webm)

Vertical VerticalAndHorizontal VerticalAndHorizontal2Speed
---
`VerticalAndHorizontal`/`VertAndHoriz` is what is being presented.     

`Vertical`/`Vert` subvariant only let's you have the `Vertical` scanline.   
`VerticalAndHorizontal`/`VertAndHoriz` it's in the name.   
The `VerticalAndHorizontal2Speed` subvariant of the `Dynamic scanline` let's you set independent speed for the `Vertical` and `Horizontal scanline` this is usefull if you make your `Horizontal scanline` less subtle and want it to move a little bit slower.

![2Speed](.videos/Differences/VertHorizontal2Speed.webm)
