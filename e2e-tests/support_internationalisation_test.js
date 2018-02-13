describe('Support internationalisation', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('./actionwords.js').Actionwords);
  browser.get('http://localhost:8000');
  });

  describe('Messages are based on language', function () {
    function messagesAreBasedOnLanguage (language, ready_message) {
      // Tags: priority:medium
      // When I start the coffee machine using language "<language>"
      this.actionwords.iStartTheCoffeeMachineUsingLanguageLang(language);
      // Then message "<ready_message>" should be displayed
      this.actionwords.messageMessageShouldBeDisplayed(ready_message);
    }

    it('English', function () {
      messagesAreBasedOnLanguage.apply(this, ['en', 'Ready']);
    });

    it('French', function () {
      messagesAreBasedOnLanguage.apply(this, ['fr', 'Pret']);
    });
  });


  it('No messages are displayed when machine is shut down', function () {
    // Tags: priority:medium
    // Given the coffee machine is started
    this.actionwords.theCoffeeMachineIsStarted();
    // When I shutdown the coffee machine
    this.actionwords.iShutdownTheCoffeeMachine();
    // Then message "" should be displayed
    this.actionwords.messageMessageShouldBeDisplayed("");
  });
});