package boards

# safety first
default is_op_allowed = false

# can the user perform this operation given their entitlements
is_op_allowed {
	op_requires[_] == usr_entitlements[_]
}

# entitlemtes required by the operation
op_requires[reqs] {
	ops := data.operations[_]
    ops.name == input.resource.operation
    reqs := ops.requires[_]
}

# set of user's entitlements, derived from their roles
usr_entitlements[ents] {
	roles := data.roles[_]
    usr_roles := input.user.applications.mb.roles[_]
    roles.name == usr_roles
    ents := roles.entitlements[_]
}

# for debugging
has_op {
	input.resource.operation
}

has_resource {
	input.resource
}