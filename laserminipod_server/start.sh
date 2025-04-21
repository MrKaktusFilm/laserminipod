#!/bin/bash

echo "Get dart dependencies"
dart pub get
echo "Generate necessary serverpod files
dart run serverpod generate"
echo "Run server and apply migrations"
dart bin/main.dart --apply-migrations