//jshint strict: false
exports.config = {

  allScriptsTimeout: 11000,

  specs: [
    '**/*_test.js'
  ],

  capabilities: {
    'browserName': 'chrome'
  },

  baseUrl: 'http://localhost:8000/',

  framework: 'jasmine',
  jasmineNodeOpts: {
    defaultTimeoutInterval: 30000
  },
  onPrepare: function() {      
    var reporters = require('jasmine-reporters')
    jasmine.getEnv().addReporter(
      new reporters.JUnitXmlReporter({
        savePath: 'test-reports',
        consolidateAll: false
    }));
  },
};
