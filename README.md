# hps-protractor

[![Build Status](https://travis-ci.org/hiptest/hps-protractor.svg?branch=master)](https://travis-ci.org/hiptest/hps-protractor)

Hiptest publisher samples with Protractor

In this repository you'll find tests generated for Protractor format from [Hiptest](https://hiptest.net), using [Hiptest publisher](https://github.com/hiptest/hiptest-publisher).

The goals are:

 * to show how tests are exported with Protractor.
 * to check exports work out of the box (well, with implemented actionwords)

System under test
------------------

The SUT is a (not that much) simple coffee machine. You start it, you ask for a coffee and you get it, sometimes. But most of times you have to add water or beans, empty the grounds. You have an automatic expresso machine at work or at home? So you know how it goes :-)

Update tests
-------------

To update the tests:

    hiptest-publisher -c protractor.conf --only=tests

The tests are generated in [``e2e-tests/``](https://github.com/hiptest/hps-specflow/tree/master/e2e-tests)

Run tests
---------


To build the project and run the tests, use the following command:

    npm install
    (npm start > /dev/null &) && (npm run protractor)

The SUT implementation can be seen in [``app/src``](https://github.com/hiptest/hps-specflow/blob/master/app/src). Note that we haven't yet moved the coffee machine to real Angular.js app, but that is planned.
