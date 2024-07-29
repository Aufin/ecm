// * Diary Object
// We want to save a diary.

function Diary(entry) {
    this.entry = entry 
}

Object.setPrototypeOf(Diary.prototype, EcmElement.prototype);
Diary.prototype.currentScript = document.currentScript;

Diary.ensure = function (obj) {
    return ( obj instanceof Diary ? obj : new Diary(obj));
}

// ** `.upsert()` and friends

Diary.prototype.upsert = function () {
    return fetch(this.pathExpand('diary.ss?upsert'), {
	method: 'POST',
	body: JSON.stringify(entry),
	headers: {
	    'Content-Type': 'application/json'
	}
    });

}

Diary.prototype.editorHTML = `<form>
<div class="uk-grid-small uk-child-width-1-3@s uk-flex-center uk-text-center" uk-grid>
  <div>
  Date: <input class="uk-input" type="text" name="date">
  </div>
      <div>
  Claim: <input class="uk-input" type="text" name="claim_id">
  </div>
  <div class="uk-margin-auto">
    Finished: <input style="margin:auto; display: block;"
                     class="uk-checkbox" type="checkbox"
                name="closed">
  </div>
 </div>
  <div class="uk-width-expand">
   <textarea class="uk-textarea" name="note"></textarea>
  </div>
</form>`

Diary.prototype.editor = function () {
    const e = this.createHTML(this.editorHTML),
	  di = e.querySelector('[name="date"]'), 
          dt = new DateTime(di, {
              format: 'yyyy-MM-dd'
          });

    _debug_.editEntry = this.entry
    // console.log('Editing', this.entry, Object.entries(this.entry))
    this.entry_changes = this.setInputs(e, this.entry)
    // this.captureInputs(e, this.entry)

    return e
}

globalThis._debug_ = globalThis._debug_ || {}

function DiaryTable(e) {
    const self = this,
	  selector = this.selectUser() && this._selectUser;
    Object.assign(this, {
	e
    })
    e.innerHTML = this.tableHTML;

    this.initModal()
     this.pending = true;
    this.finished = false;

    selector.promise.then(_ => {

	this.datatable = new DataTable(e.querySelector('table'), {
            initComplete: function() {
                self.filterSelectUser()
		   for (const c of document.querySelector('.dt-layout-row .dt-layout-cell').children) {
		       c.style.display = 'inline-block';
		       c.style.paddingLeft = '0.5em'
		   }
	       },
	    ajax: {
		url: this.pathExpand('diary.ss'),
		contentType: 'application/json',
		type: 'POST',
		timeout: 60000,
		data: function (d) {
                    const user_id = self._selectUser.element.value,
			  findu = d.search.fixed.find(n => n.name == 'user_id')
		    // this.search.fixed('user_id', user_id || null)
		    if (findu) {
			findu.term = user_id || null
		    } else {
			if (user_id) {
			    d.search.fixed.push({name: 'user_id', term: user_id})
			}
		    }
		    

		    const data = Object.assign({rowType: 'object'}, d)
                    console.log('Select?', d.search.fixed.find(n => n.name == 'user_id'));
		    return JSON.stringify(data);
		}
        },
            serverSide: true,
	    processing: true,
            order: {
		name: 'date',
		dir: 'asc'
	    },
            columns: [
		
   		{
		    name: "note",
		    data: { "_": "note",
			    display(row, t, s, meta) {
				const pre = self.create('pre')
				pre.textContent = row.note
                                pre.setAttribute(
				    'style',
				    "overflow-y:scroll; max-width:80ch; max-height:80px; white-space:pre-wrap;")
				return self.wrapEditSelector(pre, row, meta, 'note')
			    }
			  }
		},
   		// { name: "date", data: "date" },
  		{
		    name: "date",
		    data: {
			_: "date",
			display(row, t, s, meta) {
			    const div = self.create('div'),
				  now = luxon.DateTime.local(),
				  deadl = luxon.DateTime.local().plus({ week: 1}),
				  date = luxon.DateTime.fromISO(row.date)
			    if (row.closed) {
				div.classList.add('uk-alert-success')
			    } else if (date > deadl) {
				div.classList.add('uk-alert-primary')
			    } else if (date > now) {
				div.classList.add('uk-alert-warning')
			    } else {
				div.classList.add('uk-alert-danger')
			    }
			    div.innerHTML = row.date;
                            return self.wrapEditSelector(div,row, meta, 'date')
			    
			}
		    }
		},
  		{
		    name: "closed",
		    data: {
			"_": "closed",
			display(row, type, set, meta) {
			    return self.checkbox(row, meta)
			}
		    }
		    
		},
		{
                    name: "claim_id",
		    data: function(row, type, set, meta) {
			// console.log("row", row)
		    const lnk = ((a = document.createElement('a')) => {
			a.setAttribute('href', '/ecm/claim/' + row.claim_id)
			a.textContent = row.claim_id
                        return a;
		    })()
		    return lnk
		    
		}
	    },
	    { name: "status", data: "status" },
	    {
		name: "insured_name",
	      	data: function(row, type, set, meta) {
		    const lnk = ((a = document.createElement('a')) => {
			a.setAttribute('href', '/ecm/view?person=' + row.insured_id)
			a.textContent = row.insured_name
                        return a;
		    })()
		    return lnk
		    
		}
	    },
         {
		name: "contract_number",
	      	data: function(row, type, set, meta) {
		    const lnk = ((a = document.createElement('a')) => {
			a.setAttribute('href', '/ecm/view?contract=' + row.contract_id)
			a.textContent = row.contract_number
                        return a;
		    })()
		    return lnk
		    
		}
	    },
        {
		name: "user_name",
	      	data: function(row, type, set, meta) {
		    const lnk = ((a = document.createElement('a')) => {
			a.setAttribute('href', '/ecm/view?app-user=' + row.user_id)
			a.textContent = row.user_name
                        return a;
		    })()
		    return lnk
		    
		}
	    },


	],
	layout: {
            topStart: ['pageLength', this.filterButtons(), {buttons: ['colvis'] }],
	    topEnd: this.modal
	}
	})

    })
    
    globalThis._debug_.DT = this;
    return this
}

