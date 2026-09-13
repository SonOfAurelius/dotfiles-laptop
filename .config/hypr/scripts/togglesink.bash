#!/bin/bash
ACTIVE_SINK_ID=$(pactl list short sinks | grep RUNNING | head --bytes 2)
FOCUSRITE_SINK_ID=$(pactl list short sinks | grep Focusrite | head --bytes 2)
FIIO_SINK_ID=$(pactl list short sinks | grep FiiO | head --bytes 2)

if [ "$ACTIVE_SINK_ID" == "$FOCUSRITE_SINK_ID" ]; then
    pactl set-default-sink "$FIIO_SINK_ID"
else
    pactl set-default-sink "$FOCUSRITE_SINK_ID"
fi

