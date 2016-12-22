/*
 * remote_monitoring.c
 *
 *  Created on: 31-Oct-2016
 *      Author: ravi
 */

#include "serializer.h"
#include "schemaserializer.h"
#include "schemalib.h"
#include "iothub_client.h"
#include "iothubtransportamqp.h"
#include "modbus_json.h"
#include "azure_c_shared_utility/threadapi.h"
#include "azure_c_shared_utility/platform.h"

char* modbus;
// Sample example
//static const char* connectionString = "[device connection string]";
//static const char* connectionString = "HostName=LocalRMd8037.azure-devices.net;DeviceId=Pi1;SharedAccessKey=51MStIMX52DjhR4CcnyrChRQgfH+36qGtJm0zdB9eFA=";
static const char* connectionString = "HostName=LocalRM64e98.azure-devices.net;DeviceId=Pi1;SharedAccessKey=GWwW0+PNkZ5W3dkHCsZBYfOkKub8mG09zU1+6BDy2fk=";
static int callbackCounter;
static bool g_continueRunning;
//static char msgText[1024];
static char propText[1024];
#define MESSAGE_COUNT       50
#define DOWORK_LOOP_NUM     3


typedef struct EVENT_INSTANCE_TAG
{
    IOTHUB_MESSAGE_HANDLE messageHandle;
    size_t messageTrackingId;  // For tracking the messages within the user callback.
} EVENT_INSTANCE;

static IOTHUBMESSAGE_DISPOSITION_RESULT ReceiveMessageCallback(IOTHUB_MESSAGE_HANDLE message, void* userContextCallback)
{
    (void)printf("*****************inside ReceiveMessageCallback*******************\r\n");
    int* counter = (int*)userContextCallback;
    const unsigned char* buffer = NULL;
    size_t size = 0;
    const char* messageId;
    const char* correlationId;

    // AMQP message properties
    if ((messageId = IoTHubMessage_GetMessageId(message)) == NULL)
    {
        messageId = "<null>";
    }

    if ((correlationId = IoTHubMessage_GetCorrelationId(message)) == NULL)
    {
        correlationId = "<null>";
    }

    // AMQP message content.
    IOTHUBMESSAGE_CONTENT_TYPE contentType = IoTHubMessage_GetContentType(message);

    if (contentType == IOTHUBMESSAGE_BYTEARRAY)
    {
        if (IoTHubMessage_GetByteArray(message, &buffer, &size) == IOTHUB_MESSAGE_OK)
        {
            (void)printf("Received Message [%d] (message-id: %s, correlation-id: %s) with BINARY Data: <<<%.*s>>> & Size=%d\r\n", *counter, messageId, correlationId,(int)size, buffer, (int)size);
        }
        else
        {
            (void)printf("Failed getting the BINARY body of the message received.\r\n");
        }
    }
    else if (contentType == IOTHUBMESSAGE_STRING)
    {
        if ((buffer = (const unsigned char*)IoTHubMessage_GetString(message)) != NULL && (size = strlen((const char*)buffer)) > 0)
        {
            (void)printf("Received Message [%d] (message-id: %s, correlation-id: %s) with STRING Data: <<<%.*s>>> & Size=%d\r\n", *counter, messageId, correlationId, (int)size, buffer, (int)size);

            // If we receive the work 'quit' then we stop running
        }
        else
        {
            (void)printf("Failed getting the STRING body of the message received.\r\n");
        }
    }
    else
    {
        (void)printf("Failed getting the body of the message received (type %i).\r\n", contentType);
    }

    // Retrieve properties from the message
    MAP_HANDLE mapProperties = IoTHubMessage_Properties(message);
    if (mapProperties != NULL)
    {
        const char*const* keys;
        const char*const* values;
        size_t propertyCount = 0;
        if (Map_GetInternals(mapProperties, &keys, &values, &propertyCount) == MAP_OK)
        {
            if (propertyCount > 0)
            {
                size_t index;

                printf("Message Properties:\r\n");
                for (index = 0; index < propertyCount; index++)
                {
                    printf("\tKey: %s Value: %s\r\n", keys[index], values[index]);
                }
                printf("\r\n");
            }
        }
    }

	if (size == (strlen("quit") * sizeof(char)) && memcmp(buffer, "quit", size) == 0)
    {
        g_continueRunning = false;
    }

    /* Some device specific action code goes here... */
    (*counter)++;
    return IOTHUBMESSAGE_ACCEPTED;
}

static void SendConfirmationCallback(IOTHUB_CLIENT_CONFIRMATION_RESULT result, void* userContextCallback)
{
	(void)printf("################## SendConfirmationCallback*****************!\r\n");
    EVENT_INSTANCE* eventInstance = (EVENT_INSTANCE*)userContextCallback;
    (void)printf("Confirmation[%d] received for message tracking id = %zu with result = %s\r\n", callbackCounter, eventInstance->messageTrackingId, ENUM_TO_STRING(IOTHUB_CLIENT_CONFIRMATION_RESULT, result));
    /* Some device specific action code goes here... */
    callbackCounter++;
    IoTHubMessage_Destroy(eventInstance->messageHandle);
}

