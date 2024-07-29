function Contract(initargs) {
    Object.assign(this, initargs)
    return this;
}

EcmSPA.prototype.Contract = Contract;

EcmSPA.prototype._contract_cache_ = []
