/*
[configuration]
[OptionRangeFloat]
GUIName = Horizontal scanline darkenning
OptionName = HORIZONTAL_INTENSITY
MinValue = 0
MaxValue = 1
StepAmount = 0.0025
DefaultValue = 0.0075

[OptionRangeFloat]
GUIName = Horizontal scanline darkenning
OptionName = HORIZONTAL_INTENSITY
MinValue = 0
MaxValue = 1
StepAmount = 0.0025
DefaultValue = 0.0075

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

	float4 c = Sample() - clamp(colLineIntensity.y, 0.0, VERTICAL_INTENSITY) - clamp(colLineIntensity.x, 0.0, HORIZONTAL_INTENSITY);
	SetOutput(c);
}