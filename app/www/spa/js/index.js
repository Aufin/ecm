// Pages, in single page? The router
// :PROPERTIES:
// :CUSTOM_ID: pages-in-single-page-the-router
// :END:


function EcmRouter() {
    this.elements = {}
    return this;
}

EcmRouter.prototype.loadElement = function(name, use_cache = true) {
    if (use_cache) {
	const el = this.elements[name]
	if (el) { return new Promise(r => r(el)); }
    }
    
    return fetch(name)
    	.then(res => res.text()
      	      .then(t => {
    		  const edoc = new DOMParser().parseFromString(t, "text/html"),
			el = edoc.body.firstChild
    		  this.elements[name] = el
		  return el
    	      })
	     )
}

// Constructor =EcmSPA=
// :PROPERTIES:
// :CUSTOM_ID: constructor-ecmspa
// :END:


function EcmSPA () {
    this.router = new EcmRouter()
    this.locale = Intl.DateTimeFormat().resolvedOptions().locale;
       return this;
}

// =.querySelector= mostly to find data attributes
// :PROPERTIES:
// :CUSTOM_ID: queryselector-mostly-to-find-data-attributes
// :END:

// This is because we want to modify/replace elements as they are loaded.


EcmSPA.prototype.querySelectorAll = function(el, ... sels){
   const selThis = el.matches(... sels), selC = el.querySelectorAll(... sels)

  return [... selThis ? [el] : [], ... selC]
}

// Get/Set cookies


