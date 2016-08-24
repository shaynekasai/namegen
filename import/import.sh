#!/usr/bin/env bash

# This script imports raw first names and surnames from cencus data
# all columns are retained in case we want to add features around
# properties. 

sqlite3 ../namegen.db < import.sql

