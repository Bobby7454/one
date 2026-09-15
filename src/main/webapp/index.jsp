<!DOCTYPE html>
<!-- SONAR BUG: Missing DOCTYPE lang attribute (Web:S5254 - Accessibility) -->
<html>
<head>
  <!-- SONAR BUG: Missing meta charset (Web:S5260) -->
  <!-- SONAR BUG: Missing meta viewport (Web:S5906) -->
  <!-- SONAR BUG: Missing meta description (Web:PageWithoutTitleCheck) -->
  <title></title> <!-- SONAR BUG: Empty title (Web:PageWithoutTitleCheck) -->

  <!-- SONAR BUG: Hard-coded credentials in URL (javascript:S6418) -->
  <link rel="stylesheet" href="https://cdn.example.com/style.css?api_key=sk-1234567890abcdef">

  <style>
    /* SONAR BUG: Duplicate selectors (css:S4666) */
    body { background: black; color: white; }
    body { background: blue; color: red; }
    body { background: green; color: yellow; }

    /* SONAR BUG: !important overuse (css:S4657) */
    .important-class {
      color: red !important;
      background: blue !important;
      font-size: 14px !important;
      margin: 10px !important;
    }

    /* SONAR BUG: Empty ruleset (css:S4654) */
    .empty-rule {}

    /* SONAR BUG: Unknown / invalid property (css:S4655) */
    .typos {
      colr: red;           /* typo */
      backgroud: blue;     /* typo */
      font-weigth: bold;   /* typo */
      margn: 10px;         /* typo */
      disply: flex;        /* typo */
    }

    /* SONAR BUG: Zero values with units (css:S4655 / stylelint) */
    .zero-units {
      margin: 0px;
      padding: 0px;
      border: 0px;
      top: 0px;
      left: 0px;
    }

    /* SONAR BUG: Duplicate properties in same rule (css:S4656) */
    .duplicate-props {
      color: red;
      color: blue;
      color: green;
      margin: 10px;
      margin: 20px;
    }

    /* SONAR BUG: Low color contrast (Web:S5260 / WCAG) */
    .low-contrast {
      color: #cccccc;
      background: #ffffff;
    }

    /* SONAR BUG: Missing semicolons (css:S4652) */
    .missing-semicolon {
      color: red
      background: blue
      margin: 10px
    }

    /* SONAR BUG: Invalid values (css:S4655) */
    .invalid {
      width: -10px;
      height: -50%;
      color: notacolor;
      display: invalid-value;
    }

    /* SONAR BUG: Outline: none removes focus (Web:S5256) */
    button:focus { outline: none; }

    /* SONAR BUG: @import for performance (css:S4647) */
    @import url('https://cdn.example.com/style1.css');
    @import url('https://cdn.example.com/style2.css');

    /* SONAR BUG: Universal selector (css:S4653) */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* SONAR BUG: Excessive nesting specificity */
    body div#main .container .wrapper ul li a.link:hover { color: red; }

    /* SONAR BUG: ID selectors (css:S4653) */
    #header { color: red; }
    #nav { color: blue; }

    /* SONAR BUG: Vendor prefixes without standards */
    -webkit-box-shadow: 0 0 10px black;
    -moz-box-shadow: 0 0 10px black;
    -ms-box-shadow: 0 0 10px black;
  </style>
