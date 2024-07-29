function Policy(props = {}) {
  this.object = Object.assign ({}, props)
}

Object.defineProperty(Policy.prototype, 'policy_id', {
    get() { return this.object.policy_id || this.object._id },
    set(id) { this.object.policy = id }
})

Policy.prototype.defineProxy = function (prop, on = Policy.prototype) {
    Object.defineProperty(on, prop, {
	get() { return this.object[prop] },
	set(v) { this.object[prop] = v }
    })
}

Policy.prototype.defineProxies = function (...props) {
    [...props].forEach(p => Policy.prototype.defineProxy(p))
}

Policy.prototype.defineProxies(
    'policy_number',
    'effective_date',
    'expiry_date',
    'agent',
    'underwriter',
    'branch',
    'insurance_company',
    'agency_office'
)
