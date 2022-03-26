# Bypass TLS/SSL Verification Self-Hosted Runner

```bash
export DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0
```

# GitHub App Create Auth Token for Installation

```bash
  jwt encode --alg RS256 --iss 96520 --exp "+5 min" -S @/Users/quinnsmith/_Projects/QSmith/webhook-github/q-smith-gitapp-key-private.pem
  jwt encode --alg RS256 --iss 1 --exp "+5 min" -S @//Users/quinnsmith/Research/ghapps/app.private-key.pem
  echo <jwt> | jwt decode -
  curl <auth API> | jq -r .access_token | jwt decode -
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: Bearer <bearer>" \
    https://github.<redacted>.com/api/v3/app/installations
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: Bearer <bearer>" \
    -d '{"repositories":["incubating-todo-webapi-go", "demo-java-maven", "actions-cache"]}' \
    https://github.<redacted>.com/api/v3/app/installations/1/access_tokens
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: token v1.abcdef" \
    https://github.<redacted>.com/api/v3/installation/repositories
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: token v1.abcdef" \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/incubating-todo-webapi-go/git/trees/d261076620a1f323ca8ecfd781f6c0a0cecba5b1


  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/astro-demo-java-maven/commits/a87dc57cd0ba323fe80a109f7137e2220011e9c7/check-suites
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/astro-demo-java-maven/check-suites/51
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/astro-demo-java-maven/check-runs/1
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    -d '{"name":"ci job", "status":"in_progress", "head_sha":"209d702fb8698e52c979a1c6ab017ec07a068344"}' \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/demo-java-maven/check-runs
  curl -i \
    -X PATCH \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    -d '{"name":"ci job", "head_sha":"209d702fb8698e52c979a1c6ab017ec07a068344", "status":"completed","conclusion":"success", "output":{"title":"some title","summary":"some summary","text":"some text","completed_at":"2021-04-21T04:12:07Z"}' \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/demo-java-maven/check-runs/5

  # WARNING: Commit Statuses are Immutable
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.abcdef" \
    -d '{"context":"astro","state":"success", "description":"master desc"}' \
    https://github.<redacted>.com/api/v3/repos/QuinnSmith/demo-java-maven/statuses/d3cf61320a8de96f3550a91c7fb67c6d53db9cac


  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: Bearer <bearer>" \
    https://api.github.com/app/installations
  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: Bearer <bearer>" \
    -d '{"repositories":["todo-webapi-go"]}' \
    https://api.github.com/app/installations/14122601/access_tokens
  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token ghs_abcdef" \
    https://api.github.com/installation/repositories
  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token ghs_abcdef" \
    https://api.github.com/repos/Q-Smith/todo-webapi-go/actions/secrets/AWS_KEY
```

# References

- https://github.blog/2021-03-04-4-things-you-didnt-know-you-could-do-with-github-actions/
- https://github.blog/2021-04-05-behind-githubs-new-authentication-token-formats/
- https://docs.github.com/en/enterprise-server@3.0/github/setting-up-and-managing-your-github-profile/managing-your-profile-readme
