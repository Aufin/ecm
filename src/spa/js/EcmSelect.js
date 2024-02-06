function EcmSelect(select) {
    const el = this.templateElement(),
	  parent = select.parentElement,
	  input = el.querySelector('form').querySelector('input'),
	  output =  el.querySelector('input'),
	  ul =  el.querySelector('form').querySelector('ul'),
          display =  el.querySelector('form').querySelector('div'),
          close = display.querySelector('.ecm-close'),
	  obj = this.selectToObject(select),
	  options = obj.options, self = this

    EcmElement.call(this, el);
    output.name = obj.name
    el.style.position = 'relative'

    select.replaceWith(el);

    Object.assign(this, {
	element: el, output, input, display, ul, options
    })

    el.addEventListener('click', function(event) {
	const disp = ul.style.display, val = self.selectedOption,
	      hidden = disp !== 'block', hide = !hidden
	self.blurred = false;
        event.stopPropagation() 
        console.log("Clin on EL'=, hidden", hidden, ul.style.display,self.showUl, val, hide)
	ul.style.display = hide || val ? 'none' : 'block'
    })
    el.addEventListener('mouseleave', function () { self.blurred = false ;})
    close.addEventListener('click', function (e) { e.stopPropagation() ;self.selectOption({value: false})})

    ul.addEventListener('mouseover', () => { this.showUl = true; input.focus()})
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
	this.addOption(opt)
    })


	
     // console.log('o?', this.optionElement("foo"), el.offsetHeight)
    this.ul.append(this.optionElement("foo"))

    console.log('New EcmSelect', this)

     if (!document.head.dataset.ecmSelectCss) {
    	document.head.append(this.templateStyleElement())
         document.head.dataset.ecmSelectCss = true
    }

    this.element = el
    
    
    return this;
}

Object.setPrototypeOf(EcmSelect.prototype, EcmElement.prototype);

EcmSPA.prototype.initFunctions.EcmSelect = function (el) {
    this.querySelectorAll(el, '[data-ecm-select]')
	.forEach(e => new EcmSelect(e)) 
}


   
EcmSelect.prototype.onKeyDown = function (el, event) {
    const arrow = (key) => {
	let idx = this.hoverIdx(),
	    opts = this.ul.childNodes,
	    len = opts.length
	key === 40 ? key = 'down' : key = 'up'

	if (key === 'down' && (idx + 1) < len) {
	    const li = opts[idx + 1]
	    this.addHover(li)
            li.scrollIntoView()
	} else if (key === 'up' && (idx - 1 >= 0)) {
	    const li = opts[idx - 1]
	    this.addHover(li)
            li.scrollIntoView()
	} else if (key === 'up') {
            this.addHover(false)
	}

            
	console.log('Hover', idx, ' opts ', opts)
    }

    if (event.which === 40 || event.which === 38) {
	arrow(event.which)
    }
	




}
    
    
EcmSelect.prototype.selectToObject = (select) => {
    return {
  	name: select.name,
          required: select.hasAttribute('required'),
  	options: [... select.options].map(o => {
  	    return obj = {
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
    const val = opt.value, close = this.display.querySelector('.ecm-close')
    console.log("Selecting Option: ", opt, close)
    this.display.textContent = ''
    this.display.append(close);
    if (val || typeof val === 'string') {
	this.output.value = val
	this.display.prepend(opt.text);
        this.display.style.display = 'block'
        
    } else {
	this.output.removeAttribute('value');
        this.display.style.display = 'none'
        this.selectedOption = false
    }
    return opt
}
EcmSelect.prototype.selectOptionElement = function (el) {
    const opt = {
	text: el.textContent,
	value: el.getAttribute("data-ecm-value")
    }
    this.selectOption(opt)
    this.ul.style.display = 'none'
    return opt
}


EcmSelect.prototype.hoverIdx = function () {
    var idx = -1
    
    Array.from(this.ul.children).forEach((el, n) => {
	if (el.hasAttribute('data-ecm-hover')) idx = n;
    })
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
	    
EcmSelect.prototype.addOption = function (opt) {
    const {text, value, selected} = opt
    el = this.optionElement(text, value, selected),
    ex = this.options.find(o => o.text === text),
    self = this

    console.log('added option', opt, el)
    if (ex) { 
	Object.assign(ex, opt)
    } else this.options.push(opt);
    
    el.addEventListener('mouseover',function () { self.addHover(this) })
    el.addEventListener(
	  'mouseleave', function() { el.removeAttribute('data-ecm-hover')})
    el.addEventListener('click', function(event) {
	event.stopPropagation()
	self.selectOptionElement(this)
    })



    this.ul.append(el)

    return el
}




EcmSelect.prototype.template = `<div data-ecm-select-wrapper \
 class="ecm-select uk-select"
  ><input type="hidden"
  ><form autocomplete="off"
     ><div><a class="ecm-close" href="#"></a></div
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
 .ecm-select { position:relative; z-index: 1}

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
       z-index: 0; 
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

 .ecm-select form div  {
   position: absolute;
   top: 0px; right:0px; left: 0px; bottom: 0px;
   background: #f8f8f8;
   color: #666;
   display: none;
   padding-left: 1em;
 } 
 .ecm-select form div a {
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

EcmSelect.prototype.templateStyleElement = function (css) {
    const style = document.createElement('style')
    style.append(css || this.templateStyle)
    return style;
}
