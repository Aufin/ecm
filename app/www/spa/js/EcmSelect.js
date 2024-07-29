"use strict";
//debug
globalThis._ECM_SELECT = [];

function EcmSelect(select) {
    const el = this.templateElement(),
	  parent = select.parentElement,
	  input = el.querySelector('form').querySelector('input'),
	  output =  el.querySelector('input'),
	  ul =  el.querySelector('form').querySelector('ul'),
          display =  el.querySelector('[ecm-out]'),
          close = display.querySelector('.ecm-close'),
	  obj = this.selectToObject(select),
	  options = obj.options, self = this


    globalThis._ECM_SELECT.push(self);

    EcmElement.call(this, el);
    output.name = obj.name
    // el.style.position = 'relative'

    select.replaceWith(el);

    Object.assign(this, {
	element: el, output, input, display, ul, options
    })

    el.addEventListener('click', function(event) {
	const disp = ul.style.display, val = self.selectedOption,
	      hidden = disp !== 'block', hide = !hidden
	self.blurred = false;
        event.stopPropagation() 
        // console.log("Clin on EL'=, hidden", hidden, ul.style.display,self.showUl, val, hide)
	ul.style.display = hide || val ? 'none' : 'block'
    })
    el.addEventListener('mouseleave', function () { self.blurred = false ;})
    close.addEventListener('click', function (e) {
       e.stopPropagation() ;
       self.selectOption({value: false})
	self.ul.style.display = 'block'
    })

    ul.addEventListener('mouseover', () => {
      self.showUl = true; input.focus()})
    ul.addEventListener('mouseleave', function () { self.showUl = false ; self.blurred = false})

    // * The input type=text

    input.addEventListener('click', event => { event.stopPropagation() ;})
    input.addEventListener('focus',function () { ul.style.display = 'block'})
    input.addEventListener('blur', function () {
	if (!self.showUl) {
	    ul.style.display = 'none'
	    self.blurred = true;
	}})

    input.addEventListener('keydown', function (event) {
	event.stopPropagation() ;
	self.onKeyDown(this, event)
    })

    input.addEventListener('keyup', function (event) {
	event.stopPropagation() ;
	self.onKeyUp(event)
    })


    
    setTimeout(function test() {
	if (parent.contains(el)) {
	    input.style.height = '' + (el.offsetHeight - 2) + 'px'
	    
	} else {
	    setTimeout(test, 50);
	}
    }, 50);
    
    // Object.assign(ul.style, {
    // 	position: 'absolute', left: '2px', right: '3px',
    //     border: '1px solid #dfe8f1', borderTop: '0px', borderRadius: '3px',
    // 	margin: '0px', listStyle: 'outside none none',
    //     boxShadow: '0 1px 24px 2px rgba(135, 158, 171, 0.2)',
    // 	zIndex: 7, backgroundColor: '#fff', backgroundClip: "padding-box",
    // })

    obj.options.forEach(opt => {
	self.addOption(opt)
    })


	
     // console.log('o?', this.optionElement("foo"), el.offsetHeight)
    // this.ul.append(this.optionElement("foo"))

    // console.log('New EcmSelect', this, this.options)

     if (!document.head.dataset.ecmSelectCss) {
    	document.head.append(this.templateStyleElement())
         document.head.dataset.ecmSelectCss = true
    }

    self.element = el
    
    
    return this;
}

Object.setPrototypeOf(EcmSelect.prototype, EcmElement.prototype);

EcmSPA.prototype.initFunctions.EcmSelect = function (el) {
    this.querySelectorAll(el, '[data-ecm-select]')
	.forEach(e => new EcmSelect(e)) 
}

EcmSelect.prototype.onKeyUp = function (event) {
    if (event.which == 13) {
	 console.log('Hit enter', this, event)
       // this.options[this.hoverIdx()], this.ul.children[this.hoverIdx()])
	const mkOver = this.ul.children[this.hoverIdx()]
	
	if (mkOver) {
	    this.selectOptionElement(mkOver)
	} else {
	    const opt = this.options.find(o => o.selected)
	    if (opt) {
		this.selectOption(opt)
	    }
	    
	}

	this.ul.style.display = 'none'
    }
    else if ([37, 38, 39, 40].some(n => event.which == n)) {
	// do nothing
	null
    
	
    } else {
      // console.log('Filter and set scrolltop');
	this.filter()
	this.ul.scrollTop = 0
    }
}


