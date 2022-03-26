# Random Notes

```bash
gcloud compute ssh --project $GCP_PROJECT_ID --zone us-east1-b guenld-e01 -- -N -p 22 -D 192.168.5.206:8443

gcloud compute ssh \
  guenld-e01 \
  --tunnel-through-iap \
  --zone=us-east1-b \
  --project=$GCP_PROJECT_ID \
  -- -N \
  -4 \
  -L 3000:34.139.200.71:3000 \
  -L 9090:34.139.200.71:9090 \
  -L 16686:34.139.200.71:16686 \
  -L 20001:34.139.200.71:20001
```

```bash
HTTPS_PROXY=socks5://192.168.5.206:8443
curl --proxy socks5://192.168.5.206:8443 --header "Authorization: Bearer $TOKEN" --cacert /Users/quinnsmith/Downloads/ca.crt $APISERVER/api/v1/namespaces/kube-system/pods

vscode --proxy-server=socks5://192.168.5.206:8443 .
```

### [SMTP Test]

```bash
\> telnet
\> set localecho
\> OPEN mail1.fabrikam.com 25
\> EHLO contoso.com
\> MAIL FROM: <chris@contoso.com>
250 2.1.0 Sender OK
\> RCPT TO: <kate@fabrikam.com> NOTIFY=success,failure
250 2.1.5 Recipient OK
\> DATA
354 Start mail input; end with <CRLF>.<CRLF>
Subject: test

This is a test message.
.
250 Queued mail for delivery
\> QUIT
```
