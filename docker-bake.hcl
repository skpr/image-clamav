variable "STREAM" {
  default = "latest"
}

variable "VERSION" {
  default = "v3"
}

variable "PLATFORMS" {
  default = ["linux/amd64", "linux/arm64"]
}

variable "REGISTRIES" {
  default = ["docker.io", "ghcr.io"]
}

# Common target: Everything inherits from this
target "_common" {
  platforms = PLATFORMS
}

group "default" {
  targets = [
    "prod",
    "dev",
  ]
}

target "prod" {
  inherits = ["_common"]

  contexts = {
    from_image = "docker-image://docker.io/alpine:3.22"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/clamav:${VERSION}-${STREAM}"
  ]
}

target "dev" {
  inherits = ["_common"]
  context  = "dev"

  contexts = {
    from_image = "target:prod"
  }

  tags = [
    for r in REGISTRIES :
    "${r}/skpr/clamav:dev-${VERSION}-${STREAM}"
  ]
}
