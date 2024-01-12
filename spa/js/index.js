// Constructor =EcmSPA=


function EcmSPA () {
  this.router = new EcmRouter()
 return this;
}

// Initialize an element


EcmSPA.prototype.initFunctions = {}
EcmSPA.prototype.initElement = function(el) {
    Object.values(this.initFunctions).forEach(init => {
	init.call(this, el)
    })
    
    $(el).data('ecm-instance', true)
    return el
}

// Load an element


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

// Replace an element


EcmSPA.prototype.replaceElement = function(from, to, use_cache = true){
   return this.loadElement(to, use_cache).then(e => {
      from.replaceWith(e)
      return e
    })
}

EcmSPA.prototype.initFunctions.ecm_replace = function (el) {
    const init = (e) => { this.replaceElement(e, $(e).data('ecm-replace'))};
    if (el.hasAttribute('data-ecm-replace')) { init(el) }
  
    $(el).find('[data-ecm-replace]').each((_, e) => {  init (e) })
    
}

// Pages, in single page? The router


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
	return this
    } ;

    return this.elementPromise(args).then(element => {

  	
  	$(element).on("click",function(event){
  	    const elq = $(element).find('.ecm-options').toggle();
  	});

  	$(element).find('.ecm-options').scroll(function () {
            if ($(this)[0].scrollHeight - $(this).scrollTop() <=  $(this).outerHeight()) {
  		alert("end of scroll");
  		// You can perform as you want

            }
  	});

  	$(element).find("input").each((n,e) => $(e).data("ecm-autocomplete", self))
	self.target = element;

	//  alert('asd')

  	return element;
    });
};


EcmAutoComplete.prototype.element_cache = false;

EcmAutoComplete.prototype.default_element_args = {
    location: "/autocomplete.html",
    refresh: false
};

EcmAutoComplete.prototype.elementPromise = function (args = {}) {
    const Args = Object.assign({}, this.default_element_args, args),
  	  loc = Args.location,
  	  ref = Args.refresh

    if (this.element_cache && !ref) {
  	return new Promise((r) => r(this.element_cache))
    } else {
  	return fetch(loc)
  	    .then(res => res.text()
    		  .then(t => {
  		      const edoc = new DOMParser().parseFromString(t, "text/html")
  		      this.element_cache = edoc.body.firstChild
                      return this.element_cache
  		  }))
    }
}

var search_terms = ['apple', 'apple watch', 'apple macbook', 'apple macbook pro', 'iphone', 'iphone 12'];

EcmAutoComplete.prototype.autocompleteMatch = function (input) {
    if (input == '') {
	return [];
    }
    var reg = new RegExp(input)
    return search_terms.filter(function(term) {
	if (term.match(reg)) {
  	    return term;
	}
    });
}

EcmAutoComplete.prototype.showResults = function (val) {
    resq = $(this.target).find(".ecm-options")
    res = resq[0]
    if (!this.firstHTML) { this.firstHTML = res.innerHTML }
    res.innerHTML = '';

    let list = '';
    let terms = this.autocompleteMatch(val);
    for (i=0; i<terms.length; i++) {
	list += '<li><a href="javascript:;">' + terms[i] + '</a></li>';
    }
    list ? resq.show() : resq.hide();
    res.innerHTML =  list || this.firstHTML;
}

 EcmDateTime.prototype.elementHtml = `
 <div data-ecm-date-wrapper class="ecm-select uk-select">
  <input type="hidden" data-ecm-select-name>
  <form autocomplete="off">
   <input class='uk-input' type="text" data-ecm-select-text>
   <ul class="ecm-options" data-ecm-options></ul>
  </form>
 </div>`;

EcmAutoComplete.prototype.makeEmptyElement = function(html = false) {
 const edoc = new DOMParser().parseFromString(html || this.elementHtml, "text/html"),
       child = edoc.body.firstChild
    return child;
}
EcmSPA.prototype.initFunctions.ecm_auto_complete = (el) => {
    function init (e) { return new EcmAutoComplete(e, true) };
    if (el.hasAttribute('data-ecm-select')) { init(el) }
  
     
    $(el).find('[data-ecm-select]').each((_, e) => {  init (e) })
    
}
EcmAutoComplete.prototype.selectToObject = (select) => {
  return {
	name: select.name,
	options: [... select.options].map(o => {
	    return {
		value: o.value,
		text: o.text
	    }
	})
  }
};
 EcmAutoComplete.prototype.elementHtml = `
 <div data-ecm-select class="ecm-select uk-select">
  <input type="hidden" data-ecm-select-name>
  <form autocomplete="off">
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
    }

    ul.innerHTML = ul.innerHTML + list
}


	    
EcmAutoComplete.prototype.makeElement = function (name = '', opts = [], html = false) {
    const el = this.makeEmptyElement(html)
    console.log('el', el)
    $(el).find('[data-ecm-select-name]').each((_, e) => {
	this.nameInput = e
	e.setAttribute('name', name)
    });
    $(el).find('[data-ecm-select-text]').each((_, e)  => { this.textInput = e });
    $(el).find('[data-ecm-options]').each((_, e) => {
	this.optionsUl = e
	this.addOptions(opts)
    });
    console.log('el', el)
return el;
};

EcmAutoComplete.prototype.makeElementFromSelect = function (sel, html = false) {
 const {name, options} = this.selectToObject(sel)

 return this.makeElement(name, options)
}
  EcmAutoComplete.prototype.elementCss = `
      .ecm-select { width: unset; position:relative; z-index: 9}

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
       z-index: 8; 
       float: left;
       list-style: outside none none; max-height:220px; overflow:auto;
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
     ul.ecm-options li a:hover {
     background: none repeat scroll 0 0 #eff4f6;
     cursor: pointer;
     text-decoration: underline;
	color: #1e87f0;
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
 
          

function EcmDateTime(el) {
  if (el.jquery) { el = el[0] };

return this.init(el);
}      

 $(function () {
    globalThis.ECM = new EcmSPA();

 $("#EcmSPA").each((_, e) => {
 	ECM.loadElement('/main.html')
	    .then(ne => { $(e).empty(); $(e).append(ne) })
     });

});
