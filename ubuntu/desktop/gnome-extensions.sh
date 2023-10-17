#!/usr/bin/env bash

pipx install gnome-extensions-cli --system-site-packages

gext install caffeine@patapon.info
gext install blur-my-shell@aunetx
gext install clipboard-history@alexsaveau.dev
gext install freon@UshakovVasilii_Github.yahoo.com
gext install wintile@nowsci.com

gext enable caffeine@patapon.info
gext enable blur-my-shell@aunetx
gext enable clipboard-history@alexsaveau.dev
gext enable freon@UshakovVasilii_Github.yahoo.com
gext enable wintile@nowsci.com
