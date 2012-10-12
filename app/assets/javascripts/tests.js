/* These tests rely on 1 input text field and 1 textarea field being present on the page */

describe("Focus tests", function() {
  it("tests whether the :focus selector works with the first input text field", function() {
    $('input:first').focus();
    expect($("input:first").is(':focus')).toBe(true);
  });

  it("tests whether the :focus selector doesn't return the first input text field if blurred", function() {
    $('input:first').blur();
    expect($("input:first").is(':focus')).toBe(false);
  });

  it("tests whether the :focus selector works with the first textarea field", function() {
    $('textarea:first').focus();
    expect($("textarea:first").is(':focus')).toBe(true);
  });

  it("tests whether the :focus selector doesn't return the first textarea field if blurred ", function() {
    $('textarea:first').blur();
    expect($("textarea:first").is(':focus')).toBe(false);
  });

  it("tests whether the :focus selector works with the first link field", function() {
    $('a:first').focus();
    expect($("a:first").is(':focus')).toBe(true);
  });

  it("tests whether the :focus selector doesn't return the first link field if blurred", function() {
    $('a:first').blur();
    expect($("a:first").is(':focus')).toBe(false);
  });
});