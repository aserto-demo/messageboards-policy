package boards

# no permissions by default
default is_op_allowed = false

# can the user perform this operation given their entitlements
is_op_allowed {
    data.roles[irole].name == input.user.applications.mb.roles[_]
    data.operations[iop].name == input.resource.operation
    data.operations[iop].requires[_] == data.roles[irole].entitlements[_]
}
