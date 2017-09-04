function message {
  parameter level.
  parameter text.

  print level + ": " + text.
}
global messageDelegate is message@.

// Normal but significant events.
global noticeMessage is messageDelegate:bind("notice").
// Interesting events.
global infoMessage is messageDelegate:bind("info").
// Detailed debug information.
global debugMessage is messageDelegate:bind("debug").
