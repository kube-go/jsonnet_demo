{
  prometheus: {
    deployment: $.k.deployment.new($._config.prometheus.name, $._config.namespace.name, [{
      image: 'prom/prometheus',
      name: $._config.prometheus.name,
      ports: [{
          containerPort: 9090,
          name: 'api',
      }],
      imagePullPolicy: 'IfNotPresent',
    }]),
    service: $.k.service.new($._config.prometheus.name,
                             $._config.namespace.name,
                             $._config.prometheus.name,
                             9090,
                             "prometheus-api"
                            ),
  },
}