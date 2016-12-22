#include <stdio.h>
#include <stdlib.h>
#include "jsmn.h"
#include <time.h>
#include <uuid/uuid.h>

#include<inttypes.h>
#include "json.h"
#include "log.h"
#include "buf.h"
#include <modbus.h>

#define SLAVE_ID 1
#define UART_PORT "/dev/ttyUSB0"
#define BAUD_RATE 115200
#define PARITY 'N'
#define BYTESIZE 8
#define STOPBITS 1

#define MSG_UUID 0
#define MSG_CREATION_TIME 1

char *KEYS[] = {"property", "register", "value"};
char *PKEYS[] = {"messageid", "messagecreationdatetime", "version", "messagetype", "category", "customerid", "customername", "floorid", "machineid", "make", "model", "label"};

enum tags {prop, reg, val, none};
struct regval
{
	char prop[30];
        int reg;
        uint16_t value;
}reg_val[100];
struct property
{
        char key[30];
        char value[50];
}json_prop[30];

modbus_t *ctx = NULL;
//struct regval reg_val[100];
//struct property json_prop[30];
int g_pindex,g_index;

void get_time1(char *ctime,int size)
{
   time_t t;
   struct tm *tmp;

   t = time(NULL);
   tmp = localtime(&t);
   if (tmp == NULL) {
        perror("localtime");
    strcpy(ctime,"");
   }
   if (strftime(ctime, size, "%Y-%m-%dT%H:%M:%S%z", tmp) == 0) {
        fprintf(stderr, "strftime returned 0");
        strcpy(ctime,"");
   }
}
void create_json(struct regval *reg_val, struct property *json_prop, int index, int pindex)
{
   FILE *fp;
   uuid_t uuid;

   // generate uuid
   uuid_generate(uuid);

   // unparse (to string)
   uuid_unparse_upper(uuid, json_prop[MSG_UUID].value);

   //get time creation of msg
   get_time1(json_prop[MSG_CREATION_TIME].value,50);

   fp = fopen("test.json", "w+");
   //set json property
   fprintf(fp, "\{\n  ");
   for(int i=0; i<=pindex; i++)
   {
        fprintf(fp, "\"%s\": \"%s\",\n  ",json_prop[i].key,json_prop[i].value);

   }

   fprintf(fp, "\"tags\": [\n");
   
   for(int i=0; i<=index; i++)
   {
        fprintf(fp, "\t\t\{\"property\": \"%s\", ", reg_val[i].prop);
        fprintf(fp, "\"register\": \"%d\", ", reg_val[i].reg);
        if(reg_val[i].value == 0)
          fprintf(fp, "\"value\": \"\"} ");
        else
          fprintf(fp, "\"value\": \"%d\"} ", reg_val[i].value);
        if(i != index)
          fprintf(fp, ",\n");
        else
          fprintf(fp, "\n");

   }
   fprintf(fp, "\t]\n}\n");
   fclose(fp);
}
   
char * loadfile(char *file, long *size)
{
    FILE *fp;
    long lSize;
    char *js;

    fp = fopen ( file , "rb" );
    if( !fp ) perror("blah.txt"),exit(1);

    fseek( fp , 0L , SEEK_END);
    lSize = ftell( fp );
    rewind( fp );

    /* allocate memory for entire content */
    js = calloc( 1, lSize+1 );
    if( !js ) 
    {
	fclose(fp);
	log_die("memory alloc fails");
    }

    /* copy the file into the buffer */
   if( 1!=fread( js , lSize, 1 , fp) )
   {
	fclose(fp);
	free(js);
	log_die("entire read fails");
   }
   *size = lSize;
   fclose(fp);
   return js;

}

