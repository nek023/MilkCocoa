# MilkCocoa
MilkCocoa is a library that improves the compatibility of Cocoa APIs.


## What's this?
There are many API changes in recent OS X SDK.

For example, `beginSheet:modalForWindow:modalDelegate:didEndSelector:contextInfo:` of `NSApplication` is deprecated in OS X 10.10, and `beginSheet:completionHandler:` is available in OS X 10.9 to do the same thing.

If you want to create an app that works on OS X 10.8 through 10.10, you can write:

```
// You have to handle both the block-based method and the delegate-based method!

if ([window respondsToSelector:@selector(beginSheet:completionHandler:)]) {
    [window beginSheet:sheetWindow completionHandler:...];
} else {
    [NSApp beginSheet:sheetWindow
       modalForWindow:window
        modalDelegate:self
       didEndSelector:@selector(...)
          contextInfo:nil];
}
```

But in some cases this boilerplate will hurt the readability of your code.

MilkCocoa is a better way to do this.
You can use a milk-added method that internally switches the above two APIs.

```
[window milk_beginSheet:sheetWindow completionHandler:handler];
```


## Rules
### 1. Add a milk to sweeten
* Add `MILK` to the unexisting classes or structs
    * e.g. `NSUUID` -> `MILKNSUUID`
* Add 'milk_' to the unexisting methods
    * e.g. `[[NSProcessInfo processInfo] milk_operatingSystemVersion]`

### 2. Build with latest SDK
To suppress the compiler warnings.


## Author
questbeat, questbeat@gmail.com


## License
MilkCocoa is available under the MIT license. See the LICENSE file for more info.
