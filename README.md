# jsonnet_with_tanka

Using jsonnet to generate kube manifests and deploy to kubernetes cluster

## Motivation

This project was created to learn jsonnet using [tanka](https://tanka.dev/). In this demo we will install prometheus using tanka on a kubernetes cluster.

## Pre-requisites

Install [tanka](https://github.com/grafana/tanka) and [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)

## Usage

- Set apiserver address

  Get api-server address from kubeconfig or by executing `kubectl cluster-info`

  Example for minikube

  ```go
  tk env set environments/default --server=https://127.0.0.1:52585
  ```

- Review manifests that will be applied, 

  ```go
  tk show environments/default
  ```

- Apply the manifests

  ```go
  tk apply environments/default
  ```
