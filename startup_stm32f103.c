

extern int main(void);
extern unsigned int _stack;

void isr_reset(void)
{
	main();

	for(;;);
}

void isr_hardfault(void)
{
	for(;;);
}

enum {
	arr_size = 48
};

typedef void (*isr_t)(void);

__attribute((used, section(".ivt")))
static const isr_t ivt[arr_size] =
{
	(isr_t)&_stack,
	isr_reset,
	0,
	isr_hardfault
};
