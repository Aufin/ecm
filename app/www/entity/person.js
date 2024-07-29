function Person(initargs) {
     Object.assign(this, initargs)
       
     return this;
 }

 EcmSPA.prototype.Person = Person;

 Object.setPrototypeOf(Person.prototype, EcmElement.prototype);
 Person.prototype.currentScript = document.currentScript;
 // NB: the id is stored all over the place by various different
 // things, old and new, which call it different things.

 // But `.person_id` is where it lives for real.


 Object.defineProperty(Person.prototype, 'insuredDetails', {
     get() {
 	const deets = this._insured_promise
         if (!deets) {
             this._insured_promise = this.getInsuredDetails()
             return this._insured_promise
         } else { return deets }
     }
 })
 
 Person.prototype.getInsuredDetails = function () {
     return fetch(this.pathExpand('insured.ss')+'?id='+encodeURIComponent(this.person_id)).then(r => r.json())
 }

Object.defineProperty(Person.prototype, 'payeeDetails', {
     get() {
 	const deets = this._payee_promise
         if (!deets) {
             this._payee_promise = this.getPayeeDetails()
             return this._payee_promise
         } else { return deets }
     }
 })
 
 Person.prototype.getPayeeDetails = function () {
     return fetch(this.pathExpand('payee.ss')+'?id='+encodeURIComponent(this.person_id)).then(r => r.json())
 }