EcmSelect.prototype.toggleLoading = function (onOrOff) {
    this.loadingEl = this.loadingEl || ((d = document.createElement('div')) => {
	d.setAttribute('uk-spinner', '')
	d.style.float = 'right'
	d.style.display = 'none'
     this.element.append(d)
	return d
    })()

    const loading = this.loadingEl,
	  el = this.element,
          always = typeof onOrOff !== 'undefined',
	  alwaysOn = (always && onOrOff)
    
    if (loading.style.display == 'none' || alwaysOn) {
	el.style.backgroundImage = 'unset';
	el.style.paddingRight = 'unset';
	loading.style.display = ''
    } else {
	el.style.backgroundImage = '';
	el.style.paddingRight = '';
	loading.style.display = 'none'
    }
}

	
   
  
EcmSelect.prototype.filter = function (txt = false) {
   let values = this.element.querySelectorAll('[data-ecm-value]'),
       limit = this.limit || 10,
       count = limit,
        
       filterValue = (item, txt) => {
	   const display = item.textContent.match(txt)
	   if (!display // || count < 1
           ) {
	       item.style.display = 'none'
	   } else {
	       item.style.display = '';
	        count = count - 1
	   }
       },
       // The text is either what is passed OR our input value.
       rtxt = txt || this.input.value,
       // (^foo)|(, foo) for the first time
       srexp = rtxt ? '(^'+rtxt+')|(, '+rtxt+')' : ''
       

    values.forEach(v => filterValue(v, new RegExp(srexp)))

    // none! Try a different match.
    if (count === limit) {
	values.forEach(v => filterValue(v, new RegExp(rtxt)))
    }


}


   
EcmSelect.prototype.onKeyDown = function (el, event) {
    const arrow = (key) => {
	let idx = this.hoverIdx(),
	    opts = [...this.ul.childNodes],
	    len = opts.length,
	    nextOpt = () => {
		return opts.findIndex((v,i) =>
		    i > idx && v.style.display !== 'none')},
	    prevOpt = () => {
		return opts.findLastIndex((v,i) =>
		    i < idx && v.style.display !== 'none')}

	    
	key === 40 ? key = 'down' : key = 'up'

	if (key === 'down' && (idx + 1) < len) {
	    const li = opts[nextOpt()]
	    if (li) {
		this.addHover(li)
		li.scrollIntoView()
            }
	} else if (key === 'up' && (idx - 1 >= 0)) {
	    // console.log('Hit the uparrow', idx, prevOpt())
	    const li = opts[prevOpt()]
	    if (li) {
		this.addHover(li)
		li.scrollIntoView()
	    }
	} else if (key === 'up') {
            this.addHover(false)
	}

            
	// console.log('Hover', idx, ' opts ', opts)
    }

    if (event.which === 40 || event.which === 38) {
	arrow(event.which)
    } else {
	//console.warn("Down!", event, event.key)
    }
	




}
    
    
EcmSelect.prototype.selectToObject = (select) => {
    return {
  	name: select.name,
          required: select.hasAttribute('required'),
  	options: [... select.options].map(o => {
  	    return  {
  		value: o.value,
  		text: o.text,
  		selected: o.selected
  	    }
  	})
    }
};

EcmSelect.prototype.selectedOption = false;

EcmSelect.prototype.selectOption = function (opt) {
    this.selectedOption = opt;
    this.options.forEach(o => {
	o.selected = (o.value === opt.value)
    })
    const val = opt && opt.value,
	  close = this.display.querySelector('.ecm-close'),
	  change = new Event('change');

    // console.log("Selecting Option: ", opt, close)
    this.display.textContent = ''
    this.display.append(close);

    if (val || typeof val === 'string') {
	this.output.value = val
        this.output.dispatchEvent(change)
	this.display.append(opt.text);
        this.input.style.display = 'none'
        this.display.style.display = 'block'
        this.element.style.backgroundImage = 'unset'
        this.element.style.padding = 'unset'
        
    } else {
	this.output.removeAttribute('value');
        this.display.style.display = 'none'
        this.input.style.display = ''
        // this.ul.style.display = 'block'
        this.selectedOption = false
        this.element.style.backgroundImage = ''
        this.element.style.padding = ''
    }
    return opt
}
EcmSelect.prototype.selectOptionElement = function (el) {
    if (!el) { return el }
    const eopt = {
	text: el.textContent,
	value: el.getAttribute("data-ecm-value")
    }, opt = this.options.find(o => o.text == eopt.text)

   
    // console.log('inside select option element', this, this.element)
    this.selectOption(opt || eopt)
    this.ul.style.display = 'none'
    return opt || eopt
}


