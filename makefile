default:
	rm -rf main.o main
	nasm -f elf32 -o main.o main.asm
	ld -m elf_i386 -o main main.o