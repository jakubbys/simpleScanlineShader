/*
[configuration]
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
[/configuration]
*/
void main() {
	float2 coords = GetCoordinates();
	float2 colLine = GetWindowResolution();
	colLine /= float2(HORIZONTAL_SIZE, VERTICAL_SIZE);

	int2 colLineIndex = int2((coords)*colLine);

	float2 colLineIntensity = mod(colLineIndex, 2);

	float4 c = Sample() * clamp(colLineIntensity.y, VERTICAL_INTENSITY, 1.0) * clamp(colLineIntensity.x, HORIZONTAL_INTENSITY, 1.0);
	SetOutput(c);
}