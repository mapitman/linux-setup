#!/usr/bin/env bash

pipx install gnome-extensions-cli --system-site-packages

gext install caffeine@patapon.info
gext install blur-my-shell@aunetx
gext install clipboard-history@alexsaveau.dev
gext install tiling-assistant@leleat-on-github
gext install freon@UshakovVasilii_Github.yahoo.com

gext enable caffeine@patapon.info
gext enable blur-my-shell@aunetx
gext enable clipboard-history@alexsaveau.dev
gext enable tiling-assistant@leleat-on-github
gext enable freon@UshakovVasilii_Github.yahoo.com
