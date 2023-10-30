#!/bin/bash

CREDS_FILE="PUT_DIR_HERE"
CREDS="$(ls $CREDS_FILE | choose)"

pw="$(cat "$CREDS_FILE/$CREDS" | tr -d "\n" | pbcopy)"
