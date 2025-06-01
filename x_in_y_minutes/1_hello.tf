// Top-level HCL file will interactively ask user values for the variables
// which do not have a default value
variable "ready" {
  description = "Ready to learn?"
  type = bool
  // default = true
}

// Module block consults a specified folder for *.tf files, would
// effectively prefix all resources IDs with "module.learn-basics."
module "learn-basics" {
  source = "./learn-basics"
  ready_to_learn = var.ready
}

output "knowledge" {
  value = module.learn-basics.knowledge
}