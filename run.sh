#!/bin/sh -
gdbus monitor --system --dest net.hadess.SensorProxy --object-path /net/hadess/SensorProxy | sudo /home/tristan/code/onemix-tools/watch-screen.rb
