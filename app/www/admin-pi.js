ECM.currentAdmin = false;

ECM.isAdmin = function (_then_) {
   if (ECM.currentUser && ECM.currentUser()) {
    return ECM.currentUser().promise.then(u => {
	if (ECM.currentAdmin) {
	    return ECM.currentAdmin
	}
	if (u && u['admin']) {
	    ECM.currentAdmin = u;
	    _then_(u)
	}
    })
   }
}

ECM.isAdmin.modalHTML = `<div id="modal-sections" uk-modal>
<div class="uk-modal-dialog">
    <button class="uk-modal-close-default" type="button" uk-close></button>
    <div class="uk-modal-header">
        <h2 class="uk-modal-title">Administer</h2>
    </div>
    <div class="uk-modal-body">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
    </div>
</div>`
