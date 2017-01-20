———STCHD ADMIN STACK———

Angular
    ||
 Rails
    ||
PostgresDB



Testing frameworks : Rspec, PhantomJS, Poltergeist, Capybara

Rspec -> Used to test db level and active record level cases -> Unit tests on rails components
PhantomJS -> Headless webkit scriptable with javascript API -> Interact with it in our tests. -> Acceptance tests
Capybara -> Rails acceptance tests use this -> Selenium support built in -> simulates how a real user would interact with the app.
Poltergeist -> Helps the communication between capybara and phantomjs -> A driver for capybara
Jasmine -> Unit testing in the angular side of things
Teaspoon -> Rails plugin to integrate Jasmine


Browser provided features are tested using spies.

Test Driven Development (TDD) is implemented as well for a more professional touch ;)