EcmSelect.prototype.hoverIdx = function () {
    var idx = -1
    
    Array.from(this.ul.children).forEach((el, n) => {
	if (el.hasAttribute('data-ecm-hover')) idx = n;
    })

    // console.log('have Hover IDX', idx)
    return idx
}

EcmSelect.prototype.addHover = function (el) {
    el && el.setAttribute('data-ecm-hover', '')
    Array.from(this.ul.children).forEach(e => {
	if (el !== e) {
	    e.removeAttribute('data-ecm-hover')
	}
    })
}

// EcmSelect.prototype.onKeyDown = function 
	    
EcmSelect.prototype.addOption = function (opt, prep)  {
    // console.log('W Am I here', prep)
    const {text, value, selected} = opt,
          el = this.optionElement(text, value, !!selected),
          ex = false, // this.options.find(o => o.text === text),
          self = this

    // console.log('added option', opt, el, this, self, prepend)
    if (ex) { 
	Object.assign(ex, opt)
    } else this.options.push(opt);
    
    el.addEventListener('mouseover',function () { self.addHover(this) })
    el.addEventListener(
	  'mouseleave', function() {
       this.removeAttribute('data-ecm-hover')})
    el.addEventListener('click', function(event) {
	event.stopPropagation()
	// console.log('Selecting Option Element', this, self, self.hoverIdx())
	self.selectOptionElement(this)
    })

    prep ? this.ul.prepend(el) :  this.ul.append(el)

    return el
}


EcmSelect.prototype.template = `<div data-ecm-select-wrapper \
 class="ecm-select uk-select"
  ><div ecm-out><a class="ecm-close" href="#">&nbsp;</a></div
  ><input type="hidden"
  ><form autocomplete="off"
     ><input class='uk-input' type="text"
     ><ul class="ecm-options" tabindex="0"></ul
  ></form
 ></div>`;

EcmSelect.prototype.templateElement = function(tpl = false) {
    const el = document.createElement('div')
    el.innerHTML = tpl || this.template;
    return el.firstElementChild;
}


EcmSelect.prototype.optionElement = function (txt, value, selected) {
    const li = document.createElement('li'),
	  a = document.createElement('a')
    if (selected) {
    // console.log("Opt:", selected)
	a.innerHTML = `<span style="position: absolute; left:4px ; top: 0.5em"
          uk-tooltip="Default value" uk-icon="check">&nbsp;</span>`
    }
    a.append(txt || "\u00A0")
    if (value || typeof value === 'string') {
	li.setAttribute('data-ecm-value', value)
    }

    li.append(a)
    return li
}

EcmSelect.prototype.templateStyle = `
 .ecm-select { position: relative; }
 .ecm-select [uk-spinner] { position:absolute; right:5px ; top: 5px }

  .ecm-select input {
    background: unset;
    height: 38px;
    vertical-align: unset;
    border: 0px;
 }

     .ecm-options{
       background-clip: padding-box;
       background-color: #fff;
       border: 1px solid #dfe8f1;
       border-top: unset;
       border-radius: 3px;
       box-shadow: 0 1px 7px 2px rgba(135, 158, 171, 0.2);
       display: none;
       padding: 0 0 10px;
       position: absolute;
       z-index: 2; 
       float: left;
       list-style: outside none none; max-height:220px; overflow:scroll;
       margin:0px;
       left:0px;
       right:0px;
       
     }
     ul.ecm-options li a {
       padding-left: 2em;
       cursor: pointer;
       white-space: nowrap;
       text-overflow: ellipsis;
       overflow: hidden;
       color: #4c4c4c;
       text-decoration: none;
       outline: 0;
     }
    ul.ecm-options li[data-ecm-hover] {
     background: none repeat scroll 0 0 #eff4f6;
     cursor: pointer;
     text-decoration: underline;
     color: #1e87f0;
    }

 .ecm-select div[ecm-out]  {
   background: #f8f8f8;
   color: #666;
   max-height: 100%;
   overflow: hidden;
   text-overflow: ellipsis;
   display: none;
   padding-left: 1em;
 } 
 .ecm-select div[ecm-out] a.ecm-close {
	-webkit-appearance: none;
    float: right; 
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

EcmSelect.prototype.templateStyleElement = function (css) {
    const style = document.createElement('style')
    style.append(css || this.templateStyle)
    return style;
}
