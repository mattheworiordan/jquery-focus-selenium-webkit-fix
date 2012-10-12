# The :focus selector problem with Selenium/Capybara-Webkit in JQuery 1.8.*

I previously addressed a problem when using the :focus pseudo-selector with JQuery 1.7.* and [Selenium](http://seleniumhq.org/projects/webdriver/), [Capybara-WebKit](https://github.com/thoughtbot/capybara-webkit) or most likely any other headless browser used for automated browser testing.  The issue stems from the fact that :focus will normally return the focussed element on a page, however when the browser itself does not have focus, then :focus will return no element.  Now of course in a headless web browser or Selenium which runs in the background, it will always be out of focus and as such :focus would not work.  The fix for this in JQuery 1.7.* was documented in my blog at http://blog.mattheworiordan.com/post/9308775285/testing-focus-with-jquery-and-selenium-or and in this Gist at https://gist.github.com/1166816

However, JQuery 1.8.* seems to have reintroduced this bug, so here is my second attempt at fixing this issue.

## Code example that will fail under Selenium / Capybara-WebKit, yet works in a browser

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

You can easily replicate this issue in a browser even by simply running the above code in the console, then running `setTimeout(testFocus, 5000)` and moving your OS focus to another window other than the browser.