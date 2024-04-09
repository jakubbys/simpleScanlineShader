Shader installation instructions
---
If your computer can't pick up try the `000-Static` shaders or `substractive\` shader:
* [Substractive](Dolphin/Subtractive)
* [000-StaticVert.glsl](Dolphin/000-StaticVert.glsl)
* [000-StaticVertAndHoriz.glsl](Dolphin/000-StaticVertAndHoriz.glsl)

Common
---
Copy the relevant `.glsl` file onto the Shader directory.   
Those files can be found in the [dolphin folder](Dolphin/).
Make sure to enable the shader in the graphics settings (enhancements -> post processing) like so:
![image](https://github.com/jakubbys/simpleScanlineShader/assets/163762443/34081243-f26e-4471-b54f-415563e94c08)


Windows
---
Installation folder:
`YourDolphinInstallationFolder\Sys\Shaders`
For example:
`C:\Users\jakubby\Desktop\Dolphin-x64\Sys\Shaders`

MacOS
---
Installation folder:
\>\_\< I don't own a Mac, you're on your own.


Linux(flatpak)
---
Installation folder:
(requires root to write to this folder) `/var/app/app.org.DolphinEmu.dolphin-emu/x86_64/stable/{randomNumbersHere}/files/shader/dolphin-emu/sys/Shader` (might get replaced with updates \>\_\<)
(doesn't require root, doesn't work) `~/.var/app/org.DolphinEmu.dolpgin-emu/data/dolphin-emu/Shaders`

Linux(native)
---
Installation folder:
`~/.local/share/dolphin-emu/Shaders`

Linux(snap)
---
\>\_\< Later, do try the native folder first.


