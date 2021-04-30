package boards

# safety first
default is_op_allowed = false

# can the user perform this operation given their entitlements
is_op_allowed {
	usr_entitlements[_] == op_requires[_]
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

# debug
test_op_requires {
	op_requires[_] == "admin"
}

test_usr_entitlements {
	usr_entitlements[_] == "admin"
}