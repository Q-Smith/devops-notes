# Notes

```bash
dapr uninstall --all
dapr init --slim --runtime-version 1.1.0
dapr --version (runtime & cli must match)

dapr run --app-id nodeapp --app-port 3000 --dapr-http-port 3500 node app.js
dapr invoke --verb POST --app-id nodeapp --method neworder --data '{"data": { "orderId": "41" } }'

#dapr run --app-id myapp --dapr-http-port 3500 --components-path ./
```