int json_parser(struct regval *reg_val, struct property *json_prop, char *js, int *pindex1)
{

    /* do your work here, buffer is a string contains the whole text */
    int index=-1, pindex=-1, pfound = -1;
    enum tags tag;

    jsmntok_t *tokens = json_tokenise(js);

    /* States required to parse this are simple: start of the object, keys, values we 
     *  want to print, values we want to skip, and then a marker state for the end. */

    typedef enum { START, KEY, PRINT, SKIP, STOP } parse_state;
    parse_state state = START;

    size_t object_tokens = 0;

    for (size_t i = 0, j = 1; j > 0; i++, j--)
    {
        jsmntok_t *t = &tokens[i];

        // Should never reach uninitialized tokens
        log_assert(t->start != -1 && t->end != -1);

        if (t->type == JSMN_ARRAY || t->type == JSMN_OBJECT)
            j += t->size;

        switch (state)
        {
            case START:
                if (t->type != JSMN_OBJECT && t->type != JSMN_ARRAY)
                    log_die("Invalid response: root element must be an object.");

                state = KEY;
                object_tokens = t->size;

                if (object_tokens == 0)
                    state = STOP;

                if (object_tokens % 2 != 0)
                    log_die("Invalid response: object must have even number of children.");

                break;

            case KEY:
                object_tokens--;

		if(t->type == JSMN_ARRAY || t->type == JSMN_OBJECT)
                {
                    object_tokens = t->size;
                    state = KEY;
                    break;
                }

                if (t->type != JSMN_STRING)
                    log_die("Invalid response: object keys must be strings.");

                state = SKIP;

                for (size_t i = 0; i < sizeof(KEYS)/sizeof(char *); i++)
                {
                    if (json_token_streq(js, t, KEYS[i]))
                    {
			if(strncmp("property", KEYS[i], strlen(KEYS[i])) == 0)
			{
			    index++;
			    tag = prop;
			}
			else if(strncmp("register", KEYS[i], strlen(KEYS[i])) == 0)
			    tag = reg;
			else if(strncmp("value", KEYS[i], strlen(KEYS[i])) == 0)
			    tag = val;
			else 
			    tag = none;	
                        printf("%s: ", KEYS[i]);
                        state = PRINT;
                        break;
                    }
		    tag = none;
                }
		
		if(tag == none)
                {
                    for (size_t i = 0; i < sizeof(PKEYS)/sizeof(char *); i++)
                    {
                        if (json_token_streq(js, t, PKEYS[i]))
                        {
                            pindex++;
                            pfound = i;
                            state = PRINT;
                            break;

                        }
                    }
                }

                break;

            case SKIP:
                if (t->type != JSMN_STRING && t->type != JSMN_PRIMITIVE && t->type != JSMN_OBJECT && t->type != JSMN_ARRAY)
                    log_die("Invalid response: object values must be strings or primitives.");

                object_tokens--;
                state = KEY;

		if(t->type == JSMN_ARRAY || t->type == JSMN_OBJECT)
                    object_tokens = t->size;

                if(t->type == JSMN_ARRAY)
                   state = START;

                if (object_tokens == 0)
                    state = STOP;

                break;

            case PRINT:
                if (t->type != JSMN_STRING && t->type != JSMN_PRIMITIVE)
                    log_die("Invalid response: object values must be strings or primitives.");

                char *str = json_token_tostr(js, t);
                puts(str);
		
		if(tag == prop)
		{
		    strcpy(reg_val[index].prop, str);
		}
		else if(tag == reg)
		{
               
                     sscanf(str, "%d", &reg_val[index].reg);
                }
		else if(tag == val)
                {
		     if((t->end - t->start) == 0)
			   reg_val[index].value = 0;
		     else 
                           sscanf(str, "%"SCNu16, &reg_val[index].value);
                }
		else if(tag == none)
                {
                    strcpy(json_prop[pindex].key,PKEYS[pfound]);
                    strcpy(json_prop[pindex].value,str);
                }
                object_tokens--;
                state = KEY;

                if (object_tokens == 0)
                    state = STOP;

                break;

            case STOP:
                // Just consume the tokens
		if(t->type == JSMN_ARRAY || t->type == JSMN_OBJECT)
                {
                    object_tokens = t->size;
                    state = KEY;
                }

                break;

            default:
                log_die("Invalid state %u", state);
        }
    }
    *pindex1 = pindex;
    return index;
}
int runmodbus(void)
{
    long lSize;
    char *js;
    //load json file on memory
    js = loadfile ( "temp.json" , &lSize );
    if(!js)
    {
	free(js);
	log_die("Load file failed");
    }
    // parse json in a structure
    //struct regval reg_val[100];
    //struct property json_prop[30];
    //int g_pindex;
    g_index= json_parser(reg_val, json_prop, js, &g_pindex);

    for(int i = 0; i<=g_index;i++)
    {
        printf("%s  %d = %d\n",reg_val[i].prop,reg_val[i].reg, reg_val[i].value);
    }
    for(int i = 0; i<=g_pindex;i++)
    {
        printf("%s  = %s\n",json_prop[i].key,json_prop[i].value);
    }

    free(js);

    //create_json(reg_val, json_prop, g_index, g_pindex);    
    //modbus code 
    //modbus_t *ctx = NULL;
    ctx = modbus_new_ascii(UART_PORT, BAUD_RATE, PARITY, BYTESIZE, STOPBITS);
    if (ctx == NULL)
    {
        fprintf(stderr, "Unable to allocate libmodbus context\n");
        return -1;
    }
    modbus_set_debug(ctx, TRUE);
    modbus_set_error_recovery(ctx, MODBUS_ERROR_RECOVERY_LINK | MODBUS_ERROR_RECOVERY_PROTOCOL );
    modbus_set_slave(ctx, SLAVE_ID);
    modbus_rtu_set_serial_mode(ctx, MODBUS_RTU_RS485);

    if (modbus_connect(ctx) == -1)
    {
        fprintf(stderr, "Connection failed: %s\n", modbus_strerror(errno));
        modbus_free(ctx);
        return -1;
    }
    return 0;
}

void read_reg_create_json()
{
    for(int i = 0; i<=g_index;i++)
    {
        modbus_read_registers(ctx, reg_val[i].reg, 1, &reg_val[i].value);
//        printf("\nAddress: %d %c values=%d \n", reg_val[i].reg ,':', reg_val[i].value);
    }
    //create json from structure
    create_json(reg_val, json_prop, g_index, g_pindex);
}
void close_free_mod()
{
    modbus_close(ctx);
    modbus_free(ctx);
}
