#!/bin/sh

udevadm control --reload-rules && udevadm trigger

