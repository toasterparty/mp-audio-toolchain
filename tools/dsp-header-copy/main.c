#include <stdio.h>
#include <string.h>

static void usage(void)
{
    printf("Copies dsp header from one file to another\n");
    printf("Usage:\n");
    printf("\tdsp-header-copy <source dsp> <destination dsp>\n");
}

static const unsigned HEADER_SIZE = 0x60;

int main(int argc, char *argv[])
{
    if(argc != 3)
    {
        usage();
        return -1;
    }

    FILE *src = fopen(argv[1], "rb");
    if (src == NULL)
    {
        printf("Error - failed to open '%s' for reading\n",argv[1]);
        return -1;
    }

    FILE *dst = fopen(argv[2], "r+b");
    if (dst == NULL)
    {
        printf("Error - failed to open '%s' for reading\n",argv[2]);
        fclose(src);
        return -1;
    }

    printf("dsp header copy '%s' -> '%s'\n", argv[1], argv[2]);

    unsigned char header[HEADER_SIZE];
    memset(header,0,HEADER_SIZE);

    fread(header, HEADER_SIZE, 1, src);
    fseek(dst, 0, SEEK_SET);
    fwrite(header, HEADER_SIZE, 1, dst);

    fclose(src);
    fclose(dst);
    return 0;
}
