package boards

# can the user perform this operation given their entitlements
is_op_allowed {
	op_requires[_] == usr_entitlements[_]
}

# entitlemtes required by the operation
op_requires[reqs] {
	ops := data.operations[_]
    ops.name == input.operation
    reqs := ops.requires[_]
}

# set of user's entitlements, derived from their roles
usr_entitlements[ents] {
	roles := data.roles[_]
    usr_roles := input.user.roles[_]
    roles.name == usr_roles
    ents := roles.entitlements[_]
}