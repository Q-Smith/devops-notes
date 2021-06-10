# Notes

```bash
export CREDS_RALLY=$(echo -n '<user>:<pass>' | base64)

https://rally1.rallydev.com/slm/webservice/v2.0/security/authorize
{"OperationResult": {"_rallyAPIMajor": "2", "_rallyAPIMinor": "0", "Errors": [], "Warnings": [], "SecurityToken": "<redacted>"}}

https://rally1.rallydev.com/slm/webservice/v2.0/projects?pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/project/147370288800?pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/workspace/2399639358?pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/Workspace/2399639358/Projects?pretty=true

https://rally1.rallydev.com/slm/webservice/v2.0/hierarchicalrequirement?query=(Children.ObjectID%20=%20null)&pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/hierarchicalrequirement?query=(FormattedID%20%3D%20US217124)&pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/hierarchicalrequirement/458164283680?pretty=true

https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/feature?query=(FormattedID%20%3D%20F18972)&pretty=true
https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/feature/458278875844?pretty=true


curl -H "Authorization: Basic $CREDS_RALLY" -H "Content-Type: application/json" https://rally1.rallydev.com/slm/webservice/v2.0/portfolioitem/feature/458278875844?pretty=true
```

# References

https://rally1.rallydev.com/slm/doc/webservice/
