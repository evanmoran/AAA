AAA
===

Triple A (AAA) extensions to Objective C. Live the dream of quality, shared code between iOS/OSX apps.

About
-----

Created by Evan Moran and James Lawton.

Released under MIT License.

Contribute
----------

Pull requests welcome. Please, focus on broadly useful categories that simplify boilerplate code.

For Example:

    [UIColor colorWithRed:255/255.0f green:0/255.0f blue:255/255.0f alpha:255/255.0f]

AAA allows color defined with ints:

    [UIColor aaa_colorWithR:255 G:0 B:255]

And colors defined with Hex:

    [UIColor aaa_colorWithHex:0xFF00FF]

Colors are used widely throughout graphical apps, but the way we think about them isn't being served by Objective-C's interfaces. The goal of AAA is to solve this.


