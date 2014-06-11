Seil
====

Seil applies a patch to a keyboard driver.

You can change CapsLock behavior. (For example, changing CapsLock to Delete Key.)
And it can activate International Keys on Non-Apple keyboard.

(Seil has been called PCKeyboardHack till version 10.7.0.)

Web pages
---------

* master: https://pqrs.org/macosx/keyremap4macbook/pckeyboardhack.html
* backup: http://tekezo.github.io/pqrs.org/


System requirements
-------------------

Mac OS X 10.8 or higher.

* If you require Seil for OS X 10.5, use PCKeyboardHack 5.1.0.
* If you require Seil for OS X 10.6, use PCKeyboardHack 7.4.0.
* If you require Seil for OS X 10.7, use PCKeyboardHack 9.0.0.

How to build
------------

Requirements:

* OS X 10.9+
* Xcode 5.0.1+
* Command Line Tools for Xcode
* Boost 1.54.0+ (header-only) http://www.boost.org/

Please install Boost into /usr/local/include/boost.

### Step1: Getting source code

Execute a following command in Terminal.app.

<pre>
git clone --depth 10 https://github.com/tekezo/Seil.git
</pre>

### Step2: Building a package

Execute a following command in Terminal.app.

<pre>
cd Seil
make
</pre>

Then, Seil-VERSION.dmg has been created in the current directory.
It's a distributable package.


**Note:**<br />
Build may be failed if you changed environment values or changed /usr/bin files.<br />
Use clean environment (new account) if build was failed.
