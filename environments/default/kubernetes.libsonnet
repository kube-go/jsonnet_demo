// Invoking this function will substitute all the variables with the respective passed function parameters and return the assembled object.

{
  // hidden k namespace for this library
  k:: {
    deployment: {
      new(name, namespace, containers): {
        apiVersion: "apps/v1",
        kind: "Deployment",
        metadata: {
          name: name,
          labels: {
            'app.kubernetes.io/name': name,
          },
          namespace: namespace,
        },
        spec: {
          minReadySeconds: 10,
          replicas: 1,
          selector: { matchLabels: {
            'app.kubernetes.io/name': name,
          }},
          template: {
            metadata: { labels: {
              'app.kubernetes.io/name': name,
            }},
            spec: { containers: containers}
          }
        }
      }
    },
    service: {
      new(name, namespace, selectorLabel, port, portName): {
        apiVersion: "v1",
        kind: "Service",
        metadata: {
          name: name,
          labels: {
            'app.kubernetes.io/name': name,
          },
          namespace: namespace,
        },
        spec: {
          ports: [
            {
              name: portName,
              port: port,
              targetPort: port,
            },
          ],
          selector: {
            'app.kubernetes.io/name': selectorLabel,
          },
        },
      }
    }
  }
}
