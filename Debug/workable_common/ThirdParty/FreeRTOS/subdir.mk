################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/croutine.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/event_groups.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/list.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/queue.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/stream_buffer.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/tasks.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/timers.c 

OBJS += \
./workable_common/ThirdParty/FreeRTOS/croutine.o \
./workable_common/ThirdParty/FreeRTOS/event_groups.o \
./workable_common/ThirdParty/FreeRTOS/list.o \
./workable_common/ThirdParty/FreeRTOS/queue.o \
./workable_common/ThirdParty/FreeRTOS/stream_buffer.o \
./workable_common/ThirdParty/FreeRTOS/tasks.o \
./workable_common/ThirdParty/FreeRTOS/timers.o 

C_DEPS += \
./workable_common/ThirdParty/FreeRTOS/croutine.d \
./workable_common/ThirdParty/FreeRTOS/event_groups.d \
./workable_common/ThirdParty/FreeRTOS/list.d \
./workable_common/ThirdParty/FreeRTOS/queue.d \
./workable_common/ThirdParty/FreeRTOS/stream_buffer.d \
./workable_common/ThirdParty/FreeRTOS/tasks.d \
./workable_common/ThirdParty/FreeRTOS/timers.d 


# Each subdirectory must supply rules for building sources it contributes
workable_common/ThirdParty/FreeRTOS/croutine.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/croutine.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/event_groups.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/event_groups.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/list.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/list.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/queue.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/queue.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/stream_buffer.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/stream_buffer.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/tasks.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/tasks.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/FreeRTOS/timers.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/timers.c workable_common/ThirdParty/FreeRTOS/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-workable_common-2f-ThirdParty-2f-FreeRTOS

clean-workable_common-2f-ThirdParty-2f-FreeRTOS:
	-$(RM) ./workable_common/ThirdParty/FreeRTOS/croutine.d ./workable_common/ThirdParty/FreeRTOS/croutine.o ./workable_common/ThirdParty/FreeRTOS/croutine.su ./workable_common/ThirdParty/FreeRTOS/event_groups.d ./workable_common/ThirdParty/FreeRTOS/event_groups.o ./workable_common/ThirdParty/FreeRTOS/event_groups.su ./workable_common/ThirdParty/FreeRTOS/list.d ./workable_common/ThirdParty/FreeRTOS/list.o ./workable_common/ThirdParty/FreeRTOS/list.su ./workable_common/ThirdParty/FreeRTOS/queue.d ./workable_common/ThirdParty/FreeRTOS/queue.o ./workable_common/ThirdParty/FreeRTOS/queue.su ./workable_common/ThirdParty/FreeRTOS/stream_buffer.d ./workable_common/ThirdParty/FreeRTOS/stream_buffer.o ./workable_common/ThirdParty/FreeRTOS/stream_buffer.su ./workable_common/ThirdParty/FreeRTOS/tasks.d ./workable_common/ThirdParty/FreeRTOS/tasks.o ./workable_common/ThirdParty/FreeRTOS/tasks.su ./workable_common/ThirdParty/FreeRTOS/timers.d ./workable_common/ThirdParty/FreeRTOS/timers.o ./workable_common/ThirdParty/FreeRTOS/timers.su

.PHONY: clean-workable_common-2f-ThirdParty-2f-FreeRTOS

