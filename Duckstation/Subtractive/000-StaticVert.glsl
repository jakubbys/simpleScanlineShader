/*
[configuration]
[OptionRangeFloat]
GUIName = Vertical scanline darkenning
OptionName = VERTICAL_INTENSITY
MinValue = 0
MaxValue = 1
StepAmount = 0.01
DefaultValue = 0.03

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
	float lineCount = GetWindowResolution().y/VERTICAL_SIZE;
	int lineIndex = int((coords.y) * lineCount);

	float lineIntensity = mod(float(lineIndex), 2);

	float4 c = Sample() - clamp(lineIntensity, 0.0, VERTICAL_INTENSITY);
	SetOutput(c);
}