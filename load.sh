#!/bin/bash
ssh $1 'bash -s' < clean.sh
ssh $1 'docker load' < bokeneko_crawlnet_docker_image.tar.gz
ssh $1 'bash -s' < run_worker.sh
