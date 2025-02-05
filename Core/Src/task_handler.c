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
			{
				curr_state = sLedEffect;
				xTaskNotify(led_task_handle, 0, eNoAction);
				break;
			}
			case 1:
			{
				curr_state = sRtcMenu;
				xTaskNotify(rtc_task_handle, 0, eNoAction);
				break;
			}
			case 2: // Exit option

				break;
			default:
			{
				xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
				continue;
			}
			}
		}
		else
		{
			// invalid entry
			xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
			continue;
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

uint8_t getnumber(uint8_t *p, int len)
{
	int value;
	if(len > 1)
		value = (((p[0] - 48) * 10) + (p[1] - 48));
	else
		value = p[0] - 48;

	return value;
}

void rtc_task(void* parameters)
{
	const char* msg_rtc1 = "==========================\n"
													"|            RTC          |\n"
													"===========================\n";

	const char* msg_rtc2 = "Configure Time        ---> 0\n"
													"Configure Date        ---> 1\n"
													"Enable reporting      ---> 2\n"
													"Exit                  ---> 3\n"
													"Enter your choice here: ";

	const char *msg_rtc_hh = "Enter hour(1-12): ";
	const char *msg_rtc_mm = "Enter minutes(0-59): ";
	const char *msg_rtc_ss = "Enter seconds(0-59): ";

	const char *msg_rtc_dd = "Enter date(1 - 31): ";
	const char *msg_rtc_mo = "Enter month(1-12): ";
	const char *msg_rtc_dow = "Enter day(1-7 sun:1): ";
	const char *msg_rtc_yr = "Enter year(0-99): ";

	const char *msg_conf = "Configuration successful!\n";
	const char *msg_rtc_report = "Enable time & date reporting(y/n)?: ";

	uint32_t cmd_addr;
	command_t *cmd;
	uint8_t menu_option;

	RTC_TimeTypeDef time;
	RTC_DateTypeDef date;

	static int rtc_state = 0;

#define HH_CONFIG 0
#define MM_CONFIG 1
#define SS_CONFIG 2

#define DATE_CONFIG 	0
#define MONTH_CONFIG	1
#define YEAR_CONFIG		2
#define DAY_CONFIG		3

	while(1)
	{
		// Notify wait (wait until someone notifies)
		xTaskNotifyWait(0,0,NULL, portMAX_DELAY);
		// Print the menu and show current date and time information.
		xQueueSend(print_queue_handle, &msg_rtc1, portMAX_DELAY);
		show_time_date();
		xQueueSend(print_queue_handle, &msg_rtc2, portMAX_DELAY);

		while(curr_state != sMainMenu)
		{
			// Wait for command notification (Notify wait)
			xTaskNotifyWait(0, 0, &cmd_addr, portMAX_DELAY);
			cmd = (command_t*)cmd_addr;
			switch(curr_state)
			{
				case sRtcMenu:
				{
					// Process RTC menu commands
					if(cmd->len == 1)
					{
						menu_option = cmd->payload[0] - 48;
						if(menu_option == 0)
						{
							curr_state = sRtcTimeConfig;
							xQueueSend(print_queue_handle, &msg_rtc_hh, portMAX_DELAY);
						}
						else if(menu_option == 1)
						{
							curr_state = sRtcDateConfig;
							xQueueSend(print_queue_handle, &msg_rtc_dd, portMAX_DELAY);
						}
						else if(menu_option == 2)
						{
							curr_state = sRtcReport;
							xQueueSend(print_queue_handle, &msg_rtc_report, portMAX_DELAY);
						}
						else if(menu_option == 3)
							curr_state = sMainMenu;
						else
						{
							curr_state = sMainMenu;
							xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
						}
					}
					else
					{
						curr_state = sMainMenu;
						xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);
					}
					break;
				}
				case sRtcTimeConfig:
				{
					// get hh, mm, ss, info and configure RTC
					switch(rtc_state)
					{
						case HH_CONFIG:
						{
							uint8_t hour = getnumber(cmd->payload, cmd->len);
							time.Hours = hour;
							rtc_state = MM_CONFIG;
							xQueueSend(print_queue_handle, &msg_rtc_mm, portMAX_DELAY);
							break;
						}
						case MM_CONFIG:
						{
							uint8_t minute = getnumber(cmd->payload, cmd->len);
							time.Minutes = minute;
							rtc_state = SS_CONFIG;
							xQueueSend(print_queue_handle, &msg_rtc_ss, portMAX_DELAY);
							break;
						}
						case SS_CONFIG:
						{
							uint8_t sec = getnumber(cmd->payload, cmd->len);
							time.Seconds = sec;
							if(!validate_rtc_information(&time, NULL))
							{
								rtc_configure_time(&time);
								xQueueSend(print_queue_handle, &msg_conf, portMAX_DELAY);
								show_time_date();
							}
							else
								xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);

							curr_state = sMainMenu;
							rtc_state = 0;
							break;
						}
					}
					break;
				}
				case sRtcDateConfig:
				{
					switch(rtc_state)
					{
						case DATE_CONFIG:
						{
							uint8_t d = getnumber(cmd->payload, cmd->len);
							date.Date = d;
							rtc_state = MONTH_CONFIG;
							xQueueSend(print_queue_handle, &msg_rtc_mo, portMAX_DELAY);
							break;
						}
						case MONTH_CONFIG:
						{
							uint8_t month = getnumber(cmd->payload, cmd->len);
							date.Month = month;
							rtc_state = DAY_CONFIG;
							xQueueSend(print_queue_handle, &msg_rtc_dow, portMAX_DELAY);
							break;
						}
						case DAY_CONFIG:
						{
							uint8_t day = getnumber(cmd->payload, cmd->len);
							date.WeekDay = day;
							rtc_state = YEAR_CONFIG;
							xQueueSend(print_queue_handle, &msg_rtc_yr, portMAX_DELAY);
							break;
						}
						case YEAR_CONFIG:
						{
							uint8_t year = getnumber(cmd->payload, cmd->len);
							date.Year = year;

							if(!validate_rtc_information(NULL, &date))
							{
								rtc_configure_date(&date);
								xQueueSend(print_queue_handle, &msg_conf, portMAX_DELAY);
								show_time_date();
							}
							else
								xQueueSend(print_queue_handle, &msg_inv, portMAX_DELAY);

							curr_state = sMainMenu;
							rtc_state = 0;
							break;
						}
					}

					break;
				}
				case sRtcReport:
				{
					// enable or disable RTC current time reporting over ITM printf

					break;
				}
			}
			// Notify menu task
			xTaskNotify(menu_task_handle, 0, eNoAction);
		}
	}
}

void print_task(void* parameters)
{
	uint32_t *msg;
	while(1)
	{
		xQueueReceive(print_queue_handle, &msg, portMAX_DELAY);
		HAL_UART_Transmit(&huart2, (uint8_t*)msg, strlen((char*)msg), HAL_MAX_DELAY);
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
		{
			// Notify menu task with the command
			xTaskNotify(menu_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
		}
		case sLedEffect:
		{
			// Notify LED task with the command
			xTaskNotify(led_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
		}
		case sRtcMenu:
		case sRtcTimeConfig:
		case sRtcDateConfig:
		case sRtcReport:
		{
			// Notify task with the command
			xTaskNotify(rtc_task_handle, (uint32_t)cmd, eSetValueWithOverwrite);
			break;
		}
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
