<!DOCTYPE html>
<!-- INTENTIONALLY BROKEN TEST FIXTURE
     Purpose: Trigger quality gate failures for QA pipeline testing.
     DO NOT USE IN PRODUCTION.
     Expected issues: HTML validation, ESLint, a11y, Lighthouse, security scanners. -->
<html>
<head>
  <meta charset="utf-8">
  <!-- Missing: viewport meta (Lighthouse mobile-friendly fail) -->
  <!-- Missing: <title> proper (empty title) -->
  <title></title>

  <!-- Deprecated tag usage (HTMLHint: deprecated) -->
  <center><font color="red" size="7">BROKEN TEST PAGE</font></center>

  <!-- Inline styles (stylelint / CSS quality gate) -->
  <style>
    .bad { color: red !important; background: #fff; }
    /* Duplicate selector + empty rule */
    .bad { }
    .bad { color: red !important; }
    /* Unused class */
    .never-used { display: none; }
    /* Missing semicolons, unknown property */
    .weird {
      colr: blue
      font-size 12px;
      -moz-unknown-thing: 1;
    }
    /* ID selector (specificity smell) */
    #dup, #dup { border: 1px solid black; }
  </style>

  <!-- Deprecated attributes -->
  <body bgcolor="#ffffff" text="#000000" onload="initPage()">

  <!-- Heading hierarchy broken: h1 skipped, multiple h3 -->
  <h3>Heading three first</h3>
  <h3>Another h3</h3>
  <h5>Jumped to h5</h5>

  <!-- Image with no alt, no dimensions, broken src (a11y + perf) -->
  <img src="does-not-exist.png">
  <img src="another-broken.jpg" alt="">
  <img src="icon.png" alt="icon" width="0" height="0">

  <!-- Duplicate IDs (HTMLHint: id-duplication) -->
  <div id="dup">First duplicate id</div>
  <div id="dup">Second duplicate id</div>

  <!-- Unclosed tags -->
  <div>
    <p>Paragraph with no close
    <span>span without close
  </div>

  <!-- Invalid nesting -->
  <ul>
    <div>Not a list item</div>
    <li>Item</li>
  </ul>

  <!-- Form with a11y issues: no label, no name, invalid type -->
  <form>
    <input type="text">
    <input type="emial" name="">
    <select><option>no label</option></select>
    <button></button>
  </form>

  <!-- Anchor with no href, empty link text (a11y fail) -->
  <a href="">click here</a>
  <a>no href</a>
  <a href="javascript:void(0)">bad link</a>

  <!-- Table without headers, no scope, no caption -->
  <table border="1">
    <tr><td>a</td><td>b</td></tr>
    <tr><td>c</td><td>d</td></tr>
  </table>

  <!-- Inline event handlers (CSP violation) -->
  <button onclick="doBadThing()">Click</button>
  <a href="#" onmouseover="alert('xss-ish')">hover</a>

  <!-- Deprecated element -->
  <marquee>Old school</marquee>
  <blink>Also old</blink>

  <!-- Script with lots of ESLint violations -->
  <script>
    // no-unused-vars
    var unusedVariable = 42;
    let alsoUnused;
    const neverRead = "hello";

    // no-undef (calls undefined function)
    function initPage() {
      undefinedFunction();
      doBadThing(); // called from inline handler, also undef
    }

    // eqeqeq (== instead of ===)
    if (1 == "1") { console.log("loose equality"); }

    // no-console
    console.log("debug log left in");
    console.warn("warning left in");
    console.error("error log");

    // no-eval (security: SonarQube blocker)
    var code = "alert('eval')";
    eval(code);

    // no-implied-eval
    setTimeout("console.log('string timeout')", 100);

    // no-debugger (SonarQube / ESLint)
    debugger;

    // no-dupe-keys
    var obj = { a: 1, a: 2 };

    // no-redeclare
    var unusedVariable = "redeclared";

    // no-fallthrough
    switch (1) {
      case 1:
        console.log("one");
      case 2:
        console.log("two");
    }

    // no-cond-assign
    var x;
    if (x = 5) { console.log("assignment in condition"); }

    // no-empty
    if (true) { }

    // no-constant-condition
    while (true) { break; }

    // no-unreachable
    function unreachable() {
      return 1;
      console.log("never runs");
    }

    // consistent-return violation
    function inconsistent(a) {
      if (a) return a;
      // no return here
    }

    // no-shadow
    var y = 1;
    function shadow() { var y = 2; return y; }

    // no-use-before-define
    callMeBeforeDefined();
    function callMeBeforeDefined() {}

    // no-alert (SonarQube / ESLint)
    alert("blocking alert");
    confirm("blocking confirm");
    prompt("blocking prompt");

    // innerHTML with user input (XSS smell)
    var userInput = location.hash;
    document.body.innerHTML += "<div>" + userInput + "</div>";

    // document.write (deprecated)
    document.write("<span>bad</span>");

    // Deprecated API
    var dt = new Date();
    dt.getYear();

    // Missing 'use strict'
    // Missing error handling
    JSON.parse("not json");

    // no-with (strict mode violation)
    with (Math) { var pi = PI; }

    // no-new-wrappers
    var s = new String("hello");
    var n = new Number(5);

    // no-array-constructor
    var arr = new Array(1, 2, 3);

    // no-new-func
    var f = new Function("return 1");

    // no-proto
    var proto = obj.__proto__;

    // no-iterator
    // (skipping for runtime safety)

    // no-else-return
    function elseReturn(a) {
      if (a) { return 1; } else { return 2; }
    }

    // no-lonely-if
    function lonely(a) {
      if (a) {
        if (a > 0) { return 1; }
      }
    }

    // no-floating-decimal
    var num = .5;
    var num2 = 5.;

    // no-multi-spaces
    var spaced    =    true;

    // no-trailing-spaces (trailing whitespace below)
    var trailing = 1;   
    
    // no-mixed-spaces-and-tabs (tab below)
    var mixed = 1;
	
    // no-irregular-whitespace
    var irregular = "hello world";

    // camelcase violation
    var snake_case_var = 1;
    var PascalCaseVar = 2;

    // quotes inconsistency
    var q1 = 'single';
    var q2 = "double";

    // semi (missing semicolons)
    var a = 1
    var b = 2

    // no-extra-semi
    var c = 3;;

    // no-extra-parens
    var d = (1 + 2);

    // no-void
    void 0;

    // no-sequences
    var e = (1, 2, 3);

    // no-return-assign
    function assignReturn() {
      var z;
      return z = 5;
    }

    // no-self-compare
    if (x === x) { console.log("self compare"); }

    // no-unmodified-loop-condition
    var cond = true;
    while (cond) { console.log("infinite-ish"); break; }

    // no-unused-expressions
    "just a string expression";
    1 + 1;

    // no-useless-concat
    var uc = "a" + "b";

    // no-useless-escape
    var ue = "\a";

    // no-warning-comments
    // TODO: fix this later
    // FIXME: this is broken
    // HACK: temporary workaround

    // Require-style violations (if ESLint config expects ES modules)
    // var fs = require('fs'); // would be no-undef in ESM
  </script>

  <!-- Second script with syntax errors (guaranteed parse failure) -->
  <script>
    // Unclosed brace, string, and paren — this WILL throw a SyntaxError
    function totallyBroken( {
      var x = "unterminated string
      if (true {
        console.log('missing paren and brace');
    // Missing closing brace entirely
  </script>

  <!-- Meta refresh (deprecated / a11y) -->
  <meta http-equiv="refresh" content="0; url=#">

  <!-- Deprecated frameborder, missing title, no sandbox -->
  <iframe src="about:blank" frameborder="0" width="100" height="100"></iframe>

  <!-- Footer with hidden text (a11y: hidden-content smell) -->
  <div style="display:none">keyword stuffing SEO spam repeat repeat repeat</div>

  <!-- Missing lang attribute on html (a11y fail) -->
  <!-- Missing: skip link, landmarks, focus styles -->
  <!-- Missing: charset first (charset present but after comments) -->
  <!-- Missing: CSP, SRI, no integrity attributes on external resources -->
  <!-- Missing: favicon (404 in Lighthouse) -->

  <center>
    <font color="gray" size="1">
      Intentionally broken fixture — quality gate test only.
    </font>
  </center>
</body>
</html>
