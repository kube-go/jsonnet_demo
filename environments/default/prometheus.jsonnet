{
  prometheus: {
    deployment: {
      apiVersion: 'apps/v1',
      kind: 'Deployment',
      metadata: {
        name: $._config.prometheus.name,
        labels: {
          'app.kubernetes.io/name': $._config.prometheus.name,
        },
        namespace: $._config.namespace.name,
      },
      spec: {
        minReadySeconds: 10,
        replicas: 1,
        revisionHistoryLimit: 10,
        selector: {
          matchLabels: {
            'app.kubernetes.io/name': $._config.prometheus.name,
          },
        },
        template: {
          metadata: {
            labels: {
              'app.kubernetes.io/name': $._config.prometheus.name,
            },
          },
          spec: {
            containers: [
              {
                image: 'prom/prometheus',
                imagePullPolicy: 'IfNotPresent',
                name: $._config.prometheus.name,
                ports: [
                  {
                    containerPort: 9090,
                    name: 'api',
                  },
                ],
              },
            ],
          },
        },
      },
    },
    service: {
      apiVersion: 'v1',
      kind: 'Service',
      metadata: {
        labels: {
          'app.kubernetes.io/name': $._config.prometheus.name,
        },
        name: $._config.prometheus.name,
        namespace: $._config.namespace.name,
      },
      spec: {
        ports: [
          {
            name: 'prometheus-api',
            port: 9090,
            targetPort: 9090,
          },
        ],
        selector: {
          'app.kubernetes.io/name': $._config.prometheus.name,
        },
      },
    },
  },
}