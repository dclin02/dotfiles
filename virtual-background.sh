#!/bin/bash
sudo modprobe v4l2loopback devices=1  exclusive_caps=1 video_nr=2 card_label="Virtual Background"

cd /home/berin/Linux-Fake-Background-Webcam/
bash -c "python fake.py --no-foreground -C MJPG --fps 30 -W 1920 -H 1080"
