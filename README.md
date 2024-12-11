# k8s-intro-talk

You can find here the slides and the sample code of my talk "Kubernetes, das unbekannte Wesen" that I presented on "IT Tage 2024" at 11th December 2024.

The chapter "Runbook" describes the demo steps.  


## Tools, that are used in the demo
- [Docker CE](https://docs.docker.com/get-started/overview/)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [kubectl](https://kubernetes.io/docs/reference/kubectl/)

## Runbook

Demonstration Container Build
```shell
./00-container-build.sh
```

Starting Minikube with two nodes
```shell
minikube start --nodes 2 --addons=ingress,dashboard
minikube dashboard
```

Create a simple pod
```shell
kubectl apply -f 01-pod.yaml   
kubectl get pods     
kubectl delete po spring-boot-demo                                       
```

Create a pod with probes
```shell
kubectl apply -f 02-pod-with-probes.yaml  
kubectl describe po spring-boot-demo
kubectl delete po spring-boot-demo                                       
```

Create Service and Pod
```shell
kubectl apply -f 03-pod-with-service.yaml          
kubectl get pods
kubectl get service 

kubectl run -it --rm --restart=Never busybox --image=gcr.io/google-containers/busybox sh
	wget http://srv.ip/hero -O - # srv.ip is the Cluster IP column by kubectl get service                       
```

Create Ingress 
```shell
 kubectl apply -f 04-ingress.yaml
 minikube ip
 nano /etc/hosts
```

Create Config Map and Secrets
```shell
kubectl delete po spring-boot-demo 
kubectl apply -f 05-config-secret.yaml
kubectl get configmaps
kubectl get secrets
kubectl apply -f 06-pod-with-config.yaml
```

Create Namespace
```shell
kubectl apply -f 07-namespace.yaml
kubectl get namespaces
kubectl get pod --namespace spring-boot-demo-namespace
```

Create Deployment
```shell
kubectl delete ingress spring-demo-ingress
kubectl apply -f 08-deployment.yaml
kubectl delete deployments.apps --namespace spring-boot-demo-namespace spring-boot-demo-deploy
```

Create Job
```shell
kubectl apply -f 09-job.yaml
kubectl get pods -–watch
kubectl logs jobs/demo-job job 
kubectl delete job job-demo
```

Create Cron Job
```shell
kubectl apply -f 10-cronjob.yaml
kubectl get cronjobs --watch
kubectl get pods –watch
kubectl logs cronjob-demo
kubectl delete cronjobs cronjob-demo
```

## Further Information
- [Article](https://www.informatik-aktuell.de/entwicklung/methoden/container-images-deep-dive-101-wege-zum-bauen-und-bereitstellen.html) about Container Image Build Tools (German)

## More good talks to this topic
- [From 0 to Kubernetes](https://media.ccc.de/v/froscon2023-2918-from_0_to_kubernetes)