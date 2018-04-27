rgbasm -o Test\ACE.o Main.asm
rgblink -l Main.link -o Test\ACE.gbc Test\ACE.o
del Test\ACE.o