void iothub_client_sample_amqp_run(void)
{
    IOTHUB_CLIENT_LL_HANDLE iotHubClientHandle;

    EVENT_INSTANCE messages[MESSAGE_COUNT];

    g_continueRunning = true;
    srand((unsigned int)time(NULL));
    double avgWindSpeed = 10.0;

    callbackCounter = 0;
    int receiveContext = 0;

    (void)printf("Starting the IoTHub client sample AMQP...\r\n");

    if (platform_init() != 0)
    {
        printf("Failed to initialize the platform.\r\n");
    }
    else
    {
        if ((iotHubClientHandle = IoTHubClient_LL_CreateFromConnectionString(connectionString, AMQP_Protocol)) == NULL)
        {
            (void)printf("ERROR: iotHubClientHandle is NULL!\r\n");
        }
        else
        {
            bool traceOn = true;
            IoTHubClient_LL_SetOption(iotHubClientHandle, "logtrace", &traceOn);

#ifdef MBED_BUILD_TIMESTAMP
            // For mbed add the certificate information
            if (IoTHubClient_LL_SetOption(iotHubClientHandle, "TrustedCerts", certificates) != IOTHUB_CLIENT_OK)
            {
                printf("failure to set option \"TrustedCerts\"\r\n");
            }
#endif // MBED_BUILD_TIMESTAMP

            /* Setting Message call back, so we can receive Commands. */
            if (IoTHubClient_LL_SetMessageCallback(iotHubClientHandle, ReceiveMessageCallback, &receiveContext) != IOTHUB_CLIENT_OK)
            {
                (void)printf("ERROR: IoTHubClient_SetMessageCallback..........FAILED!\r\n");
            }
            else
            {
                (void)printf("IoTHubClient_SetMessageCallback...successful.\r\n");
            //    msgText[200] = run_modbus();

              //  printf("mess = %s", msgText);

                /* Now that we are ready to receive commands, let's send some messages */
                runmodbus();
                size_t iterator = 0;
                do
                {
                    //if (iterator < MESSAGE_COUNT)
                    //{
			(void)printf("**************************** reading modbus*****************!\r\n");
		        remove("test.json");
			read_reg_create_json();
			long size;
			//static int i = 0;
			//char modbus[20];
			//sprintf(modbus, "Value of Pi = %d", i++);
			modbus = loadfile ( "test.json" , &size );
                        //sprintf_s(msgText, sizeof(msgText), modbus);
                      // sprintf_s(msgText, sizeof(msgText), "{\"deviceId\":\"myFirstDevice\",\"windSpeed\":%.2f}", avgWindSpeed + (rand() % 4 + 2));

                        if ((messages[iterator%MESSAGE_COUNT].messageHandle = IoTHubMessage_CreateFromByteArray((const unsigned char*)modbus, size)) == NULL)
                        {
                            (void)printf("ERROR: iotHubMessageHandle is NULL!\r\n");
                        }
                        else
                        {
                            messages[iterator%MESSAGE_COUNT].messageTrackingId = iterator;

                            MAP_HANDLE propMap = IoTHubMessage_Properties(messages[iterator%MESSAGE_COUNT].messageHandle);
                            (void)sprintf_s(propText, sizeof(propText), "PropMsg_%zu", iterator);
                            if (Map_AddOrUpdate(propMap, "PropName", propText) != MAP_OK)
                            {
                                (void)printf("ERROR: Map_AddOrUpdate Failed!\r\n");
                            }

                            if (IoTHubClient_LL_SendEventAsync(iotHubClientHandle, messages[iterator%MESSAGE_COUNT].messageHandle, SendConfirmationCallback, &messages[iterator%MESSAGE_COUNT]) != IOTHUB_CLIENT_OK)
                            {
                                (void)printf("ERROR: IoTHubClient_SendEventAsync..........FAILED!\r\n");
                            }
                            else
                            {
                                (void)printf("IoTHubClient_SendEventAsync accepted data for transmission to IoT Hub.\r\n");
                            }
                        }
                    //}
                    IoTHubClient_LL_DoWork(iotHubClientHandle);
                    ThreadAPI_Sleep(1000);
		    //free(modbus);
                    iterator++;
                } while (g_continueRunning);

		close_free_mod();
                (void)printf("iothub_client_sample_mqtt has gotten quit message, call DoWork %d more time to complete final sending...\r\n", DOWORK_LOOP_NUM);
              for (size_t index = 0; index < DOWORK_LOOP_NUM; index++)
                {
                    IoTHubClient_LL_DoWork(iotHubClientHandle);
                    ThreadAPI_Sleep(1);
                }
            }
            IoTHubClient_LL_Destroy(iotHubClientHandle);
        }
        platform_deinit();
    }
}
