/*
 * task_handler.c
 *
 *  Created on: Jan 31, 2025
 *      Author: Huy
 */

#include "main.h"

int extract_command(command_t *cmd);
void process_command(command_t *cmd);

void menu_task(void* parameters)
{
	while(1)
	{

	}
}

void led_task(void* parameters)
{
	while(1)
	{

	}
}

void rtc_task(void* parameters)
{
	while(1)
	{

	}
}

void print_task(void* parameters)
{
	while(1)
	{

	}
}

void command_handling_task(void* parameters)
{
	BaseType_t status;
	command_t cmd;
	while(1)
	{
		// Implement notify wait
		status = xTaskNotifyWait(0, 0, NULL, portMAX_DELAY);
		if(status == pdTRUE)
		{
			// Process the user data (command) stored in input data queue
			process_command(&cmd);
		}
	}
}

void process_command(command_t *cmd)
{
	extract_command(cmd);

	switch(curr_state)
	{
		case sMainMenu:
			// Notify menu task with the command
			xTaskNotify(menu_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
		case sLedEffect:
			// Notify LED task with the command
			xTaskNotify(led_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
		case sRtcMenu:
		case sRtcTimeConfig:
		case sRtcDateConfig:
		case sRtcReport:
			// Notify task with the command
			xTaskNotify(rtc_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
	}
}

int extract_command(command_t *cmd)
{
	uint8_t item;
	UBaseType_t numberOfMessages;
	BaseType_t status;

	numberOfMessages = uxQueueMessagesWaiting(input_data_queue_handle);
	if(!numberOfMessages)
		return -1;
	uint8_t i = 0;

	do
	{
		status = xQueueReceive(input_data_queue_handle, &item, 0);
		if(status == pdTRUE)
			cmd->payload[i++] = item;
	}while(item != '\n');

	cmd->payload[i-1] = '\0';
	cmd->len = i - 1;

	return 0;
}
