#!/bin/bash

echo "Get dart dependencies"
dart pub get
echo "Run server and apply migrations"
dart bin/main.dart --apply-migrations