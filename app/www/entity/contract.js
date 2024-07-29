function Contract(initargs) {
    Object.assign(this, initargs)
      
    return this;
}

EcmSPA.prototype.Contract = Contract;

EcmSPA.prototype.contract_cache = { time: false, contracts: false }

EcmSPA.prototype.loadContracts = async function () {
    const res = await fetch('entity/contract.ss'),
	  json =  await res.json()

    this.contract_cache.contracts = json.map(c => new Contract(c))
    this.contract_cache.time = new Date()
    return this.contract_cache.contracts
}

EcmSPA.prototype.listContracts = async function () {
  const cs = this.contract_cache.contracts
  return cs ? new Promise (r => r(cs)) : this.loadContracts()
}

// console.log('Have ECM already FFS', EcmSPA)

function ContractSelect(select) {
    const ctxt = (c) => {
	let txt = c.contract_number + ' '
	txt = txt + c.effective_date + ' to ' + c.expiry_date;
	if (c.syndicate) { txt = txt + ', ' + c.syndicate.short_name;}
	if (c.london_broker) { txt = txt + ', ' + c.london_broker.short_name;}
	if (c.agency) { txt = txt + ', ' + c.agency.short_name;}
	return txt
    },
	  spinner = document.createElement('div'),
	  spin = document.createElement('div'),
          self = this;
          
    
    EcmSelect.call(this, select)

    spin.setAttribute('uk-spinner', '')
    spinner.style.width = '100%'
    spinner.style.textAlign = 'center'
    spinner.textContent = "Loading All Contracts...   "
    spinner.appendChild(spin)

 // async get and fill
    
    console.log("listing contracts", this)
    globalThis.conEL = this;


    this.input.style.display = 'none'
    this.element.prepend(spinner)

    

    ECM.listContracts().then(cs => {

	console.log("listed contracts", cs)
	cs.forEach(c => {

       if (c.contract_id) {
		self.addOption({ text: ctxt(c),
				 value: c.contract_id
			       })
	    }

	})

	 self.input.style.display = ''
	 self.input.placeholder = 'Contract'
      	 spinner.remove()
    })

     return this;
 }

Object.setPrototypeOf(ContractSelect.prototype, EcmSelect.prototype);

EcmSPA.prototype.initFunctions.ContractSelect = function (el) {
    this.querySelectorAll(el, '[data-contract-select]')
	.forEach(e => new ContractSelect(e)) 
}
