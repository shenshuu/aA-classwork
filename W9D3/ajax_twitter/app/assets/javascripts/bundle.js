/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./frontend/follow_toggle.js":
/*!***********************************!*\
  !*** ./frontend/follow_toggle.js ***!
  \***********************************/
/***/ ((module) => {

class FollowToggle {
    constructor(el) {
        this.userId = el.data.userId;
        this.followState = el.data.followState;
        this.$el = $(el);
        this.render();

        this.handleClick(e)
            .then
    }

    render() {
        if (btn.followState === 'followed') {
            btn.innerText = 'Follow!';
        } else {
            btn.innerText = 'Unfollow!';
        }
    }

    handleClick(e) {
        e.preventDefault();
        if (this.followState === 'unfollowed') {
            return $.ajax({
                method: 'POST',
                url: `users/${this.userId}/follow`,
                dataType: '$.ajax',
            });
        } else {
            return $.ajax({
                method: 'DELETE',
                url: `users/${this.userId}/follow`,
                dataType: '$.ajax',
            });
        }

    }

}

module.exports = FollowToggle;

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
var __webpack_exports__ = {};
// This entry need to be wrapped in an IIFE because it need to be isolated against other modules in the chunk.
(() => {
/*!*****************************!*\
  !*** ./frontend/twitter.js ***!
  \*****************************/
const FollowToggle = __webpack_require__(/*! ./follow_toggle */ "./frontend/follow_toggle.js");

document.addEventListener("DOMContentLoaded", function () {
    $('button').each(function(index, btn) {
        console.log(index);
        console.log(btn);
   
    })
});


})();

/******/ })()
;
//# sourceMappingURL=bundle.js.map