function ViewPerson(element) {
   this.element = element

  fetch(this.pathExpand('view-person.html'))
     .then(r => r.text()).then(txt => {
 	element.innerHTML = txt
     })

  return this
   
 }

  
 Object.setPrototypeOf(ViewPerson.prototype, EcmElement.prototype);
 ViewPerson.prototype.currentScript = document.currentScript;


 Object.defineProperty(ViewPerson.prototype, 'person', {
     get() { return this._person },
     set(p) {
       const p_p = p instanceof Person;
       if (!p_p) { p = new Person(p) }
 	this._person = p
 	// console.log("setting person to view", p)
 	this.renderPerson(p)
     }
 })

  ViewPerson.prototype.claimTR = function (claim) {
      const lnk = ((a = document.createElement('a')) => {
          a.setAttribute('href', '/ecm/claim/' + claim.claim_id)
 	 a.textContent = claim.claim_id
 	 return a
      })(),
 	   tr = document.createElement('tr'),
 	   td = (e) => {
 	       const tde = document.createElement('td')
 	       tde.append(e)
 	       tr.append(tde)
 	       return tde
 	   },
 	   a = (href, a = document.createElement('a'))=> {
   	       a.setAttribute('href', href)
   	       return a
 	   },
 	   ex = (n => {
 	       const na = a('/ecm/view?person=' + claim.examiner._id)
 	       na.textContent = claim.examiner.full_name
 	       return na
 	   })();


      if (claim.transactions) {
         const ledger = () => document.createElement('span'),
               thed = td('')
          
         claim.transactions.forEach(ct => {
             const l = ledger()
            // console.log('have CT', ct)
             l.append(ct.date+ ' ' + ct.type+": "+ct.amount)
             thed.append(l)
	 })
      }
      td(lnk)
      td(claim.status)
      td(claim.date_of_loss)
      td(this.makePolicyElement(claim.policy))
      td(this.makeContractElement(claim.contract))
      td(ex)
      return tr
  }
 	   

      
 ViewPerson.prototype.makePolicyElement = function (policy) {
     if (!(policy instanceof Policy)) {
	 policy = new Policy(policy)
     }
     const a = (href, a = document.createElement('a'))=> {
 	a.setAttribute('href', href)
 	return a
     },
 	  span = document.createElement('span'),
 	  pa = a('/ecm/view?policy=' + policy.policy_id),
 	  ca = (href, tooltip) => {
 	      const la = a(href)
 	      la.setAttribute('uk-tooltip', tooltip)
 	      return la
 	  }
     
           

     pa.textContent = policy.policy_number
     span.append(pa) ;
     span.append(((s) => {
 	s.textContent = ' ' + policy.effective_date + ' to ' + policy.expiry_date
 	return s
     })(document.createElement('small')))

     const ag = policy.agent && ca('/ecm/view?person='+ policy.agent._id, 'Agent'),
           rb = policy.agency_office && ca('/ecm/view?person='+ policy.agency_office._id, 'Retail Broker'),
           uw = policy.underwriter && ca('/ecm/view?person='+ policy.underwriter._id, 'Underwriter'),
           lb = policy.branch && ca('/ecm/view?person='+ policy.branch._id, 'Local Branch'),
 	  co = policy.insurance_company && ca('/ecm/view?person='+ policy.insurance_company._id, 'Insurance Company')

     if (ag) {
 	ag.textContent = policy.agent && (' ' + policy.agent.full_name)
 	span.append(ag)
     }
     if (co) {
 	span.append(co)
 	co.textContent = policy.insurance_company && ((ag ? ', ' : ' ') +  policy.insurance_company.full_name)
     }
     if (rb) {
 	  span.append(rb)
 	  rb.textContent = ((ag || co ? ', ' : ' ') + policy.agency_office.full_name)
     }
     if (uw) {
 	  span.append(uw)
 	  uw.textContent = ((ag || co || rb ? ', ' : ' ') + policy.underwriter.full_name)
     }

     if (lb) {
 	  span.append(lb)
 	  lb.textContent = ((ag || co || rb || uw ? ', ' : ' ') + policy.branch.full_name)
     }


     // span.append(JSON.stringify(policy.object))

     return span
 }

 ViewPerson.prototype.makeContractElement = function (contract) {
     const a = (href, a = document.createElement('a'))=> {
 	a.setAttribute('href', href)
 	return a
     },
 	  span = document.createElement('span'),
 	  pa = a('/ecm/view?contract=' + contract._id),
 	  ca = (href, tooltip) => {
 	      const la = a(href)
 	      la.setAttribute('uk-tooltip', tooltip)
 	      return la
 	  },
 	  auth = () => {
 	      const span = document.createElement('span')
 	      span.textContent = ' $' + contract.authority
 	      span.setAttribute('uk-tooltip', "Authority")
 	      return span
 	  }
     
           

     pa.textContent = contract.contract_number
     span.append(pa) ;
     span.append(((s) => {
 	s.textContent = ' ' + contract.effective_date + ' to ' + contract.expiry_date
 	return s
     })(document.createElement('small')))

     const ag = contract.agency && ca('/ecm/view?person='+ contract.agency._id, 'Agency'),
           syn = contract.syndicate && ca('/ecm/view?person='+ contract.syndicate._id, 'Syndicate'),
           lb = contract.london_broker && ca('/ecm/view?person='+ contract.london_broker._id, 'London Broker'),
 	  co = contract.insurance_company && ca('/ecm/view?person='+ contract.insurance_company._id, 'Insurance Company')

     if (syn) {
 	syn.textContent = (' ' + contract.syndicate.full_name)
 	span.append(syn)
     }
     if (ag) {
 	span.append(ag)
 	ag.textContent = ((syn ? ', ' : ' ') +  contract.agency.full_name)
     }
     if (co) {
 	  span.append(co)
 	  co.textContent = ((ag || syn ? ', ' : ' ') + contract.insurance_company.full_name)
     }

     if (lb) {
 	  span.append(lb)
 	  lb.textContent = ((ag || co || syn ? ', ' : ' ') + contract.london_broker.full_name)
     }

     if (contract.authority) {
 	span.append(auth());
     }
     // span.append(JSON.stringify(policy.object))

     return span
 }



 ViewPerson.prototype.insuredHTML =`
  <table class="uk-table uk-table-small uk-table-divider">
   <thead>
       <tr>
           <th>Claim</th>
           <th>Status</th>
           <th>Date&nbsp;of&nbsp;Loss</th>
           <th>Policy</th>
           <th>Contract</th>
           <th>Examiner</th>
       </tr>
   </thead>
   <tbody> </tbody>
 </table> `

