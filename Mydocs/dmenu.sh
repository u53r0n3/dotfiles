#!/bin/bash

FONT="FiraCode Nerd Font-12"
NB="#1d1f21" #Normal background
NF="#c5cbc6" #Normal foreground
SB="#81a2be" #Selected background
SF="#ffffff" #Selected foreground

#launch dmenu
dmenu_run -fn "$FONT" -nb "$NB" -nf "$NF" -sb "$SB" -sf "$SF"
