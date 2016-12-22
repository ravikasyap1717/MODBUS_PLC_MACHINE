/*
 * main.c
 *
 *  Created on: 31-Oct-2016
 *      Author: ravi
 */

#include "remote_monitoring.h"
#include "modbus_json.h"
int main(void)
{
	iothub_client_sample_amqp_run();
/*
	char* msgtext;
	char msgText[1000];
	msgtext = runmodbus();
	printf("Hello\n");
	//sprintf_s(msgText, sizeof(msgText), msgtext );
	//char msgText[200] = run_modbus();
	   printf("mess= %s\n", msgtext);
*/  
  return 0;

}