EcmSPA.prototype.setCookie = function (cname, cvalue, exdays) {
  const d = new Date();
  d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
  let expires = "expires="+d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

EcmSPA.prototype.getCookie = function (cname) {
  let name = cname + "=";
  let ca = document.cookie.split(';');
  for(let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// Initialize an element
// :PROPERTIES:
// :CUSTOM_ID: initialize-an-element
// :END:


EcmSPA.prototype.initFunctions = {}
EcmSPA.prototype.initElement = function(el) {
    // console.warn("Init fns?", this.initFunctions, this)
    Object.values(this.initFunctions).forEach(init => {
	init.call(this, el)
    })
    
    $(el).data('ecm-instance', true)
    return el
}

// Load an element
// :PROPERTIES:
// :CUSTOM_ID: load-an-element
// :END:


EcmSPA.prototype.loadElement = function(name, use_cache = true){
   return this.router.loadElement(name, use_cache).then(e => {
    // some elements might replace themselves
      const bdy = document.createElement('div');
       bdy.append(e)
	if (!$(e).data('ecm-instance')) {
	    this.initElement(e)
	}
	return bdy.firstChild
    })
}

// =replaceElement= Replace an element
// :PROPERTIES:
// :CUSTOM_ID: replaceelement-replace-an-element
// :END:


EcmSPA.prototype.replaceElement = function(from, to, use_cache = true){
   return this.loadElement(to, use_cache).then(e => {
      from.replaceWith(e)
      this.fixScriptsSoTheyAreExecuted(e)
      return e
    })
}

EcmSPA.prototype.initFunctions.ecm_replace = function (el) {
    const init = (e) => { this.replaceElement(e, $(e).data('ecm-replace'))};
    this.querySelectorAll(el, '[data-ecm-replace]').forEach(init) 
}

// =.loadScript= Dynamic Loading of JavaScript files
// :PROPERTIES:
// :CUSTOM_ID: loadscript-dynamic-loading-of-javascript-files
// :END:


EcmSPA.prototype.loadScript = function (src) {
    const el = document.createElement('script'),
	  pro = new Promise((res) => {
	      el.onload = _ => {
		  el.remove()
		  res(el)
	      }
	  })
	  el.setAttribute('src', src)
    
    this.element = el;
    document.body.append(el)
    return pro
}

EcmSPA.prototype.domElements = {}

EcmSPA.prototype.addDomElement = function (domEl, ecmEl) {
    const map = this.domElements[ecmEl.constructor.name], cache =  map || new WeakMap()
    cache.set(domEl, ecmEl)
    if (!map)  this.domElements[ecmEl.constructor.name] = cache
}
    
EcmSPA.prototype.getElement = function (domEl, type = false) {
    if (type) {
	return this.domElements[type].get(domEl)
    } else {
	let ret = undefined,
	    arr = Object.values(this.domElements)
	for (let i = 0; i < arr.length ; i++) {
	    const el = arr[i].get(domEl)
	    if (typeof el !== 'undefined') {
		ret = el ; break
	    }
	}

	if (typeof ret !== 'undefined') {
	    return ret
	} else {
	    const p = domEl.parentNode
	    if (p) {
		return this.getElement(p)
	    } else return ret
	}
    }

}

function EcmElement(el) {
    this.addDomElement(el)
    
    return this
};
    
Object.defineProperty(EcmElement.prototype, 'ECM', {
  get() { return globalThis.ECM || EcmSPA.prototype }
})

    
EcmElement.prototype.addDomElement = function (el) {
    return this.ECM.addDomElement(el, this)
}

EcmElement.prototype.currentScript = document.currentScript;

EcmElement.prototype.pathExpand = function (postfix = '', path = false) {
    const uri = path || this.currentScript.src.split('?')[0],
	  dir = path || uri.split('/').slice(0, -1).join('/')+'/'
    
    return dir + postfix;
}

EcmElement.prototype.create = function (thing, init = e => e) {
    const el = document.createElement(thing),
	  ret = init(el);
    
    return ret || el;
}

EcmElement.prototype.createHTML = function (html, init = e => e) {
    return this.create('div', div => {
	div.innerHTML = html;
	const child = div.firstElementChild
	child.remove()
	return child
    })
}


// .linkForm : Edit an object

EcmElement.prototype.captureInputs = function(element, object) {
    const el = element || this.element,
	  obj = object || {}
    
    el.querySelectorAll('input').forEach(i => {
      // console.log('Capture change on ', i.name, i)
	if(i.name) {
	    i.addEventListener('change', e => { 
		obj[e.target.name] = e.target.value
		// console.log(`Changed ${e.target.name} to ${e.target.value}`, obj)
	    })
	}
    })

    return obj;
}


EcmElement.prototype.setInputs = function(element, object) {
    const el = element || this.element,
	  obj = object || {},
	  handler = {
	      get(target, prop) {
		  const inp = el.querySelector(`[name="${prop}"`)
                  if (inp && inp.type == 'checkbox') {
		      return inp.checked 
		  } else {
		      return inp ? inp.value : undefined
		  }
		  
	      },
	      set(target, prop, val) {
		  const inp = el.querySelector(`[name="${prop}"`)
		  if (inp) {
		      if (inp.type == 'checkbox') {
			  inp.checked = !!val
		      } else {
			  inp.value = val
		      }
		      return inp;
		  }
	      },
	      has(target, prop) {
		  return !!el.querySelector(`[name="${prop}"`)
	      }
	      
	  },
	  prox = new Proxy(el, handler);

    for (const [key, value] of Object.entries(obj)) {
	if (value) { prox[key] = value }
	// console.log(`${key}: ${value}`);
    }

    return prox
}

    
function EcmAutoComplete (args, replace = false) {
    const self = this;

    self.appendStyle()

    function isElement(element) {
	return element instanceof Element || element instanceof HTMLDocument;  
    }
    
    if (isElement(args)) {
        const existing = $(args).data('ecm-autocomplete')
        if (existing) { return existing }
        if (args.tagName.toLowerCase() !== "select") {
           throw new Error("Cannot yet make an autocomplete from a non-select")
         }
	this.element = this.makeElementFromSelect(args)
        if  (replace) { args.replaceWith(this.element) }
        $(this.element).data('ecm-autocomplete', this);
        this.init(this.element);
	return this
    } ;
};

// * KeyDown

EcmAutoComplete.prototype.onKeyDown = function (event) {
    let lis = $(this.optionsUl).find('li'),
	len = lis.length - 1, idx = -1, e = event
   // event.stopPropagation();
   // console.log('keydown')
    if (event.which === 40 || event.which === 38) {
	$(lis).each((n, e) => {
	    if(e.hasAttribute('data-ecm-selected')) {
                // console.log('idx', n)
	 	e.removeAttribute('data-ecm-selected')
                // console.log('idx', n, e)
	 	idx = n
	    }
	})
    }
        
    if (event.which === 40) {
	// downarrow
        if (idx !== len) {
            idx++;  $(this.optionsUl).show()
        }
        const li = lis[idx]
        li.setAttribute('data-ecm-selected', '')
        li.scrollIntoView()
    } else if (event.which === 38) {
	// uparrow
            if (idx > 0) {
             idx--
            } else { return }
            const li = lis[idx]
            li.setAttribute('data-ecm-selected', '')
            li.scrollIntoView()
	} else if (event.which === 13) {
            // console.log("Return!", $(lis).filter('[data-ecm-selected]'))
	    $(lis).filter('[data-ecm-selected]').each((_, e) => {
		this.selected = e
	    })
						      	    
	}


}

EcmAutoComplete.prototype.init = function (element) {
    this.input = $(element).find('[data-ecm-select-text]').get(0)
    this.display = $(element).find('[data-ecm-select-display').get(0)

    $(this.display).on('click',  e => { console.log('clicked display');  e.stopPropagation(); e.preventDefault()})
    $(this.display).find('a').first().on('click', _ => this.selected = false)
    // console.log('Got input', this.input)
    
    $(this.input).on("keyup", event => {
      if (event.which === 40 || event.which === 38 || event.which === 13) { return }
	this.showResults(this.input.value)
    })
    $(this.input).on("blur", event => { $(this.optionsUl).hide() })

    $(this.optionsUl).on('mouseover', e => {
       const hli = $(e.target).parents('li').get(0)

      // console.log('Monuseose==cver', $(e.target).parents('li'), e.target)
	$(e.currentTarget).find('li').each((_, li) => {
             if (hli == li) {
		 li.setAttribute('data-ecm-selected', true)
	     } else {
		 li.removeAttribute('data-ecm-selected')
	     }
	})
    });
			    
	    
	    
	
    $(this.element).on('keydown', e => this.onKeyDown(e));
    $(this.optionsUl).on('keydown', e => this.onKeyDown(e));

	$(element).on("click",function(event){
  	    $(element).find('.ecm-options').toggle();
	});

    }
		    

 EcmAutoComplete.prototype.autocompleteMatch = function (input) {
   console.log('Matching', input, this.options)
    if (input == '') {
	return [];
    }
    var reg = new RegExp(input)
    return this.options.filter(function({val, text}) {
	if (text.match(reg)) {
  	    return {val, text};
	}
    });
}

EcmAutoComplete.prototype.showResults = function (val) {
    resq = $(this.element).find(".ecm-options")
    res = resq[0]
    if (!this.firstHTML) { this.firstHTML = res.innerHTML }
    res.innerHTML = '';

    let list = '';
    let terms = this.autocompleteMatch(val);
    for (i=0; i<terms.length; i++) {
	list += '<li data-ecm-option="'+terms[i].value+'"><a href="javascript:;">' + terms[i].text + '</a></li>';
    }
    resq.show()
    res.innerHTML = list || (this.input.value == '' ? this.firstHTML : '');
}


Object.defineProperty(EcmAutoComplete.prototype, 'selected', {
    get() { return this.selectedElement },
    set(v) {
	 this.selectedElement = v;
         const disp = v && v.firstChild && v.firstChild.firstChild
		 ? v.firstChild.firstChild.cloneNode(true) : " " //v.firstChild.cloneNode(true) : false
         // console.log('settong', v, disp)
        $(this.optionsUl).hide()
	 if (!v) {
	     $(this.display).css('z-index', '-42')
		 .hide().contents().filter((n) =>  n > 0 ).remove()
	     $(this.input).css('z-index', 'auto')
	 } else {
             
	     $(this.input).css('z-index', '-42')
	    // $(this.display).css('z-index', 'auto')
	     $(this.display).show().css('z-index', 'auto').append(disp)
	 }
	 return v
    }
});
EcmAutoComplete.prototype.selectToObject = (select) => {
  return {
	name: select.name,
        required: $(select).attr('required'),
	options: [... select.options].map(o => {
	    return obj = {
		value: o.value,
		text: o.text,
		selected: o.selected
	    }
	})
  }
};

EcmAutoComplete.prototype.elementHtml = `
   <div data-ecm-select-wrapper class="ecm-select uk-select">
    <input type="hidden" data-ecm-select-out>
    <form autocomplete="off">
    <div data-ecm-select-display><a class="ecm-close" href="#"></a></div>
     <input class='uk-input' type="text" data-ecm-select-text>
     <ul class="ecm-options" data-ecm-options></ul>
    </form>
   </div>`;

  EcmAutoComplete.prototype.makeEmptyElement = function(html = false) {
   const edoc = new DOMParser().parseFromString(html || this.elementHtml, "text/html"),
         child = edoc.body.firstChild
      return child;
  }
EcmAutoComplete.prototype.optionsUl = false;
EcmAutoComplete.prototype.addOptions = function (opts) {
    const ul = this.optionsUl 
    var list = ''
    
    for (i=0; i<opts.length; i++) {
	list += '<li data-ecm-option'
	    + ((val = opts[i].value) => {
	      if (val) {
		  return '="' + val + '"';
	      } else  { return '' }
	  })()
	    + '><a href="#">'+opts[i].text+'</a></li>'
	if (opts[i].selected) this.selected = opts[i]
    }

    ul.innerHTML = ul.innerHTML + list
}


	    
EcmAutoComplete.prototype.makeElement = function (name = '', opts = [], html = false) {
    const el = this.makeEmptyElement(html)
    // console.log('el', el)
    $(el).find('[data-ecm-select-name]').each((_, e) => {
	this.nameInput = e
	e.setAttribute('name', name)
    });
    $(el).find('[data-ecm-select-text]').each((_, e)  => { this.textInput = e });
    $(el).find('[data-ecm-options]').each((_, e) => {
	this.optionsUl = e
	this.addOptions(opts)
    });
   this.options = opts
   // console.log('el', el, ' opts ', this.options)
return el;
};

EcmAutoComplete.prototype.makeElementFromSelect = function (sel, html = false) {
 const {name, options} = this.selectToObject(sel)

 return this.makeElement(name, options)
}
EcmAutoComplete.prototype.elementCss = `
 .ecm-select { width: unset; position:relative; z-index: 1}

  .ecm-select input {
    background: unset;
    height: 30px;
     vertical-align: unset;
 }

     .ecm-options{
       background-clip: padding-box;
       background-color: #fff;
       border: 1px solid #dfe8f1;
       border-top: unset;
       border-radius: 3px;
       box-shadow: 0 1px 7px 2px rgba(135, 158, 171, 0.2);
       display: none;
       list-style: outside none none;
       padding: 0 0 10px;
       position: absolute;
       z-index: 0; 
       float: left;
       list-style: outside none none; max-height:220px; overflow:scroll;
       margin:0px;
       left:0px;
       right:0px;
       
     }

     ul.ecm-options li {
       float: none;
       display: block;
       clear: both;
       position: relative;
     }

     ul.ecm-options li a {
       padding: .9em 1em .9em .8em;
       position: relative;
       clear: both;
       cursor: pointer;
       display: block;
       white-space: nowrap;
       text-overflow: ellipsis;
       overflow: hidden;
       color: #4c4c4c;
       text-decoration: none;
       outline: 0;
     }
          ul.ecm-options li[data-ecm-selected] a {
     background: none repeat scroll 0 0 #eff4f6;
     cursor: pointer;
     text-decoration: underline;
	color: #1e87f0;
    }

 [data-ecm-select-display]  {
   position: absolute;
   top: 0px; right:0px; left: 0px; bottom: 0px;
   background: #f8f8f8;
   color: #666;
   display: none;
   padding-left: 1em;
 } 
 [data-ecm-select-display] a {
    float: right; 
	-webkit-appearance: none;
	-moz-appearance: none;
	width: 1em;
	height: 100%;
	margin: auto;
	margin-right: 0.5em;
        background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 14 14' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(25,25, 25, 1)' stroke-width='1' stroke-linecap='round' stroke-miterlimit='10' d='M1 1 L14 14 M1 14 L14 1'/%3E%3C/svg%3E");
	background-repeat: no-repeat;
	background-position: 100% 50%;
  }

  [data-ecm-select-display] a:hover {
     cursor: pointer;
     text-decoration: underline;
     color: #1e87f0; width: 1.33em;
    }

`;

EcmAutoComplete.prototype.appendStyle = function (replace = false) {
    const existing = $(document.head).data('ecm-autocomplete-style')
    if (existing && !replace) { return existing }
    
    const style = document.createElement('style')
    style.append(this.elementCss)
    $(document.head).append(style)
    $(document.head).data('ecm-autocomplete-style', style)
    return style;
}
 
          

EcmSPA.prototype.initFunctions.ecm_date = function (el) {
    const init = (e) => { new EcmDateTime(e) };
    if (el.hasAttribute('data-ecm-date')) { init(el) }
    $(el).find('[data-ecm-date]').each((_, e) => {  init (e) })
    
}
function EcmDateTime(el, args = {}) {
    const myEl = this.makeElement(),
	  type = (args && args.type) || el.type || 'date',
	  opts = Object.assign({}, this.defaultArgs, args),
	  fmtStr = opts.format || opts.fmt[type],
	  dispFmt = opts.display || opts.disp[type],
	  iconType = opts.icon, locale = opts.locale || this.ECM.locale,
          self = this

    EcmElement.call(this, el)
          
    this.options = opts
    this.locale = locale
    this.dateFormat = fmtStr
    this.displayFormat = dispFmt
    
    $(myEl).data('EcmDateTime', this)
    this.element = myEl;
    this.input = $(myEl).find('[ecm-datetime-input]').get(0)
    this.output = $(myEl).find('[ecm-datetime-output]').get(0)


    this.datepickerArgs = $.datepicker.regional[locale]
	|| $.datepicker.regional['en']
	|| $.datepicker.regional['']

    this.datePicker = $('<input data-ecm-datetime-date type="text">')
	  .appendTo(myEl).get(0)

    $(this.datePicker).datepicker(Object.assign(
	 {},
	 this.datapickerArgs,
	 {
	     showOn: "button",
	     dateFormat: this.dateFormat,
            onSelect(date, dp) {
                // console.log(date, self.parse(date))
                self.Date = self.parse(date);
                self.input.value = self.format(self.displayFormat)
	     }
	 }));

    $(myEl).find('[ecm-datetime-icon]').each((_,e) => {
	  this.icon = e
        $(e).on('click', _ => { $(this.datePicker).datepicker("show") })
    }).attr('uk-icon', iconType)
    

    if (el.jquery) { el = el[0] };
    el.replaceWith(myEl);

    this.initEvents()
  
    return this //.init(el);
}

Object.setPrototypeOf(EcmDateTime.prototype, EcmElement.prototype);

EcmDateTime.prototype.defaultArgs = {
    fmt: {
	date: 'yy-mm-dd'
    },
    disp: {
	date: 'M dd, yy'
    },
    icon: 'calendar'
}

EcmDateTime.prototype.format = function (fmtStr) {
    // console.log('Format', fmtStr, this.Date, this.datepickerArgs) 
   return $.datepicker.formatDate(fmtStr, this.Date, this.datepickerArgs)
}
EcmDateTime.prototype.initEvents = function () {
    // Parse on input
    const self = this
    $(this.input).on('keyup', function() { self.parseEvent() })
    $(this.input).on('change', function() {
       // console.log("change event", $(self.input).parent())
	self.parseEvent()
	$(self.input).parent().removeClass('uk-alert-success uk-alert-danger uk-alert-warning')
    })

}



/* Canadian-French initialisation for the jQuery UI date picker plugin. */
jQuery(function ($) {
	$.datepicker.regional['fr-CA'] = {
		closeText: 'Fermer',
		prevText: 'Précédent',
		nextText: 'Suivant',
		currentText: 'Aujourd\'hui',
		monthNames: ['janvier', 'février', 'mars', 'avril', 'mai', 'juin',
			'juillet', 'août', 'septembre', 'octobre', 'novembre', 'décembre'],
		monthNamesShort: ['janv.', 'févr.', 'mars', 'avril', 'mai', 'juin',
			'juil.', 'août', 'sept.', 'oct.', 'nov.', 'déc.'],
		dayNames: ['dimanche', 'lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi'],
		dayNamesShort: ['dim.', 'lun.', 'mar.', 'mer.', 'jeu.', 'ven.', 'sam.'],
		dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
		weekHeader: 'Sem.',
		dateFormat: 'yy-mm-dd',
		firstDay: 0,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: ''
	};
});
EcmDateTime.prototype.setDate = function(val) {
    if (val instanceof Date || !val) {
	this._Date = val
        this.output.value = this.format(this.dateFormat)
        
	return val
    } else if (typeof val == 'object') {
	const valDate = this._Date || new Date()
	if (val.year) valDate.setFullYear(val.year)

	if (val.month) {
	    valDate.setMonth(val.month - 1)
	} else valDate.setMonth(0)
    if (val.day) {
	    valDate.setDate(val.day)
	} else valDate.setDate(1)


	return this.setDate(valDate)
    }
}

Object.defineProperty(EcmDateTime.prototype, "Date", {
    get() { return this._Date || false },
    set(val) { return this.setDate(val) }
})
	
EcmDateTime.prototype.parseLocales = ['en-CA', 'fr-CA'];
EcmDateTime.prototype.parse = function(str = false) {
    var firstLocale = this.locale || $('body').data('ecmSPA').locale,
	Locales = [firstLocale, ... this.parseLocales.filter(l => l !== firstLocale)],
	string = !!str ? str : this.input.value,
	parse = (l) => anyDateParser.attempt(string, l),
	date = false, n = 0

    while (!date && Locales[n]) {
	const ret = parse(Locales[n])

	if (!ret.invalid) {
	    date = ret
	} else {
	    n = n + 1
	}
    }

    return date
}

EcmDateTime.prototype.parseEvent = function() {
    const wrapper = $(this.icon).parent()

    $(wrapper).removeClass('uk-alert-success uk-alert-danger uk-alert-warning')
	.addClass('uk-alert-warning')
	.attr('uk-tooltip', 'parsing ...')

    $(wrapper).each((_, element) => UIkit.tooltip(element).show())

    this.icon.style.color = 'unset'
    

    const date = this.parse()
    this.Date = date

    if (date) {
        // console.log('parsed: ', date);
        $(wrapper).each((_, element) => UIkit.tooltip(element).hide())
	$(wrapper).removeClass('uk-alert-warning').addClass('uk-alert-success')
	    .attr('uk-tooltip', this.output.value)
        $(wrapper).each((_, element) => UIkit.tooltip(element).show())
    }

}

 EcmDateTime.prototype.elementHtml = `
 <div data-ecm-datetime-wrapper class="uk-margin uk-inline uk-input">
          <a ecm-datetime-icon class="uk-form-icon uk-form-icon-flip" href="#" uk-icon="icon: link"></a>
          <input ecm-datetime-input class="uk-input" type="text">
          <style> [data-ecm-datetime-wrapper] { }
           [data-ecm-datetime-wrapper] .uk-input {
               background: unset;
               height: 38px;
               vertical-align: unset;
            border: 0px;
           }
           [data-ecm-datetime-wrapper] .ui-datepicker-trigger { display: none }
           [data-ecm-datetime-wrapper] .hasDatepicker { 
             position: absolute; bottom: 0px ; border: none; height:0px; width:0px; z-index; -42 }
           [data-ecm-datetime-wrapper] .hasDatepicker:focus-visible {
	        outline: none
             }
           </style>
          <input ecm-datetime-output type="hidden">
</div> 
`;
EcmDateTime.prototype.makeElement = function(html = false) {
 const edoc = new DOMParser().parseFromString(html || this.elementHtml, "text/html"),
       child = edoc.body.firstChild
    return child;
}      


EcmSPA.prototype.currentScript = document.currentScript;

EcmSPA.prototype.pathExpand = function (postfix = '', path = false) {
    const uri = path || this.currentScript.src.split('?')[0],
	  dir = path || uri.split('/').slice(0, -1).join('/')+'/'
    
    return dir + postfix;
}

 EcmSPA.prototype.fixScriptsSoTheyAreExecuted = (el) => {
var scripts = el.querySelectorAll('script'),
    script, fixedScript, i, len;

for (i = 0, len = scripts.length; i < len; i++) {
  script = scripts[i];

  fixedScript = document.createElement('script');
  // console.log(script)
  fixedScript.type = script.type;
  fixedScript.innerHTML = script.innerHTML;
  script.src ? fixedScript.src = script.src : false;
  script.onload ? fixedScript.onload = script.onload : false;
  fixedScript.async = false;

  script.parentNode.replaceChild(fixedScript, script);
}
}

window.addEventListener("load", (event) => {
    const ECM =  new EcmSPA();
    globalThis.ECM = ECM

    ECM.body = document.querySelector("#EcmSPA")

    ECM.loadScript(ECM.pathExpand('EcmSelect.js')).then(_ => {
 	ECM.loadElement(ECM.body.dataset.uri).then(main => {
	    ECM.body.replaceChildren(main)
            ECM.fixScriptsSoTheyAreExecuted(main)
          
	})
    })
});
