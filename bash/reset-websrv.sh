#!/usr/bin/env bash

# One-liner to reset websrv
sed -i '/^185.193.125.246/ d' ~/.ssh/known_hosts && cat ~/.ssh/websrv.pub | xclip -sel c
