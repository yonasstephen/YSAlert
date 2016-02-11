# YSAlert
A simple, clean UIAlertView written in Swift

![Demo](/YSAlert.gif)

##Get Started
The easiest way to show default alert
```
import YSAlert

func showAlert() {
  YSAlert().show()
}
```

Use the following to set title and content of the alert
```
YSAlert().show("Insert title here", content: "Insert the content here")
```

###Other Settings
Other settings to customize alert
```
let alert = YSAlert().show(
  "Title",
  content: "Content here.",
  okButtonCompletion: { (sender: UIButton!) in 
    // ok button pressed
  },
  cancelButtonCompletion: { (sender: UIButton!) in
    // cancel button pressed
  }
)

alert.showOKButton = false
alert.showCancelButton = false
alert.showCloseButton = false
alert.dismissableBackdropTap = false

```

##Installation
Add YSAlert.swift into project

##Requirements
* XCode 7.0+
* iOS 7.0+

##Cocoa Pod
Coming Soon.

##License

The MIT License (MIT)

Copyright (c) 2016 yonasstephen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