</head>
<body>

  <!-- SONAR BUG: Missing alt attribute (Web:S1070 - accessibility) -->
  <img src="anime.png">

  <!-- SONAR BUG: Empty alt but decorative not marked (Web:S1070) -->
  <img src="gem.png" alt="">

  <!-- SONAR BUG: Deprecated tags (Web:S1082) -->
  <center>
    <marquee behavior="scroll" direction="left">Anime Site</marquee>
  </center>
  <font color="red" size="5">Welcome</font>

  <!-- SONAR BUG: Inline event handler (Web:S5247 - CSP violation) -->
  <button onclick="doSomething()">Click</button>

  <!-- SONAR BUG: javascript: URL (Web:S5247 - XSS risk) -->
  <a href="javascript:void(0)" onclick="alert('xss')">Link</a>

  <!-- SONAR BUG: Empty href (Web:S1082) -->
  <a href="">Empty link</a>

  <!-- SONAR BUG: Nested interactive elements (Web:S1082) -->
  <a href="#"><button>Nested button in link</button></a>

  <!-- SONAR BUG: Form inputs without labels (Web:S1070 / a11y) -->
  <form>
    <input type="text" placeholder="Name">
    <input type="email" placeholder="Email">
    <input type="submit" value="Submit">
  </form>

  <!-- SONAR BUG: Duplicate IDs (Web:S1082 / a11y) -->
  <div id="container"></div>
  <div id="container"></div>

  <!-- SONAR BUG: Skipped heading level (Web:S1082) -->
  <h1>Main Title</h1>
  <h4>Skipped h2 and h3</h4>

  <!-- SONAR BUG: Table without proper structure -->
  <table>
    <tr>
      <td>Cell</td>
    </tr>
  </table>

  <!-- SONAR BUG: Duplicate attributes (Web:S1082) -->
  <input type="text" type="email" value="test" value="duplicate">

  <!-- SONAR BUG: Unclosed <p> and <span> -->
  <div>
    <p>Unclosed paragraph
    <span>Unclosed span
  </div>

  <!-- SONAR BUG: Block inside paragraph (invalid nesting) -->
  <p>
    <div>Block inside paragraph</div>
  </p>

  <!-- SONAR BUG: Clickable div without keyboard support (Web:S1082 / a11y) -->
  <div onclick="handleClick()">Clickable div</div>

  <!-- SONAR BUG: Obsolete align attribute (Web:S1082) -->
  <p align="center">Centered text</p>

  <!-- SONAR BUG: Empty class and id attributes -->
  <div class="" id=""></div>

  <!-- ==================== JAVASCRIPT BUGS ==================== -->
  <script>
    // ============================================================
    // SONAR BUG: Missing 'use strict' directive
    // SONAR BUG: Using 'var' instead of let/const (javascript:S3504)
    // ============================================================

    // SONAR BUG: Undefined variable usage (javascript:S3827 - ReferenceError)
    function initScene() {
      scene = new THREE.Scene();     // 'scene' not declared
      console.log(missingVariable);  // undefined
      leakedGlobal = 'oops';         // implicit global (javascript:S3800)
    }

    // SONAR BUG: Unused variables (javascript:S1481)
    const unusedConfig = { theme: 'anime' };
    let unusedValue = 42;
    var unusedGlobal = 'never used';

    // SONAR BUG: Unused function (javascript:S1143)
    function unusedFunction() { return 'never called'; }

    // SONAR BUG: Loose equality (javascript:S1440)
    function checkTheme(theme) {
      if (theme == 'anime') return true;   // == instead of ===
      if (theme != 'dark') return false;   // != instead of !==
      return null;
    }

    // SONAR BUG: Console statements in production (javascript:S2228)
    console.log('debug: scene initialized');
    console.error('error log');
    console.warn('deprecation warning');
    console.debug('debugging info');
    console.info('info level');

    // SONAR BUG: Duplicate code (javascript:S4144 - duplicated blocks)
    function createGem() {
      const geo = new THREE.IcosahedronGeometry(1.5, 1);
      const mat = new THREE.MeshStandardMaterial({ color: 0xc084fc });
      const mesh = new THREE.Mesh(geo, mat);
      mesh.position.set(0, 1.2, 0);
      return mesh;
    }
    function createGemCopy() {
      const geo = new THREE.IcosahedronGeometry(1.5, 1);
      const mat = new THREE.MeshStandardMaterial({ color: 0xc084fc });
      const mesh = new THREE.Mesh(geo, mat);
      mesh.position.set(0, 1.2, 0);
      return mesh;
    }

    // SONAR BUG: Cognitive complexity too high (javascript:S3776)
    function processAnime(type, quality, speed) {
      if (type === 'shonen') {
        if (quality === 'high') {
          if (speed > 60) {
            if (Math.random() > 0.5) {
              if (type !== 'seinen') {
                if (quality !== 'low') {
                  return 'perfect';
                } else { return 'ok'; }
              } else { return 'edge-case'; }
            } else { return 'slow'; }
          } else { return 'low-speed'; }
        } else { return 'low-quality'; }
      } else { return 'unknown'; }
    }

    // SONAR BUG: Empty function (javascript:S1186)
    function emptyFunction() {}

    // SONAR BUG: Too many parameters (javascript:S107 - max 7)
    function configureScene(a, b, c, d, e, f, g, h, i, j, k, l) {
      return a + b + c + d + e + f + g + h + i + j + k + l;
    }

    // SONAR BUG: Hard-coded credentials (javascript:S6418 - CRITICAL)
    const API_KEY = "sk-1234567890abcdefghijklmnop";
    const DB_PASSWORD = "admin123";
    const JWT_SECRET = "mysecretkey123";
    const AWS_SECRET = "AKIAIOSFODNN7EXAMPLE";

    // SONAR BUG: eval usage (javascript:S1523 - CRITICAL SECURITY)
    function dangerousEval(userInput) {
      return eval(userInput);
    }

    // SONAR BUG: Function constructor (javascript:S1523)
    const evilFunction = new Function('return 1+1');

    // SONAR BUG: innerHTML usage (javascript:S5696 - XSS)
    function renderUserComment(comment) {
      document.getElementById('comments').innerHTML = comment;
    }

    // SONAR BUG: document.write (javascript:S1523 / S4507)
    document.write('<h1>Anime</h1>');

    // SONAR BUG: Synchronous XHR (javascript:S2819)
    function fetchAnimeDataSync(url) {
      const xhr = new XMLHttpRequest();
      xhr.open('GET', url, false);   // false = synchronous
      xhr.send();
      return xhr.responseText;
    }

    // SONAR BUG: setInterval without clearInterval (javascript:S2589 - memory leak)
    function startAnimation() {
      setInterval(() => {
        console.log('tick');
      }, 1000);
    }

    // SONAR BUG: Empty catch block (javascript:S2486)
    function riskyOperation() {
      try {
        throw new Error('Something failed');
      } catch (e) {
        // empty - silently swallowed
      }
    }

    // SONAR BUG: Catch without rethrowing/handling (javascript:S2486)
    function anotherRisky() {
      try {
        JSON.parse('{invalid json}');
      } catch (e) {
        console.log('error');
      }
    }

    // SONAR BUG: Off-by-one error (javascript:S2190 / logic)
    function loopThroughItems(items) {
      for (let i = 0; i <= items.length; i++) {  // should be <
        console.log(items[i]);
      }
    }

    // SONAR BUG: Infinite loop (javascript:S2189)
    function infiniteLoop() {
      let i = 0;
      while (i < 10) {
        console.log(i);
        // missing i++
      }
    }

    // SONAR BUG: Unreachable code (javascript:S1763)
    function unreachableCode() {
      return 'done';
      console.log('never runs');
    }

    // SONAR BUG: Always-true condition (javascript:S2589)
    function constantCondition() {
      if (true) return 'always';
      return 'never';
    }

    // SONAR BUG: Magic numbers (javascript:S109)
    function calculateDamage(base) {
      return base * 3.14159 + 42 - 7 / 2;
    }

    // SONAR BUG: Function too long (javascript:S138 - max 80 lines)
    function megaFunction() {
      let a=1,b=2,c=3,d=4,e=5,f=6,g=7,h=8,i=9,j=10;
      a=a+b;b=b+c;c=c+d;d=d+e;e=e+f;f=f+g;g=g+h;h=h+i;i=i+j;j=j+a;
      a=a*2;b=b*2;c=c*2;d=d*2;e=e*2;f=f*2;g=g*2;h=h*2;i=i*2;j=j*2;
      return a+b+c+d+e+f+g+h+i+j;
    }

    // SONAR BUG: Callback hell (javascript:S2004 - nesting depth)
    function loadEverything(callback) {
      loadScene(function(scene) {
        loadCamera(function(camera) {
          loadRenderer(function(renderer) {
            loadLights(function(lights) {
              loadModels(function(models) {
                loadTextures(function(textures) {
                  callback(scene, camera, renderer, lights, models, textures);
                });
              });
            });
          });
        });
      });
    }
    function loadScene(cb){cb({});}
    function loadCamera(cb){cb({});}
    function loadRenderer(cb){cb({});}
    function loadLights(cb){cb({});}
    function loadModels(cb){cb({});}
    function loadTextures(cb){cb({});}

    // SONAR BUG: Prototype pollution (javascript:S6101 - security)
    function mergeObjects(target, source) {
      for (let key in source) {
        if (typeof source[key] === 'object') {
          target[key] = mergeObjects(target[key] || {}, source[key]);
        } else {
          target[key] = source[key];
        }
      }
      return target;
    }

    // SONAR BUG: ReDoS regex (javascript:S5852 - security)
    const badRegex = /^(a+)+$/;
    function validateInput(input) {
      return badRegex.test(input);
    }

    // SONAR BUG: Math.random for security (javascript:S2245)
    function generateToken() {
      return Math.random().toString(36).substring(2);
    }

    // SONAR BUG: Deprecated getYear (javascript:S1874)
    const oldDate = new Date('2020-01-01');
    oldDate.getYear();

    // SONAR BUG: Comparing NaN with === (javascript:S1764)
    function isInvalid(value) {
      if (value === NaN) return true;
      return false;
    }

    // SONAR BUG: Array mutation during iteration (javascript:S2187)
    function removeItems(arr) {
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] === 'bad') arr.splice(i, 1);
      }
      return arr;
    }

    // SONAR BUG: Async function without error handling (javascript:S4822)
    async function fetchData(url) {
      const response = await fetch(url);
      return response.json();
    }

    // SONAR BUG: Missing await (javascript:S4123)
    async function getAnime() {
      const data = fetchData('https://api.anime.com');
      return data;
    }

    // SONAR BUG: Promise without rejection handler (javascript:S4822)
    function loadImage(url) {
      return new Promise((resolve) => {
        const img = new Image();
        img.onload = resolve;
        img.src = url;
      });
    }

    // SONAR BUG: Float equality comparison (javascript:S1244)
    function isEqual(a, b) {
      return a === b;
    }

    // SONAR BUG: Boolean parameters (javascript:S1172 / maintainability)
    function render(showUI, enableShadows, useBloom, isAnime) {
      if (isAnime === true) return 'anime';
    }

    // SONAR BUG: Nested ternary (javascript:S3358)
    const type = 'a';
    const result = type === 'a' ? 'A' : type === 'b' ? 'B' : type === 'c' ? 'C' : 'D';

    // SONAR BUG: Missing return in some paths (javascript:S3801)
    function getStatus(code) {
      if (code === 200) return 'OK';
      if (code === 404) return 'Not Found';
      // missing default return
    }

    // SONAR BUG: Self-assignment (javascript:S1656)
    function selfAssign() {
      let x = 10;
      x = x;
      return x;
    }

    // SONAR BUG: Unused function parameters (javascript:S1172)
    function unusedParams(used, unused1, unused2, unused3) {
      return used;
    }

    // SONAR BUG: Global variable leak (javascript:S3800)
    function leakGlobals() {
      leakedVar = 'this becomes global';
      anotherLeak = 123;
    }

    // SONAR BUG: JSON.parse without try/catch (javascript:S4822)
    function parseConfig(jsonString) {
      return JSON.parse(jsonString);
    }

    // SONAR BUG: Mixed types in array (javascript:S4326)
    const mixedArray = [1, 'two', true, null, undefined, {}, [], function() {}];

    // SONAR BUG: Inconsistent naming (javascript:S117 / style)
    const snake_case_var = 1;
    const camelCaseVar = 2;
    const PascalCaseVar = 3;
    const SCREAMING_CASE = 4;

    // SONAR BUG: Commented-out code (javascript:S125)
    // function oldFunction() {
    //   console.log('dead');
    //   return 'old';
    // }

    // SONAR BUG: TODO/FIXME comments (javascript:S1135)
    // TODO: fix this later
    // FIXME: this is broken
    // HACK: temporary workaround
    // XXX: dangerous

    // SONAR BUG: Line too long (javascript:S103 - max 120 chars)
    const veryLongVariableNameThatExceedsTheRecommendedMaximumLineLengthOfOneHundredTwentyCharactersForSure = 'too long';

    // SONAR BUG: Calling non-function (runtime TypeError)
    function callNonFunction() {
      const notAFunction = 42;
      return notAFunction();
    }

    // SONAR BUG: Property access on null (runtime TypeError)
    function accessNull() {
      const obj = null;
      return obj.property;
    }

    // SONAR BUG: Array index out of bounds
    function outOfBounds() {
      const arr = [1, 2, 3];
      return arr[10];
    }

    // SONAR BUG: Infinite recursion (RangeError - stack overflow)
    function infiniteRecursion() {
      return infiniteRecursion();
    }

    // SONAR BUG: Sorting without comparator (javascript:S2871)
    function sortNumbers(arr) {
      return arr.sort();
    }

    // SONAR BUG: delete on array element (javascript:S2870)
    function deleteFromArray(arr) {
      delete arr[1];
      return arr;
    }

    // SONAR BUG: 'new' with primitive (javascript:S1154)
    const primitive = new String('anime');
    const number = new Number(42);
    const boolean = new Boolean(true);

    // SONAR BUG: Implicit type coercion (javascript:S3782)
    function checkValue(value) {
      if (value) return 'truthy';
      return 'falsy';
    }

    // SONAR BUG: Anonymous function assignment (javascript:S103 / style)
    const anonFunc = function(x) { return x * 2; };

    // SONAR BUG: Ternary instead of if (javascript:S1125 / style)
    const flag = true ? doA() : doB();
    function doA() { return 1; }
    function doB() { return 2; }

    // SONAR BUG: Redundant boolean literal (javascript:S1125)
    function isEnabled() {
      return true ? true : false;
    }

    // SONAR BUG: Unnecessary type conversion (javascript:S1854)
    const redundantString = String('already a string');

    // SONAR BUG: Empty block statement (javascript:S108)
    if (true) {}

    // SONAR BUG: Duplicate conditions (javascript:S1862)
    function dupConditions(a, b) {
      if (a === b) return 1;
      if (a === b) return 2;   // dead code
      return 3;
    }

    // SONAR BUG: Bitwise operator in boolean context (javascript:S1529)
    const bitwiseResult = 1 & 2 ? 'yes' : 'no';

    // SONAR BUG: Missing break in switch (javascript:S128)
    function switchFallthrough(x) {
      switch (x) {
        case 1:
          console.log('one');
        case 2:
          console.log('two');
          break;
        default:
          console.log('default');
      }
    }

    // SONAR BUG: Throwing non-Error object (javascript:S3696)
    function throwString() {
      throw 'this is a string error';
    }

    // SONAR BUG: Function returns inconsistently (javascript:S3800)
    function inconsistentReturn(x) {
      if (x > 0) return 'positive';
      if (x < 0) return 'negative';
      // no return for x === 0
    }

    // SONAR BUG: Bare try without catch or finally (javascript:S2737)
    function bareTry() {
      try {
        doSomething();
      } catch (e) {}
    }
    function doSomething() {}

    // SONAR BUG: Always returns same value (javascript:S3516)
    function alwaysSame(a, b) {
      return a;
    }
  </script>

  <!-- SONAR BUG: Script without defer/async (Web:S5247 / performance) -->
  <script src="https://cdn.example.com/library.js"></script>

  <!-- SONAR BUG: Inline script with eval (Web:S5247 - CRITICAL) -->
  <script>
    eval('console.log("dangerous")');
  </script>

  <!-- SONAR BUG: Missing closing tags for <li> elements (Web:S1082) -->
  <ul>
    <li>Item 1
    <li>Item 2
    <li>Item 3
  </ul>

  <!-- SONAR BUG: Missing lang attribute on html (already flagged above) -->

  <!-- SONAR BUG: No skip navigation link (Web:S1070) -->

  <!-- SONAR BUG: No ARIA roles where needed (Web:S1070) -->

  <!-- SONAR BUG: Inline style instead of class (Web:S1082 / maintainability) -->
  <div style="color:red; background:blue; font-size:12px; margin:10px; padding:5px; border:1px solid black;">
    Inline styled
  </div>

  <!-- SONAR BUG: Empty div used for layout (Web:S1082 / a11y) -->
  <div></div>

  <!-- SONAR BUG: Missing closing body/html would be flagged by validator -->
</body>
</html>
