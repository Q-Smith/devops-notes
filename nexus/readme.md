# Intro

docker pull sonatype/nexus3
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3
