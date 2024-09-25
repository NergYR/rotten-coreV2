OUTPUT_FORMAT("elf64-x86-64")
ENTRY(_start)

SECTIONS
{
    . = 0x100000;  /* L'adresse de début du noyau */
    
    .text : {
        *(.text)   /* Tout ce qui est dans la section .text */
    }

    .data : {
        *(.data)   /* Tout ce qui est dans la section .data */
    }

    .bss : {
        *(.bss)    /* Tout ce qui est dans la section .bss */
    }
}
