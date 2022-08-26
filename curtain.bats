#!/usr/bin/env bats

@test "build_spec" {
    result="$(./curtain -t build_spec Z 1 2 4 4)"
    [[ "$result" == "Z L:1 T:2 W:4 H:4 R:5 B:6 M:3 N:4" ]]
}

@test "identify_screen" {
    S1="xx
        DP-1 connected (normal left inverted right x axis y axis)
           1920x1080i    60.00*+  50.00    59.94  
           1920x1080     60.00    50.00    59.94  
           2880x576      50.00  
           2880x480      60.00    59.94  
           1280x720      60.00    50.00    59.94  
           1440x576      50.00  
           1440x480      60.00    59.94  
           720x576       50.00  
           720x480       60.00    59.94  
           640x480       60.00    59.94  
        DP-2 disconnected (normal left inverted right x axis y axis)
        HDMI-1 disconnected (normal left inverted right x axis y axis)
        DP-3 connected primary 1920x1080+0+0 (normal left inverted right x axis y axis) 697mm x 392mm
           3840x2160     60.00 +  30.00    29.97  
           2560x1440     59.95  
           1920x1080     60.00*   59.94  
           1680x1050     59.95  
           1600x900      60.00  
           1280x1024     75.02    60.02  
           1440x900      59.89  
           1280x800      59.81  
           1152x864      75.00  
           1280x720      60.00    59.94  
           1024x768      75.03    70.07    60.00  
           832x624       74.55  
           800x600       72.19    75.00    60.32    56.25  
           640x480       75.00    72.81    66.67    60.00    59.94  
           720x400       70.08  
        DP-4 connected (normal left inverted right x axis y axis)
           1920x1080i    60.00 +  50.00    59.94  
           1920x1080     60.00    50.00    59.94  
           2880x576      50.00  
           2880x480      60.00    59.94  
           1280x720      60.00    50.00    59.94  
           1440x576      50.00  
           1440x480      60.00    59.94  
           720x576       50.00  
           720x480       60.00    59.94  
           640x480       60.00    59.94  
        HDMI-2 disconnected (normal left inverted right x axis y axis)"
    result="$(echo "$S1" | ./curtain -t identify_screen)"
    expected="$(echo -e "DP-1 1920 1080\nDP-3 1920 1080")"
    [[ "${result}" == "$expected" ]]
}

@test "xdotool_getwindowgeometry_to_details" {
    X="Window 83886095
  Position: 211,213 (screen: 0)
  Geometry: 1763x1777"
    result="$(echo "$X" | ./curtain -t xdotool_getwindowgeometry_to_details)"
    expected="211 213 1763 1777"
    [[ "${result}" == "$expected" ]]
}
