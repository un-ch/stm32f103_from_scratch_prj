### GNU Make definitions: ###
# CURRENT_TARGET        = $@
# FIRST_PREREQUISITE 	= $<
# ALL_PREREQUISITES 	= $^

FLAGS = -mcpu=cortex-m3 -mthumb -std=c99 -g -O0
GCC = arm-none-eabi-gcc
MAIN_BIN = main
LD_SCRIPT = stm32f103.ld
STARTUP_FILE = startup_stm32f103
LD_FLAGS = -nolibc -nostartfiles -T $(LD_SCRIPT)
OBJ_FILES = $(MAIN_BIN).o $(STARTUP_FILE).o 

%.o:%.c
	$(GCC) $(FLAGS) -c $< -o $@

$(MAIN_BIN): $(MAIN_BIN).c $(STARTUP_FILE).o
	$(GCC) $(FLAGS) -c $^

run:
	./$(MAIN_BIN)
obj:
	arm-none-eabi-objdump -D $(MAIN_BIN).elf
ld:
	$(GCC) $(LD_FLAGS) $(OBJ_FILES) -o $(MAIN_BIN).elf
clean:
	rm -f $(MAIN_BIN) $(MAIN_BIN).o