ViewPerson.prototype.payeeHTML =`
  <table class="uk-table uk-table-small uk-table-divider">
   <thead>
       <tr>
           <th>Ledger</th>
           <th>Claim</th>
           <th>Status</th>
           <th>Date&nbsp;of&nbsp;Loss</th>
           <th>Policy</th>
           <th>Contract</th>
           <th>Examiner</th>
       </tr>
   </thead>
   <tbody> </tbody>
 </table> `


 ViewPerson.prototype.renderPerson = function(person) {
     if (!person) { person = this.person }
     const el = this.element,
 	  nameEl = el.querySelector('[data-ecm-full-name]'),
 	  addressEl = el.querySelector('[data-ecm-address]'),
 	  claimsEl = el.querySelector('[data-ecm-person-claims]'),
 	  insuredEl = claimsEl.querySelector('[data-ecm-insured]'),
 	  payeeEl = claimsEl.querySelector('[data-ecm-payee]')
           
     // console.log('Render Person', claimsEl)
     nameEl.textContent = person.full_name
     addressEl.textContent = person.address;

     ([insuredEl, payeeEl]).forEach(el => {
 	el.style.display = ''
 	this.addLoading(el.querySelector('.uk-accordion-title'));
     })

     person.insuredDetails.then(jso => {
       const cnt = insuredEl.querySelector('.uk-accordion-content'),
             claims = jso.claims && jso.claims.map(init => new Claim(init))
     this.removeLoading(insuredEl.querySelector('.uk-accordion-title'));
 	if (!claims) {
 	    insuredEl.style.display = 'none'
 	} else {
 	    // console.log(claims && claims.map(c => c.claim_id), claims)
             cnt.innerHTML = this.insuredHTML
 	    const bdy = cnt.querySelector('tbody')
         
 	    claims.forEach(c => bdy.append(this.claimTR(c)))
 	    console.warn(new DataTable(cnt.querySelector('table')))
 	}
     })

     person.payeeDetails.then(jso => {
 	console.log('Payee', jso)
    const cnt = payeeEl.querySelector('.uk-accordion-content'),
             claims = jso.claims 
     this.removeLoading(payeeEl.querySelector('.uk-accordion-title'));
 	if (!claims || claims.length == 0) {
 	    payeeEl.style.display = 'none'
 	} else {
 	    // console.log(claims && claims.map(c => c.claim_id), claims)
             cnt.innerHTML = this.payeeHTML
 	    const bdy = cnt.querySelector('tbody')
         
 	    //claims.forEach(c => bdy.append(this.claimTR(c)))
 	    new DataTable(cnt.querySelector('table'), {
		ajax: this.pathExpand('payee-json.ss?id=' + person.person_id),
                serverSide: true,
		columnDefs: [
		    {
			targets: 4,
			render: this.makePolicyElement
			
		    },
		    {
			targets: 5,
			render: this.makeContractElement
			
		    }

		]
	    
                // columns: [
	// 	    { data: 0 },
	// 	    { data: 1 },
	// 	    { data: 2 },
	// 	    { data: 3 },
	// 	    { data: 4 },
	// 	    { data: 5 },
	// 	    { data: 6 }
	// 	]
	     })
 	 }

     })
 		   
 }


 ViewPerson.prototype.makeLoading = function () {
     const d = document.createElement('div')
     d.setAttribute('uk-spinner', '')
     return d
 }
   
 ViewPerson.prototype.addLoading = function (element) {
     let el = element.querySelector('[uk-spinner]')
     if (el) {
 	return el
     }

     el = this.makeLoading()
     element.append(el)
     return el
   }

 ViewPerson.prototype.removeLoading = function (element) {
     let el = element.querySelector('[uk-spinner]')
     if (el) {
 	    el.remove()
       return el
     }

   }



    

 // ViewPerson.prototype.

function SelectPerson(select) {
    const parent = Object.getPrototypeOf(Object.getPrototypeOf(this)),
	  modal = document.createElement('div'),
	  view_modal = document.createElement('div')

    this.parent = parent;
    this.person = false;
    // console.log('SElect Person', select)
    EcmSelect.call(this, select);
    
    this.filter = () => null;

    // The "CREATENEW' modal

    modal.className = 'uk-modal-container'
    modal.setAttribute('uk-modal', '')
    modal.innerHTML = `<div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">Create New Person or Company</h2>
        </div>
        <div class="uk-modal-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
        <div class="uk-modal-footer uk-text-right">
            <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
            <button data-ecm-save-button class="uk-button uk-button-primary" type="button">Save</button>
        </div>
    </div>`
    const modal_body = modal.querySelector('.uk-modal-body'),
      	  upsert = new UpsertPerson(modal_body);
	  
    // console.log('mobody', modal_body)
    this.element.append(modal);
    this.modal = modal
    this.upsert = upsert
    this.addOption({text: "Create New (enter name)", value: "CREATENEW", selected: true})
   // console.log('W Am I here now?')
    //this.changeOptionsFromQuery('Adamteve')

    this.onKeyUp = function (key) {
     	// console.warn('up!', key, this, this.input.value, this.hoverIdx())
     	if (["Enter", "ArrowUp", "ArrowDown"].includes(key.key)) {
       	    parent.onKeyUp.call(this, key)
     	} else if (this.input.value) {
	    this.setCreateLabel(this.input.value)
     	    this.changeOptionsFromQuery(this.input.value)
     	} else { 
	    this.setCreateLabel(this.input.value)
	}
     }

    this.input.addEventListener("paste", (event) => {
	const text = ((event.clipboardData || window.clipboardData).getData("text"))
	// console.log('Pasted', this.input.value, text, event)
        this.changeOptionsFromQuery(text)
	this.setCreateLabel(text)
     });


  // The View element
    view_modal.className = 'uk-modal-container'
    view_modal.setAttribute('uk-modal', '')
    view_modal.innerHTML = `<div class="uk-modal-dialog">
        <button class="uk-modal-close-default" type="button" uk-close></button>
        <div class="uk-modal-header">
            <h2 class="uk-modal-title">View Person or Company</h2>
        </div>
        <div class="uk-modal-body">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        </div>
    </div>`
   this.view = new ViewPerson(view_modal.querySelector('.uk-modal-body'))
   this.view_modal = view_modal;
   this.element.append(view_modal);


 
     
 return this
}

