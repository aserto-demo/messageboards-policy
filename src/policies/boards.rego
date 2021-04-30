package boards

# safety first
default is_op_allowed = false

# can the user perform this operation given their entitlements
is_op_allowed {
	usr_entitlements[op_requires[i]]
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
# debug stuff
op_requires_has_admin {
	op_requires[_] == "admin"
}

usr_has_admin {
	usr_entitlements[_] == "admin"
}