Object.setPrototypeOf(DiaryTable.prototype, EcmElement.prototype);
DiaryTable.prototype.currentScript = document.currentScript;
EcmSPA.prototype.initFunctions.DiaryTable = function (el) {
      this.querySelectorAll(el, '[data-diary-table]')
  	.forEach(e => new DiaryTable(e))
 }


DiaryTable.prototype.tableHTML =`
   <style>
   .dataTables_processing {
   position: absolute;
   top: 15% !important;
   background: #FFFFCC;
   border: 1px solid black;
   border-radius: 3px;
   font-weight: bold;
  }
   </style>
    <table class="uk-table uk-table-small uk-table-divider display compact">
     <thead>
         <tr>
             <th>Note</th>
             <th>Diary Date</th>
             <th>Finished</th>
             <th>Claim</th>
             <th>Status</th>
             <th>Insured</th>
             <th>Contract</th>
             <th>User</th>
         </tr>
     </thead>
     <tbody> </tbody>
   </table> `

DiaryTable.prototype.modalHTML = `<div id="modal-sections" uk-modal>
  <div class="uk-modal-dialog">
      <button class="uk-modal-close-default" type="button" uk-close></button>
      <div class="uk-modal-header">
          <h2 class="uk-modal-title">Modify Diary?</h2>
      </div>
      <div class="uk-modal-body">
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
      <div class="uk-modal-footer uk-text-right">
          <button class="uk-button uk-button-default uk-modal-close" type="button">Cancel</button>
          <button data-ecm-save class="uk-button uk-button-primary" type="button">Save</button>
      </div>
  </div>
 </div>`

DiaryTable.prototype.checkboxHTML = `<input class="uk-checkbox" type="checkbox">`

// * Wrap the edit selector button

DiaryTable.prototype.wrapEditSelectorHTML = `<div style="position:relative">
  <a href="#" style="position:absolute; top:-1em; right:0px; display: none" class="uk-icon-button" uk-icon="file-edit"></a>
</div>`
DiaryTable.prototype.wrapEditSelector = function (data, diary, meta, select) {
    const wrapper = this.createHTML(this.wrapEditSelectorHTML),
	  link = wrapper.querySelector('a')
    
    if (!ECM.currentUser().admin && ECM.currentUser().user_id != diary.user_id) {
        return data;
    }

    link.setAttribute('uk-tooltip', 'click to edit')
    wrapper.addEventListener("mouseover", (event) => {
	link.style.display = ''
    });

    wrapper.addEventListener("mouseleave", (event) => {
	link.style.display = 'none'
    });

    link.addEventListener("click", (event) => {
	this.editModal(diary, meta, select);
    })

    wrapper.append(data)
    return wrapper
}

// * The `editModal` function


DiaryTable.prototype.addModalEvent = function (event) {
    this.modal_events.push(event)
}

