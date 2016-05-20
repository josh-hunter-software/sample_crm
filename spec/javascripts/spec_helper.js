// Teaspoon includes some support files, but you can use anything from your own support path too.
// require support/jasmine-jquery-1.7.0
// require support/jasmine-jquery-2.0.0
// require support/jasmine-jquery-2.1.0
// require support/sinon
// require support/your-support-file
//
// PhantomJS (Teaspoons default driver) doesn't have support for Function.prototype.bind, which has caused confusion.
// Use this polyfill to avoid the confusion.
//= require support/phantomjs-shims
//
// You can require your own javascript files here. By default this will include everything in application, however you
// may get better load performance if you require the specific files that are being used in the spec that tests them.
//= require application
//= require angular-mocks

beforeEach(function() {
  jasmine.addMatchers({
    toEqualData: function(util, customEqualityTesters) {
      return {
        compare: function(actual, expected) {
          var result = {};
          result.pass = angular.equals(actual, expected);
          return result;
        }
      };
    }
  });
});
