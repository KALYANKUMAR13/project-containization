It is simliar to inbound/outboud  Security groups in AWS. 

We are blocking the access to the pod by defining 3 things, 

1.IpBlock
    ipBlock:
        cidr: 172.17.0.0/16
        except:
        - 172.17.1.0/24
3. namespace selector
``` 
namespaceSelector:
        matchLabels:
          project: myproject
allows particular namespace
```
3.PodSelector 
``` podSelector:
        matchLabels:
          role: frontend
```
the above is ingress.

the below is egress.
```
egress:
  - to:
    - ipBlock:
        cidr: 10.0.0.0/24
```
