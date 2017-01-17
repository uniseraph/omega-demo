#!/usr/bin/env bash

rm ~/.m2/repository/com/omega/framework/omega-demo
rm ~/.m2/repository/com/omega/framework/omega-demo-api



mvn install:install-file -DgroupId=com.omega.demo -DartifactId=omega-demo-api -Dversion=0.1 \
  -Dfile=lib/omega-demo-api-0.1.jar  -DgeneratePom=true -Dpackaging=jar

