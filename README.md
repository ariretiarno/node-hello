# Node Hello World

Simple node.js app that servers "hello world"

Great for testing simple deployments to the cloud

Forked from https://github.com/johnpapa/node-hello

## Dockerize apps
1. Just adding Dockerfile at root project
2. Push to Registry ariretiarno/node-hello:1

## Kubernetes Cluster
### Requirements
- AWS CLI
- Kops
- S3 Bucket
### Setup
1. aws configure, add your access keys and secret keys
2. export s3 location into variable, for example ```export KOPS_STATE_STORE=s3://kubernetes.retiarno.my.id```
3. create variable name for cluster name, for example ```KOPS_CLUSTER_NAME=kubernetes.retiarno.my.id``` [optional]
4. create cluster for example ``` kops create cluster --node-count=1 --node-size=t3a.small --master-size=t3a.medium --zones=us-east-2a --name=${KOPS_CLUSTER_NAME} --ssh-public-key=~/.ssh/id_rsa.pub --cloud=aws```
5. validate cluster ```kops validate cluster```

## Screenshot the cluster
![alt text](https://github.com/ariretiarno/node-hello/blob/master/image/kops%20validate%20cluster.png)

## Screenshots of the application
### Access from browser https://hello-node.retiarno.my.id
![alt text](https://github.com/ariretiarno/node-hello/blob/master/image/application%20url.png)

### SSL termination
![alt text](https://github.com/ariretiarno/node-hello/blob/master/image/ssl.png)

### PODS, Services, Deployment, and Replicasets in a cluster
![alt text](https://github.com/ariretiarno/node-hello/blob/master/image/kubectl%20get%20all.png)

### Ingress
![alt text](https://github.com/ariretiarno/node-hello/blob/master/image/kubectl%20get%20ingress.png)


