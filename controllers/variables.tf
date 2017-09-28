variable "cluster_name" {
  type        = "string"
  description = "Unique cluster name"
}

variable "ssh_authorized_key" {
  type        = "string"
  description = "SSH public key for logging in as user 'core'"
}

variable "network" {
  type        = "string"
  description = "Name of the network to attach to the compute instance interfaces"
}

variable "dns_zone" {
  type        = "string"
  description = "Google Cloud DNS Zone value to create etcd/k8s subdomains (e.g. dghubble.io)"
}

variable "dns_zone_name" {
  type        = "string"
  description = "Google Cloud DNS Zone name to create etcd/k8s subdomains (e.g. dghubble-io)"
}

# instances

variable "count" {
  type        = "string"
  description = "Number of controller compute instances the instance group should manage"
}

variable "zone" {
  type        = "string"
  description = "Google zone that compute instances in the group should be created in (e.g. gcloud compute zones list)"
}

variable "machine_type" {
  type        = "string"
  description = "Machine type for compute instances (e.g. gcloud compute machine-types list)"
}

variable "os_image" {
  type        = "string"
  description = "OS image from which to initialize the disk (e.g. gcloud compute images list)"
}

variable "disk_size" {
  type        = "string"
  default     = "40"
  description = "The size of the disk in gigabytes."
}

variable "preemptible" {
  type        = "string"
  default     = "false"
  description = "If enabled, Compute Engine will terminate instances randomly within 24 hours"
}

// configuration

variable "networking" {
  description = "Choice of networking provider (flannel or calico)"
  type        = "string"
  default     = "flannel"
}

variable "service_cidr" {
  description = <<EOD
CIDR IP range to assign Kubernetes services.
The 1st IP will be reserved for kube_apiserver, the 10th IP will be reserved for kube-dns, the 15th IP will be reserved for self-hosted etcd, and the 200th IP will be reserved for bootstrap self-hosted etcd.
EOD

  type    = "string"
  default = "10.3.0.0/16"
}

// kubeconfig

variable "kubeconfig_ca_cert" {
  type        = "string"
  description = "Generated kubeconfig CA certificate"
}

variable "kubeconfig_kubelet_cert" {
  type        = "string"
  description = "Generated kubeconfig kubelet certificate"
}

variable "kubeconfig_kubelet_key" {
  type        = "string"
  description = "Generated kubeconfig kubelet private key"
}

variable "kubeconfig_server" {
  type        = "string"
  description = "Generated kubeconfig server"
}
