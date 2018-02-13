exports.Actionwords = {
  iStartTheCoffeeMachineUsingLanguageLang: function (lang) {
    element(by.cssContainingText('option', lang || 'en')).click();
    element(by.id('onOff')).click();
  },

  iShutdownTheCoffeeMachine: function () {
    element(by.id('onOff')).click();
  },

  messageMessageShouldBeDisplayed: function (message) {
    expect(element(by.id('message')).getText()).toEqual(message);
  },

  coffeeShouldBeServed: function () {
    expect(element(by.id('coffee')).getAttribute('class')).toMatch('served');
  },

  coffeeShouldNotBeServed: function () {
    expect(element(by.id('coffee')).getAttribute('class')).not.toMatch('served');
  },

  iTakeACoffee: function () {
    element(by.id('getCoffee')).click();
  },

  iEmptyTheCoffeeGrounds: function () {
    element(by.id('emptyGround')).click();
  },

  iFillTheBeansTank: function () {
    element(by.id('fillBeans')).click();
  },

  iFillTheWaterTank: function () {
    element(by.id('fillWater')).click();
  },

  iTakeCoffeeNumberCoffees: function (coffee_number) {
    this.handled = this.handled || [];

    while ((coffee_number > 0)) {
      this.iTakeACoffee();
      coffee_number = coffee_number - 1;

      if (this.handled.indexOf('water') >= 0) {
        this.iFillTheWaterTank();
      }

      if (this.handled.indexOf('beans') >= 0) {
        this.iFillTheBeansTank();
      }

      if (this.handled.indexOf('grounds') >= 0) {
        this.iEmptyTheCoffeeGrounds();
      }
    }
  },

  theCoffeeMachineIsStarted: function () {
    this.iStartTheCoffeeMachineUsingLanguageLang();
  },

  iHandleEverythingExceptTheWaterTank: function () {
    this.iHandleCoffeeGrounds();
    this.iHandleBeans();
  },

  iHandleWaterTank: function () {
    this.handled = this.handled || [];
    this.handled.push('water');
  },

  iHandleBeans: function () {
    this.handled = this.handled || [];
    this.handled.push('beans');
  },

  iHandleCoffeeGrounds: function () {
    this.handled = this.handled || [];
    this.handled.push('grounds');
  },

  iHandleEverythingExceptTheBeans: function () {
    this.iHandleWaterTank();
    this.iHandleCoffeeGrounds();
  },

  iHandleEverythingExceptTheGrounds: function () {
    this.iHandleWaterTank();
    this.iHandleBeans();
  },

  displayedMessageIs: function (__free_text) {
    this.messageMessageShouldBeDisplayed(__free_text.split("\n").join(""));
  },

  iSwitchToSettingsMode: function () {
    element(by.id('settings')).click();
  },

  settingsShouldBe: function (__datatable) {
  }
};
