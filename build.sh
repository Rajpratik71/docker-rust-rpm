#!/bin/sh

exec docker build -t registry.gitlab.com/infinidat/docker-rust-rpm $@ .
