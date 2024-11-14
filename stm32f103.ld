MEMORY
{
	flash (rx) : ORIGIN = 0x08000000, LENGTH = 64K
	ram (rwx) : ORIGIN = 0x20000000, LENGTH = 20K
}

_stack = ORIGIN(ram) + LENGTH(ram);

SECTIONS
{
  .ivt :
  {
    . = ALIGN(4);
    KEEP(*(.ivt))
    . = ALIGN(4);
  } > flash

  .text :
  {

  } > flash
}
