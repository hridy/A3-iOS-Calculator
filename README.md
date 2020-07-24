
# iOS Calculator 

### README Created for Assignment 5
<img src="https://github.com/hridy/A3-iOS-Calculator/blob/master/A3%20iOS%20Calculator/Assets.xcassets/calculator.imageset/calculator%403x.png" align="right"
     alt="iOS Calculator logo" width="120" height="178">
SEG2105 - Assignment 5 - iOS Calculator App

This project is a continuation of my Assignment 3 submission. Some of the new features added are:
* Support for landscape mode
* Calculation preview display
* Continued arithmetic supported
* iPadOS compatible

## Test Cases
1. User wants to use the app while taking notes on his/her iPad Pro so he brings in the calculator using 'Slide Over'
2. The user has trouble seeing so they place the iPad
## License

Copyright <2020> <Hridyansh Sharma>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Test Cases
### Simple arithmetic and continued calculations
<p align="center">
  <img src="https://github.com/hridy/A3-iOS-Calculator/blob/master/img/simpleCalc_1.gif?raw=true" align="center" alt="simple calculations" title="gif" width="200" height="400"/>
</p>
The calculator is able to perform simple math operations. This includes being able to perform functions of previous calculations as well as new ones every time the user presses **=**

### Landscape mode
<p align="center">
  <img src="https://github.com/hridy/A3-iOS-Calculator/blob/master/img/landscape%20mode.gif" align="center" alt="landscape mode" title="gif"/>
</p>

The calculator automatically scales its buttons and both views for lanscape mode on any device. This is done using the constraint settings built into Xcode and make the app device agnostic.

| iPad Pro Landscape Mode (Slide Over)  | iPad Pro Portrait (Full Screen) |
| ------------- | ------------- |
| ![ipad pro landscape](https://github.com/hridy/A3-iOS-Calculator/blob/master/img/ipad%20Pro.png)  | ![ipad pro portrait](https://github.com/hridy/A3-iOS-Calculator/blob/master/img/ipad%20pro%20portrait.png)  |

### Input detection
The calculator is able to detect when multiple operation (ie. +, -, x) are being pressed and will only display and calculate using the latest input. Furthermore, the calculation preview will automatically update to display the previous calculation so that the user is able to keep track of their ongoing arithmetic.

**Left Side** Here, you can see that the calculation preview at the top of the screen will only show one instance of a math operation, even if the user tries to input multiple values (ex. multiple + signs aren't proper notation).

**Right Side** The calculator checks if a decimal point already exists in the running number before adding it to the calculation.
<p align="center">
     <img src="https://github.com/hridy/A3-iOS-Calculator/blob/master/img/calcPreview-optimize.gif" align="center" alt="" title="gif" width="200" height="400"/>
     <img src="https://github.com/hridy/A3-iOS-Calculator/blob/master/img/decimal%20control.gif" align="center" alt="" title="gif" width="200" height="400"/>
</p>
     
