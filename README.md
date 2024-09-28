# get-scrollbar-style

This package is a targeted replacement for [\`scrollbar-style\`](https://github.com/pulsar-edit/scrollbar-style) for use in [Pulsar](https://pulsar-edit.dev/).

The original purpose of `scrollbar-style` was to allow the user to

1. retrieve the current scrollbar style on macOS; and
2. find out when that setting changes.

These days, task 2 is (strangely) easier than task 1 for an Electron app. Electron’s [\`systemPreferences\` API](https://www.electronjs.org/docs/latest/api/system-preferences) allows us to subscribe to the needed `NSPreferredScrollerStyleDidChangeNotification` notification event that is issued when the user changes this setting… but there appears to be no imperative way of obtaining the same information.

This package exposes a single method that, when called, uses [`NSScroller.preferredScrollerStyle`][ns-scroller] to return the current scrollbar style on macOS. The return value will be one of

* `overlay` (for scrollbars that appear atop the content when you scroll and disappear when you stop scrolling),
* `legacy` (for traditional scrollbars that are always visible and have their own track), or
* `unknown` (neither of the above; this will only be possible if macOS adds more scrollbar modes in the future).

On Windows and Linux, this package exposes the same function, but the return value is always `legacy`.

```javascript
const getScrollbarStyle = require('get-scrollbar-style')
console.log(getScrollbarStyle()) // => 'legacy' or 'overlay'
```

[ns-scroller]: https://developer.apple.com/library/mac/documentation/Cocoa/Reference/ApplicationKit/Classes/NSScroller_Class/Reference/Reference.html
