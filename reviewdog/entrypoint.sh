#!/bin/sh
CI_SERVICE="common"

if [ "${CI_SERVICE}" != "" ] && [ "${CIRCLECI}" = "true" ]; then
  echo "CiecleCI detected"
  CI_SERVICE="circleci"
fi

if [ "${CI_SERVICE}" != "" ] && [ "${TRAVIS}" = "true" ]; then
  echo "Travis CI detected"
  CI_SERVICE="travis"
fi

if [ "${CI_SERVICE}" != "" ] && [ "${DRONE}" = "true" ]; then
  echo "Drone detected"
  CI_SERVICE="droneio"
fi

echo "Reviewing codes"
reviewdog -ci="${CI_SERVICE}"
