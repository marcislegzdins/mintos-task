provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

resource "kubernetes_namespace" "sonarqube" {
  metadata {
    name = "sonarqube"
  }
}

resource "helm_release" "postgresql" {
  name       = "postgresql"
  namespace  = "sonarqube"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "postgresql"
  version    = "15.5.27"

  values = [
    file("values/postgresql-values.yaml")
  ]
}

resource "helm_release" "sonarqube" {
  name       = "sonarqube"
  namespace  = kubernetes_namespace.sonarqube.metadata[0].name
  repository = "https://SonarSource.github.io/helm-chart-sonarqube"
  chart      = "sonarqube"
  version    = "10.6.1+3163"

  values = [
    file("values/sonarqube-values.yaml")
  ]

  depends_on = [helm_release.postgresql]
}

resource "kubernetes_manifest" "sonarqube_ingress" {
  depends_on = [helm_release.sonarqube]
  manifest = yamldecode(file("/sonarqube-ingress.yaml"))
}