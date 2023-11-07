#!/usr/bin/env bash

pipx install gnome-extensions-cli --system-site-packages


"$HOME"/.local/bin/gext install caffeine@patapon.info
"$HOME"/.local/bin/gext install blur-my-shell@aunetx
"$HOME"/.local/bin/gext install clipboard-history@alexsaveau.dev
"$HOME"/.local/bin/gext install freon@UshakovVasilii_Github.yahoo.com

"$HOME"/.local/bin/gext enable caffeine@patapon.info
"$HOME"/.local/bin/gext enable blur-my-shell@aunetx
"$HOME"/.local/bin/gext enable clipboard-history@alexsaveau.dev
"$HOME"/.local/bin/gext enable freon@UshakovVasilii_Github.yahoo.com
