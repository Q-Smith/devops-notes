# Notes

Namespaces not automatically created for releases: In Helm 2, if you attempted to install a release in a namespace that did not exist, it would create the namespace for you.  Helm 3 now follows kubectl convention by throwing an error message if you attempt to create a release where the namespace does not exist.

