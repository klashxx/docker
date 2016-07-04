#!/bin/bash

readonly SW_IMG="klashxx/centpy"

docker build --tag=$SW_IMG -f Dockerfile .
