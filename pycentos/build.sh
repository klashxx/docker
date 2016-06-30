#!/bin/bash

readonly SW_IMG="minfedora/python27"


docker build --tag=$SW_IMG -f Dockerfile .
