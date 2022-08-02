# Swiftly-Assessment

## Overview
This is an initial pass at the Swiftly Assessment. Unfortunatly due to personal circumstances I was not able to dedicate the time and focus needed to complete the project. As such, while somewhat functional, the app is not fully complete. This app does not use any 3rd party libraries.

## How to run the assessment
There is no setup necessary to run the app. After checking out the code the assessment should be runnable from within Xcode. Just open up the project and press the Run button.

## Remaining Work
The implementation in this app is pretty bare bones. There's a lot missing from what I would consider a production worthy app. Much of the implementation follows a "path of least resistance" approach. What I would need to complete in order to consider this app "production ready" are:

- Get clarification on Ambiguity
- Remove logic from the Views and put in view models
- Refactor to use a more complete composition approach with protocols
- Devise strategy for getting Manager Special updates (preferably websockets, polling if that isn't possible)
- Build UI to spec
- Implemeting logic for ProductViewCell sizing
- Add error handling
- Add Unit Tests
- Adding UI Tests

## Clarifying questions I would have asked if I could have dedicated the time and focus the project required
- What is the minimum iOS vesions I should be building for?
- Should I worry about different server environments?
- What is the expected behavior for bad data?
- What kind of error messaging should be presented to the user?
- If no data can be retreived should there be a retry option?
- If partial data is received, lets say half the products have mismatched/bad data but the other half are good, should we show what we can or treat as a total failure?
- Are we assuming US language/local/currency or are we localizing for other languages/countries?
- Is there a redline doc or style guide?
- Should the app support iPhone and iPad?
