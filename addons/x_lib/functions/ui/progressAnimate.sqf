/* ----------------------------------------------------------------------------
Function: SpyderAddons_fnc_progressAnimate

Description:
Fills or drains a progress bar over the specified period of time

Parameters:
Control - Progress bar
Scalar - Time required to complete animation
Code - Code to execute upon bar being fully filled (disableSerialization must be called in this code to avoid popup errors)
Bool - If true, bar will reset to 0 after reaching 1

Returns:
None

Examples:
(begin example)
(end)

See Also:
- nil

Author: SpyderBlack723
---------------------------------------------------------------------------- */

disableSerialization;
params [
	"_bar",
	"_time",
	["_reset", true]
];

_startTime = time;

while {!isNull _bar && {progressPosition _bar != 1}} do {
	_bar progressSetPosition ((time - _startTime) / _time);
};

if !(isNull _bar) then {
	if (_reset) then {
		_bar progressSetPosition 0;
	};
};