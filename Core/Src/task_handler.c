/*
 * task_handler.c
 *
 *  Created on: Jan 31, 2025
 *      Author: Huy
 */

#include "main.h"

int extract_command(command_t *cmd);
void process_command(command_t *cmd);

const char *msg_inv = "////Invalid option////\n";

void menu_task(void* parameters)
{
	uint32_t cmd_addr;
	command_t *cmd;
	uint8_t option;
	const char* msg_menu = "===================\n"
													"|       Menu        |\n"
														"====================\n"
														"LED effect         ---> 0 \n"
														"Date and time      ---> 1 \n"
														"Exit               ---> 2 \n"
														"Enter your choice here:   \n";
	while(1)
	{
		xQueueSend(print_queue_handle, &msg_menu, portMAX_DELAY);
		// wait for menu commands
		xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
		cmd = (command_t*)cmd_addr;
		if(cmd->len == 1)
		{
			option = cmd->payload[0] - 48; // convert ascii to number by subtracting to 48
			switch(option)
			{
			case 0:
				curr_state = sLedEffect;
				xTaskNotify(led_task_handle, 0, eNoAction);
				break;
			case 1:
				curr_state = sRtcMenu;
				xTaskNotify(rtc_task_handle, 0, eNoAction);
				break;
			case 2: // Exit option

				break;
			default:
				xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
				continue;
			}
		}
		else
		{
			// invalid entry
			xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
		}
		// wait to run again when some other task notifies
		xTaskNotifyWait(0,0,NULL,portMAX_DELAY);
	}
}

void led_task(void* parameters)
{
	uint32_t cmd_addr;
	command_t *cmd;
	const char* msg_led = "===========================\n"
												"|           LED           |\n"
												"===========================\n"
												"(none, e1, e2, e3, e4) \n"
												"Enter your choice here:    \n";
	while(1)
	{
		// Wait for notification
		xTaskNotifyWait(0,0,NULL, portMAX_DELAY);
		// Print LED Menu
		xQueueSend(print_queue_handle, &msg_led, portMAX_DELAY);
		// Wait for LED command
		xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
		cmd = (command_t*)cmd_addr;
		if(cmd->len <= 4)
		{
			if(! strcmp((char*)cmd->payload, "none"))
				led_effect_stop();
			else if (! strcmp((char*)cmd->payload, "e1"))
				led_effect(1);
			else if (! strcmp((char*)cmd->payload, "e2"))
				led_effect(2);
			else if (! strcmp((char*)cmd->payload, "e3"))
				led_effect(3);
			else if (! strcmp((char*)cmd->payload, "e4"))
				led_effect(4);
			else
				// Print invalid message
				xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
		}
		else
			//print invalid message
			xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);

		curr_state = sMainMenu;

		xTaskNotify(menu_task_handle,0,eNoAction);
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
