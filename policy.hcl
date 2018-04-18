resource "https://iam.googleapis.com/v1/projects/vaultexample-autobuild/serviceAccounts/master-account@vaultexample-autobuild.iam.gserviceaccount.com" {
  roles = ["roles/iam.serviceAccountUser", "roles/compute.admin"]
}
