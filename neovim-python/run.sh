#!/bin/bash
set -e

nvim -c 'UpdateRemotePlugins' -c 'qall!' >/dev/null
