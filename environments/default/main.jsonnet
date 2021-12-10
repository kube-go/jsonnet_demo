(import "kubernetes.libsonnet") +
(import "prometheus.jsonnet")+

{
  _config:: {
    namespace: {
      name: "tanka"
    },
    prometheus: {
      port: 9090,
      name: "prometheus"
    }
  },
  my_namespace: {
    apiVersion: "v1",
    kind: "Namespace",
    metadata: {
      name: $._config.namespace.name,
    },
  },
}
