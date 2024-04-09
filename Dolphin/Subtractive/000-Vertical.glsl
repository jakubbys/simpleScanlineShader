/*
[configuration]
[OptionRangeFloat]
GUIName = Scanline speed
OptionName = SPEED
MinValue = 0
MaxValue = 0.06
StepAmount = 0.001
DefaultValue = 0.012

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

[OptionRangeFloat]
GUIName = Time sync
OptionName = SYNC
MinValue = 0
MaxValue = 8
StepAmount = 0.001
DefaultValue = 1.24

[/configuration]
*/
void main() {
	float currentMillis = mod(GetTime() / float(1000.0), float(SYNC)) * SPEED;
	float2 coords = GetCoordinates(); 
	float lineCount = GetWindowResolution().y / VERTICAL_SIZE;

	int lineIndex = int((coords.y + currentMillis) * lineCount);

	float lineIntensity = mod(float(lineIndex), 2);

	float4 c = Sample() - clamp(lineIntensity, 0.0, VERTICAL_INTENSITY);
	SetOutput(c);
}