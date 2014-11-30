// wrap-start.frag.js
(function (root, factory) {
  if (typeof define === 'function') {
    define(factory);
  } else if (typeof exports === 'object') {
    module.exports = factory();
  } else {
    root.Dom2Docx = factory();
  }
}(this, function () {
