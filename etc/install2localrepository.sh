#!/usr/bin/env bash


 mvn install:install-file -DgroupId=com.omega.demo -DartifactId=omega-demo-api -Dversion=0.1 \
  -Dfile=lib/omega-demo-api-0.1.jar  -DgeneratePom=true -Dpackaging=jar

