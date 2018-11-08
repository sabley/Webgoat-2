sleep 2
curl -i --user 'admin:admin123' -X POST "http://localhost:8081/service/rest/v1/tags/associate/build-126?maven.groupId=com.mycompany" -H  "accept: application/json"
sleep 2
