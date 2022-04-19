#!/bin/bash
[ $USER != root ] && echo $USER || echo root
[ $USER = root ] && echo $USER || echo root