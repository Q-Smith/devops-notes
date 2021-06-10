# Introduction

Add "svc-macroscope-readaccess" as a Collaborator to Repo if it cant scan
URLs must contain a ".git"

```bash
curl -X POST \
  -H "Content-Type: application/json" \
  --data '{"branch":"master","build_commit_id":"d3cf61320a8de96f3550a91c7fb67c6d53db9cac","repourl":"https://github.<redacted>.com/QuinnSmith/astro-demo-java-maven.git"}' \
  https://apis-dev.<redacted>.com/macroscope/notify/build
```

```bash
curl https://apis-dev.<redacted>.com/macroscope/api/v2/engagements?name=d3cf61320a8de96f3550a91c7fb67c6d53db9cac
curl https://apis-dev.<redacted>.com/macroscope/api/v2/findings?test__engagement=149
```
