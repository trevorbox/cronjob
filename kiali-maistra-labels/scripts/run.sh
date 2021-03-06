#!/bin/bash

echo "Starting job at $(date)..."

OUT=$(oc get projects -o go-template=$'{{range .items}}{{with .metadata}}{{if .labels}}{{ $kiali:=("" | or (index .labels "kiali.io/member-of")) }}{{ $maistra:=("" | or (index .labels "maistra.io/member-of")) }}{{if ne $kiali $maistra}}Mismatch => project:{{.name}} kiali.io/member-of:{{$kiali}} maistra.io/member-of:{{$maistra}}\n{{end}}{{end}}{{end}}{{end}}')

echo "$OUT"

if [ -z "$OUT" ]; then echo "No mismatches found."; fi

echo "Done at $(date)."