Object.setPrototypeOf(SelectPerson.prototype, EcmSelect.prototype);
EcmSPA.prototype.initFunctions.SelectPerson = function (el) {
    this.querySelectorAll(el, '[data-select-person]')
	.forEach(e => new SelectPerson(e))
}

SelectPerson.prototype.currentScript = document.currentScript;

SelectPerson.prototype.setCreateLabel = function (text) {
    const disp = this.ul.firstChild.firstChild
    disp.childNodes.forEach(c => { if (c.nodeName == '#text') disp.removeChild(c)})
    disp.append( 'Create New: "' + text + '"')
	      
}   

SelectPerson.prototype.pathExpand = function (postfix = '', path = false) {
    const uri = path || this.currentScript.src.split('?')[0],
	  dir = path || uri.split('/').slice(0, -1).join('/')+'/'
    
    return dir + postfix;
}

SelectPerson.prototype.selectOption = function (opt) {
    // console.log("Selected Option", opt)
    this.loadingEl && this.loadingEl.remove()
    this.loadingEl = false
    const ret = this.parent.selectOption.call(this, opt);
    if (opt && opt.value === "CREATENEW") {
	this.modal && UIkit.modal(this.modal).show();
        ((t = this.ul.firstChild.textContent) => {
            const m = t ? t.match('Create New: "(.*)"') : false
            if (m) {
		this.upsert.fullNameInput.value = m[1]
		this.upsert.updateWithFullName(m[1])
	    }
	})()
     
    }
    const a = opt && ((a = document.createElement('a')) => {
	a.textContent = this.display.textContent; return a;
    })(),
	  txt = this.display.childNodes[1]
    if (a && txt) { txt.remove() }
    if (a) {
      this.display.append(a) 

    const self = this;
    a.onclick = function () {
      // console.log('cliked!', opt, this)
      if (opt) {
       self.view.person = opt.person 
      UIkit.modal(self.view_modal).show()
      }
    };
  }
   // console.log('selected', ret);
    return ret;
}

SelectPerson.prototype.search_cache = [];
SelectPerson.prototype.search = async function (q) {
    const cached = this.search_cache[q];
    if (cached) { return cached };

    const ret = fetch(
         this.pathExpand('person.ss')+'?q='+encodeURIComponent(q))
           .then(e => {
	     // console.log('fetched', e)
             return e.json()
	 })
    // 	  .then(j => {
    // 	      console.log('json', j)
    //           return j
    // 	  })

    this.search_cache[q] = ret;
    return ret;	  
}

SelectPerson.prototype.addOption = function (opt, pre) {
    const parent = Object.getPrototypeOf(Object.getPrototypeOf(this)),
	  el = parent.addOption.call(this, opt, pre);
    // console.log('WE DID IT!', el, opt)
    return el
};

SelectPerson.prototype.changeOptionsFromQuery = function (q) {
    // console.log('Changing options', q)
    this.toggleLoading(true)
    this.search(q).then(obj => {
        while (this.ul.children[1]) {
	    this.ul.removeChild(this.ul.children[1]);
        }
        this.options = [this.options[0]]
	this.toggleLoading(false)

   	this.ul.scrollTop = 0
 	obj.results.forEach(p => {
  	    // console.log('person', p)
  	    this.addOption({
  		value: p.person_id,
  		text: p.full_name + (p.province ? ', ' + p.province : ''),
  		person: p
  	    })
	})
    })

	.catch(e => {
	    this.toggleLoading(false)
	})
}

