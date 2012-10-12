# The :focus selector problem with Selenium/Capybara-Webkit in JQuery 1.8.*

Unfortunately the `:focus` pseudo-selector with JQuery 1.7.* and JQuery 1.8.* when used with [Selenium](http://seleniumhq.org/projects/webdriver/), [Capybara-WebKit](https://github.com/thoughtbot/capybara-webkit) or most likely any other headless browser used for automated browser testing, does not work.  The issue stems from the fact that `:focus` will normally return the focussed element on a page, however when the browser itself does not have focus, then `:focus` will return no element.  Now of course in a headless web browser or when using Selenium which runs in the background, the window itself will always be out of focus and as such `:focus` will not work.  The fix for this in JQuery 1.7.* was documented in my blog post [Testing focus with JQuery and Selenium or Capybara-Webkit](http://blog.mattheworiordan.com/post/9308775285/testing-focus-with-jquery-and-selenium-or) and in this Gist at [https://gist.github.com/1166816](https://gist.github.com/1166816).

A more robust fix is now implemented in a few lines in the file [jquery.focus.test-fix.js](https://github.com/mattheworiordan/jquery-focus-selenium-webkit-fix/blob/master/app/assets/javascripts/jquery.focus.test-fix.js)

This repo is a simple Rails app with integration tests using [Selenium](http://seleniumhq.org/projects/webdriver/) and [Capybara-WebKit](https://github.com/thoughtbot/capybara-webkit).  These tests show that `:focus` fails when the [JQuery Focus Test Fix](https://github.com/mattheworiordan/jquery-focus-selenium-webkit-fix/blob/master/app/assets/javascripts/jquery.focus.test-fix.js) library is not included, and succeeds when the library is included.

## Just give me the code

Go to [jquery.focus.test-fix.js for headless browsers (Seleniu, Webkit etc)](https://github.com/mattheworiordan/jquery-focus-selenium-webkit-fix/blob/master/app/assets/javascripts/jquery.focus.test-fix.js)

## To run the tests locally

Download the repo then:

    bundle install
    rake db:migrate
    rake spec

## Code example for `:focus` issue that will fail under Selenium / Capybara-WebKit, yet works in a browser

Please ensure you have a single visible input element on the page, and JQuery installed.

    function testFocus() {
      $('input:first').focus();
      if ($('input:focus').length == 0) {
        console.error('Test failed - no element has focus');
      } else {
        console.log('Focus test worked');
      }
    }
    testFocus();

You can easily replicate this issue in a browser even by simply running the above code in the console which will pass. Then execute `setTimeout(testFocus, 5000)` and move your OS focus to another window other than the browser and watch the test fail in the console.

## Brought to you by

Matthew O'Riordan
[http://mattheworiordan.com](http://mattheworiordan.com)

## License

Licensed under the "[I don't give a fuck license](http://www.youtube.com/watch?v=0IgHufsnQt4)" meaning you can do what you like with this code, just don't come crying to me.