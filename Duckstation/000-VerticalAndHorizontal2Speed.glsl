/*
[configuration]
[OptionRangeFloat]
GUIName = Horizontal scanline speed
OptionName = HORIZONTAL_SPEED
MinValue = 0
MaxValue = 0.06
StepAmount = 0.001
DefaultValue = 0.012

[OptionRangeFloat]
GUIName = Vertical scanline speed
OptionName = VERTICAL_SPEED
MinValue = 0
MaxValue = 0.06
StepAmount = 0.001
DefaultValue = 0.006

[OptionRangeFloat]
GUIName = Horizontal scanline brigthness
OptionName = HORIZONTAL_INTENSITY
MinValue = 0
MaxValue = 1
StepAmount = 0.0025
DefaultValue = 0.9825

[OptionRangeFloat]
GUIName = Vertical scanline brigthness
OptionName = VERTICAL_INTENSITY
MinValue = 0
MaxValue = 1
StepAmount = 0.01
DefaultValue = 0.88

[OptionRangeFloat]
GUIName = Horizontal scanline size
OptionName = HORIZONTAL_SIZE
MinValue = 1
MaxValue = 8
StepAmount = 1.0
DefaultValue = 2.0

[OptionRangeFloat]
GUIName = Vertical scanline size
OptionName = VERTICAL_SIZE
MinValue = 1
MaxValue = 8
StepAmount = 1.0
DefaultValue = 2.0

[OptionRangeFloat]
GUIName = Time sync horizontal
OptionName = SYNC_HORIZONTAL
MinValue = 0
MaxValue = 8
StepAmount = 0.001
DefaultValue = 1.00

[OptionRangeFloat]
GUIName = Time sync vertical
OptionName = SYNC_VERT
MinValue = 0
MaxValue = 8
StepAmount = 0.001
DefaultValue = 1.24

[/configuration]
*/
void main() {
	float timeMillis = GetTime() / float(1000.0);
	float2 pos = float2(fmod(timeMillis, float(SYNC_HORIZONTAL)), fmod(timeMillis, float(SYNC_VERT)));
	pos *= float2(HORIZONTAL_SPEED, VERTICAL_SPEED);

	float2 coords = GetCoordinates();
	float2 colLine = GetWindowResolution();
	colLine /= float2(HORIZONTAL_SIZE, VERTICAL_SIZE);

	int2 colLineIndex = int2((coords+pos)*colLine);

	float2 colLineIntensity = fmod(colLineIndex, 2);

	float4 c = Sample() * clamp(colLineIntensity.y, VERTICAL_INTENSITY, 1.0) * clamp(colLineIntensity.x, HORIZONTAL_INTENSITY, 1.0);
	SetOutput(c);
}