// console.log('here')
function UpsertPerson(element, full_name = "") {
    const person_name = {
	 title: null,
	 first_name: null,
	 middle_name:  null,
	 last_name:  null,
	 suffix: null,
	 company_name: null,
	 set nick(name) {
	     this.company_name = name
	 },
        
	 set first(name) { this.first_name = name },
	 set last(name) { this.last_name = name },
	 set middle(name) { this.middle_name = name }
    }, self = this, company = { company_name: full_name }
	   
    this.isCompany = false
    this.address = {}
    this.element = element

    Object.assign(this, { person_name, full_name, company})

     


 fetch(this.pathExpand('upsert-person.html'))
	.then(r => r.text())
	.then(txt => {
	    element.innerHTML = txt
	    const psel = element.querySelector('[name="province"]'),
		  csel = element.querySelector('[name="country"]')
            // console.log('Select Upsert Province', psel, psel.parentElement)
            this.addressElement = element.querySelector('[data-address]')
	    this.personName = element.querySelector('[data-person-name]')
	    this.companyName = element.querySelector('[data-company-name]')
	    this.fullNameInput = this.companyName.querySelector('input')
	    this.typeRadio = element.querySelectorAll('[name="type"]')
            this.province = new SelectProvince(psel, 'CA')
	    this.country = new SelectCountry(csel, "CA")
	    this.saveButton = element.parentNode.querySelector('[data-ecm-save-button]')


	    // captureInputs links any inputs change event to an
	    // object's property of .name
            this.captureInputs(this.personName, person_name)
            this.captureInputs(this.companyName, company)
            this.captureInputs(this.addressElement, this.address)


             globalThis.__saveButton = this.saveButton

	     this.saveButton.addEventListener("click", e => {
		// console.log(`Saving clicked, ${e}`)
		 this.savePerson()
	     })
	     
	     this.country.element.addEventListener("update", e => {
		 //console.log("Changed Country", e.detail.country.value)
		 this.province.update(e.detail.country.value)
                //console.log(self.province, self.province.update)
	     })
	     // console.log("type radios", this.typeRadio);

            this.typeRadio.forEach(r => {
              r.addEventListener("input", (event) => {
                  // console.warn('this', this, this.companyName)
                //    globalThis.__SelectPerson = this
		   this.personName.style.display = event.target.value == 'person' ? '' : 'none';
                  this.companyName.style.display = event.target.value == 'company' ? '' : 'none';
                  this.isCompany = event.target.value == 'company';
		   })
		      
                 // console.log('radio!', event, event.target.value)
	     });


      // Object.keys(person_name).map(k => {
      // 	    const name = '[name="'+k+'"]',
      // 		  input = element.querySelector(name);
      // 	    // console.log('have name!', name, input)
      // 	    if (input) {
      // 		Object.defineProperty(person_name, k, {
      // 		    enumerable: true,
      // 		    get() { return input.value },
      // 		    set(v) { return input.value = v}
      // 		})
      // 	    }
	    
      //	})
	

   });

  

    return this }

Object.setPrototypeOf(UpsertPerson.prototype, EcmElement.prototype);
UpsertPerson.prototype.currentScript = document.currentScript;

UpsertPerson.prototype.parseFullName = exports.parseFullName;

UpsertPerson.prototype.updateWithFullName = function (txt) {
  this.company.company_name = txt;
  Object.assign(this.person_name, this.parseFullName(txt))
  this.setInputs(this.element, this.person_name)
  this.setInputs(this.element, this.company)
}


Object.defineProperty(UpsertPerson.prototype, 'person', {
    get() {
	const p = {
	    person_id: this.person_id,
            company_flag: this.isCompany,
	    name: this.isCompany ? this.company : this.person_name,
	    address: this.address
	}

	return p;
    }
});
  
UpsertPerson.prototype.savePerson = function (p) {
    const request = new Request(this.pathExpand('person.ss?upsert'), {
	method: "POST",
	body: JSON.stringify(this.person)
    });
    console.log(`Saving`, this.person, JSON.stringify(this.person))
      
    const foo = fetch(request).then(res => {
	console.log('Fetched', res)
        res.text().then(obj => {
         const err = this.element.querySelector("[data-ecm-error]")
	    console.log('got json', obj, this.element.querySelector("[data-ecm-error]"))
          err.innerHTML =`<div class="uk-alert-danger" uk-alert>
  <a href class="uk-alert-close" uk-close></a>
  <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.</p>
</div>`
	}).catch(e => { console.warn(e, res.text()) })
    }).catch(e => {
	console.warn('ERRORFETCH', e)
    })


    console.log('Fetching', foo)
		    
    
}