DiaryTable.prototype.initModal = function () {
    this.modal = this.createHTML(this.modalHTML)
    if (!this.modal_events) { this.modal_events = [] };

    
    this.modal.addEventListener('shown', e => {
	console.log('showed', this.modal)
        const newEvents = this.modal_events.reduce((l, event) => {
	    // This is where we could see different events
	    typeof event === 'function' && event()
	    return []
	}, [])

	console.log('showed', this.modal, newEvents)
	this.modal_events = newEvents;
    })
    
    
         
   
}
			       
		   
DiaryTable.prototype.editModal = function (diary, meta, select) {
    const bdy = this.modal.querySelector('.uk-modal-body'),
	  old_btn = this.modal.querySelector('[data-ecm-save]'),
          btn = old_btn.cloneNode(true),
	  d = Diary.ensure(diary),
	  dt = this.datatable,
	  self = this;
    
    // Any past even listeners? No more!
    old_btn.parentNode.replaceChild(btn, old_btn);

   console.log("b", btn, old_btn)
    
    btn.addEventListener("click", (event) => {
        // console.log('Saving', meta.row, d.entry_changes)
	for (const key of Object.keys(d.entry)) {
	    if (key in d.entry_changes) {
		d.entry[key] = d.entry_changes[key]
	    }

	}
	const blocker = self.createHTML('<div class="uk-overlay-primary uk-position-cover"></div>'),
	      over = self.createHTML(`<div class="uk-overlay uk-position-center uk-light">Saving ...
                                      <br> <span uk-spinner="ratio: 4.5"></span></div>`)
	self.modal.append(blocker)
	self.modal.append(over)
	
        fetch(this.pathExpand('diary.ss?upsert'), {
	    method: 'POST',
	    headers: {
		'Accept': 'application/json, text/plain, */*',
		'Content-Type': 'application/json'
	    },
	    body: JSON.stringify(d.entry)
	}).then(res => res.json())
	    .then(res => {
		blocker.remove()
                over.remove()
                UIkit.modal(this.modal).hide();
		bdy.innerHTML = ''
                dt.draw();

	    });
	// console.log(`${key}: ${value}`);
	
        //console.log('Changed data', d.entry)
	// dt.row(meta.row).data(d.entry).invalidate('data')
	// dt.ajax.reload();    
	
    })
    
    bdy.innerHTML = ''
    bdy.append(d.editor());
    
    
    const date = bdy.querySelector('[name="date"]'),
	  note = bdy.querySelector('[name="note"]')


    this.addModalEvent(_ => {
	if (select === 'note') {
	    
            note.focus();
            note.select();
	} else if (select === 'date') {
	    
            date.focus();
            date.select();
	}
    })
        
    UIkit.modal(this.modal).show();
};





    
DiaryTable.prototype.checkbox = function (diary, meta) {
 //console.log('draw checkbox', diary.closed)
  const inp = this.create('span', s => {
      s.innerHTML = this.checkboxHTML; const i = s.firstElementChild;
      i.remove(); i.checked = diary.closed; return i
  })

    if (!ECM.currentUser().admin && ECM.currentUser().user_id != diary.user_id) {
	inp.setAttribute('disabled', '')
    } else {

    inp.addEventListener("change", (event) => {
	const checked = event.target.checked,
	      d = Diary.ensure(Object.assign({}, diary, { closed: checked }))
	
        event.target.checked = !checked
        this.editModal(d, meta);
        

    });
    }
    
    return inp
}
			 



DiaryTable.prototype.filterButton = function (text, checked) {
    return this.create('div', e => {
	e.innerHTML = '<a class="uk-button uk-button-default" href="#">' +
            text + '&nbsp;<input type="checkbox"' +
	    (checked ? 'checked' : '') +'></a>'
	const a = e.firstChild
        // console.log('First', a)
	a.remove()

	  return a
    })
}

DiaryTable.prototype.selectUser = function () {

    if (this._selectUser) { return this._selectUser.element };

    const obj = new SelectUser('diary');

    this._selectUser = obj

    obj.element.addEventListener("change", _ => {
	this.datatable.draw()
    })

    return obj.element
}

DiaryTable.prototype.filterSelectUser = function () {
    console.warn(this, this.selectUser)
    var children = this.selectUser().children;
    console.log('Select childs', children)
    for (let i = 0; i < children.length; i++) {
	 let opt = children[i];
        console.log('opt',  opt, opt.dataset.n, this, this.pending)
	// Do stuff
	if ((parseInt(opt.dataset.n) > 0 && !this.pending) ||
	    (opt.dataset.n == "0" && !this.finished))
	{
	    opt.style.display = 'none'
	} else {
	    opt.style.display = ''
	}
    }
}


    
DiaryTable.prototype.filterButtons = function (args) {
    const pendBtn = this.filterButton("Pending", true),
	  finBtn = this.filterButton("Finished", false),
	  wrap = this.create('div', d => {
	      d.append(pendBtn);
	      d.append(finBtn)
	      d.append(this.selectUser());
	  }),
	 self = this;


    pendBtn.addEventListener(
	"change", e => {
            self.pending = e.target.checked
	    self.datatable.search.fixed('pending', e.target.checked).draw()
            self.filterSelectUser()
	})
    finBtn.addEventListener(
	"change", e => {
	    self.datatable.search.fixed('finished', e.target.checked).draw()
            self.finished = e.target.checked
            self.filterSelectUser()
	})

    Object.assign(globalThis._debug_, {
	pendBtn, finBtn
    })

    return wrap;
    
    
}
