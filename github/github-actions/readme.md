# Bypass TLS/SSL Verification Self-Hosted Runner

export DOTNET_SYSTEM_NET_HTTP_USESOCKETSHTTPHANDLER=0

# GitHub App Create Auth Token for Installation

```bash
  jwt encode --alg RS256 --iss 96520 --exp "+5 min" -S @/Users/quinnsmith/_Projects/QSmith/astro-webhook-github/q-smith-gitapp-key-private.pem
  jwt encode --alg RS256 --iss 1 --exp "+5 min" -S @//Users/quinnsmith/_Projects/GPN/Research/ghapps/astro-app.private-key.pem
  echo <jwt> | jwt decode -
  curl <auth API> | jq -r .access_token | jwt decode -
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MTM1Mzg4MjIsImlhdCI6MTYxMzUzODUyMiwiaXNzIjoiMSJ9.z0V1B3zGZTJgK49jbJ75srmQC02vkcNZYbGnwzXAU8eWO_P0dRbK0KS6XUYm3GA47Kqxojv5PRv5kfzu9GqERsK_WioE3pc_esr6MK8aurCPu8noYwjXvVT6sNIDhuTEEZ5mAIenIEmdlgZ5hiV1KMVagQgS5kMsCwkOWLqwJKLdjAENs83HB_FmWerSpuY82wF9WMYgqT0YkF-PzpyksV1Y_tBKMA17dVHyyMIUUiwozjP4iVe4DanIXef9Qhk7PezyrfrhdG8IRWg-djloSV0WHRMeLc1no1bkhKbMy8scxGJjDmjtj2BaiTcd7j3jPTb8WnTUq5W-8I-8c6lT9w" \
    https://github.globalpay.com/api/v3/app/installations
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MTM1Mzg4MjIsImlhdCI6MTYxMzUzODUyMiwiaXNzIjoiMSJ9.z0V1B3zGZTJgK49jbJ75srmQC02vkcNZYbGnwzXAU8eWO_P0dRbK0KS6XUYm3GA47Kqxojv5PRv5kfzu9GqERsK_WioE3pc_esr6MK8aurCPu8noYwjXvVT6sNIDhuTEEZ5mAIenIEmdlgZ5hiV1KMVagQgS5kMsCwkOWLqwJKLdjAENs83HB_FmWerSpuY82wF9WMYgqT0YkF-PzpyksV1Y_tBKMA17dVHyyMIUUiwozjP4iVe4DanIXef9Qhk7PezyrfrhdG8IRWg-djloSV0WHRMeLc1no1bkhKbMy8scxGJjDmjtj2BaiTcd7j3jPTb8WnTUq5W-8I-8c6lT9w" \
    -d '{"repositories":["incubating-todo-webapi-go"]}' \
    https://github.globalpay.com/api/v3/app/installations/1/access_tokens
  curl -i \
    -H "User-Agent: Astro" \
    -H "Accept: application/vnd.github.machine-man-preview+json" \
    -H "Authorization: token v1.84521b2683a15a7f856b84557698eac9415a8bff" \
    https://github.globalpay.com/api/v3/installation/repositories

  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2MTI5Njg3MjgsImlhdCI6MTYxMjk2ODQyOCwiaXNzIjoxfQ.gdJQ2MdfMZHfkkQnM-pppD5bYS71Ffyi3jtQwPzfzbmKxZKWzRk-Q2f1DxAq0z12xqeUj7vdC1mO6l7NgExjVMqjT1zs5RmsLQsjyYP2roWXxh_EKaS6UTsFpxrdY5kaMVpN9RJ0KRORlasf5o8dIWuCoBDMUKjZHVxrjSEAjVC-Z5yvudUC9ap7YZCr32v0Wlchd_PaOwOruXjKtyvHXzaey9XS7oA8R4jcnPT3gwd0vWij8hD4wy6tdO1c-VxaWkgQCCwrU4SBIpU8F_z30g0fvuVsia53U4h7Kpl6eT69ai9rOvdc7NMBjbhvcAn27VEoiNKIPvg7cpqnKF5cLA" \
    https://api.github.com/app/installations
  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJleHAiOjE2MTI5Njg1NTYsImlhdCI6MTYxMjk2ODI1NiwiaXNzIjo5NjUyMH0.yAFCmM7dibyAvlXvM4qhk6vXIK8T3JDSuLZUocp_LCQfCFek4IaQTuKUKZB0g1-glgm531WWV9lb19X_eLXS8s4GR2VT_zZuQ1Z5PCAVb1qjLCPdfhD6zysO4o-pkLrCA_k153ShjpJ_RQPvadb01EnWFW9PP4eEy67W_bwuYFT9jULvdJTAZPaU_KSxdKUSVi43BAfFE4_ZmGGgUnh5yDLUDgZX3zHLPBEFRLUAKEs73UPVnyTW-hUnaoV7NNS5tfnktP9s4EpWcj3HVa8EWgiMDpZPlXZtuZ6gC_izRngqRx6lkvw9XgrvA2pOdPNLWy9yeV0mShmiGzHrYD_U4w" \
    -d '{"repositories":["todo-webapi-go"]}' \
    https://api.github.com/app/installations/14122601/access_tokens
  curl -i \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token v1.480fb0fd4cc1fde7e887061ac79b56959a84dd35" \
    https://api.github.com/installation/repositories
```