# Random Notes

```bash
cd /tmp/
curl -L https://istio.io/downloadIstio | sh -
```

```bash
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y
kubectl label namespace default istio-injection=enabled

kubectl apply -f samples/bookinfo/platform/kube/bookinfo.yaml
kubectl apply -f samples/bookinfo/networking/bookinfo-gateway.yaml
kubectl get pods

istioctl analyze
istioctl profile dump
istioctl proxy-status
kubectl get svc istio-ingressgateway -n istio-system
```

```bash
export INGRESS_HOST=$(kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}')
export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export SECURE_INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="https")].nodePort}')
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

echo $INGRESS_HOST
echo $INGRESS_PORT
echo $SECURE_INGRESS_PORT
echo $GATEWAY_URL
curl -vv -k -m 10 http://$GATEWAY_URL/productpage
```

```bash
kubectl apply -f samples/addons
kubectl rollout status deployment/kiali -n istio-system
kubectl port-forward -n=istio-system --address 0.0.0.0 svc/kiali 20001:20001

kubectl exec argocd-server-5cb6fbd87b-499rf -c istio-proxy -- curl -sS -v -k https://localhost:8443
```

[Uninstall]

```bash
kubectl delete -f samples/addons
istioctl manifest generate --set profile=demo | kubectl delete --ignore-not-found=true -f -
istioctl tag remove default

kubectl delete namespace istio-system
kubectl label namespace default istio-injection-
```

# References

- https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/
