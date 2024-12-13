NAME		= libasm.a
UNAME		= $(shell uname)
TESTNAME= tester_$(UNAME)


CC			= clang
CFLAGS	= -g

AS			= nasm
ASFLAGS = -d$(UNAME)=1

LD			= ld
LDFLAGS = -pie

AR			= ar
ARFLAGS = -r


SRC			= ft_strlen.s \
					ft_strcpy.s \
					ft_strcmp.s \
					ft_strdup.s \
					ft_read.s

OBJ			= $(SRC:%.s=%.o)


ifeq ($(UNAME), Darwin)
CFLAGS	+= --target=x86_64-macos-darwin-macho
ASFLAGS += -f macho64
LDFLAGS += -ld_classic -lSystem \
					-syslibroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk
else
CFLAGS	+= --target=x86_64-linux-gnu-elf64
ASFLAGS += -f elf64
LDFLAGS += 
endif

TESTSRC = main.c
TESTOBJ = $(TESTSRC:%.c=%.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $^

$(OBJ): %.o: %.s
	$(AS) $(ASFLAGS) $<

tester: $(NAME) $(TESTOBJ)
	$(LD) $(LDFLAGS) $(TESTOBJ) $(NAME) -o $(TESTNAME)
	objdump --disassemble --disassembler-options=intel -t $(TESTNAME) > $(TESTNAME).s

$(TESTOBJ): %.o: %.c
	$(CC) $(CFLAGS) -c $<

clean:
	$(RM) $(OBJ) $(TESTOBJ)

fclean: clean
	$(RM) $(NAME) $(TESTNAME)

re: fclean
	$(MAKE) all
