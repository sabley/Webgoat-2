sleep 2
curl -i --user 'admin:admin123' -X POST "http://localhost:8081/service/rest/v1/staging/move/maven-test?tag=build-126" -H  "accept: application/json"
sleep 2
