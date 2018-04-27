# Arbitrary Code Gold and Silver
This repository contains my collection of arbitrary code executed via glitches in Gold and Silver.

BasicBootstrap.asm contains a simpler setup. The tradeoff is you can only store on program at a time. Relevant lists are in TM Lists.
AdvancedBootstrap.asm is more difficult and longer, but it allows you to store as many programs as you can find places to fit them. Relevant lists are in Mail Codes.
The arbitrary code itself can be found in the src folder.
Constants used to reference memory addresses are in Addresses.asm in the root.
SRAM.asm is useful for finding memory addresses for AdvancedBootstrap.
Test contains the most recent assembled code. Mostly good for just verifying output.

To compile for yourself on Linux:
Make sure RGBDS is installed on your system. You can get it here:
https://github.com/rednex/rgbds

Windows:
Run Make.bat when in the root directory.

Linux:
Run Make when in the root directory.