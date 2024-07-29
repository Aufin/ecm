function User(props) {
    this.object = props;

   if (!this.user_id && this.object.token) {
       this.promise = this.fetchUser().then(r => r.json())
	   .catch(e => {this.object = {} ; return false})
	   .then(r => {
	       console.log("Token got?", r)
               if (r) {
	          Object.assign(this.object, r)
               }
               return r
	   })
   }
  return this;
}

Object.setPrototypeOf(User.prototype, EcmElement.prototype);
User.prototype.currentScript = document.currentScript;

Object.defineProperties(User.prototype, {
    user_id: {
	get() {
	    return this.object.user_id ||
		this.object._id || this.object.app_user_id;
	},
	set(val) {
	    this.object.user_id = val
	}
    },
    admin: {
	get() {
	    return this.object.admin || false
	},
	set(val) {
	    this.object.admin = val
	}
    }
})

User.init = function() {
 // This is a global function that should really only be run at first app
 // runtime OR possibly a user change while running by an admin?

    const token = ECM.getCookie('ecm-login')

  

    console.log('Have Token', token)

    if (token) {
	  const u = new User({token});

	  ECM.currentUser = _ => u;
          return u;
	  
    }
    return false
		 
}

User.prototype.fetchUser = function () {
    const user_id = this.user_id,
    token = this.token || this.object.token

    return fetch(this.pathExpand('user.ss?token=' + token))
}

// * Select users

function SelectUser(_for = 'diary') {
    const sel = this.createHTML('<select class="uk-select uk-inline" placeholder="Select User"></select>'),
	  opt = new Option()

    sel.append(opt)
    sel.setAttribute('uk-tooltip', 'Select User')
    sel.style.width = 'unset'
    this.element = sel;

    this.promise = fetch(this.pathExpand('user.ss?list'))
	.then(r => r.json())
	.then(jarr => {
	    jarr.forEach(([id,name,n]) => {
		const opt = new Option()
		opt.setAttribute('value', id)
                opt.dataset.n = n 
                if (id == ECM.currentUser().user_id) {
		    opt.setAttribute('selected', '')
		}
		opt.append(name)
		sel.append(opt)
	    })
	})
    
    return this
}
    

Object.setPrototypeOf(SelectUser.prototype, EcmElement.prototype);
SelectUser.prototype.currentScript = document.currentScript;
