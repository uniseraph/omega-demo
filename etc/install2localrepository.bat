
rmdir /S /Q "%USERPROFILE%\.m2\repository\com\omega\demo\omega-demo"
rmdir /S /Q "%USERPROFILE%\.m2\repository\com\omega\demo\omega-demo-api"



call mvn install:install-file -DgroupId=com.omega.demo -DartifactId=omega-demo-api -Dversion=0.1 -Dfile=lib/omega-demo-api-0.1.jar  -DgeneratePom=true -Dpackaging=jar

