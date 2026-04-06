ENTRY(main)

SECTIONS {
    . = 0x10000;          /* physical address = segment 0x1000, offset 0 */

    .text : {
        *(.text)
    }
    .data : {
        *(.data)
    }
    .bss : {
        *(.bss)
    }
}