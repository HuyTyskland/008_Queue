################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.c \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.c 

S_UPPER_SRCS += \
D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S 

OBJS += \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.o \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.o \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.o 

S_UPPER_DEPS += \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d 

C_DEPS += \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.d \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.d \
./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.d 


# Each subdirectory must supply rules for building sources it contributes
workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.c workable_common/ThirdParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.S workable_common/ThirdParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.c workable_common/ThirdParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.o: D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.c workable_common/ThirdParty/SEGGER/SEGGER/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx -c -I../Core/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc -I../Drivers/STM32F4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F4xx/Include -I../Drivers/CMSIS/Include -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/include" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/FreeRTOS/portable/GCC/ARM_CM4F" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/Config" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/OS" -I"D:/Self-development/RTOS/RTOS_workspace/workable_common/ThirdParty/SEGGER/SEGGER" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-workable_common-2f-ThirdParty-2f-SEGGER-2f-SEGGER

clean-workable_common-2f-ThirdParty-2f-SEGGER-2f-SEGGER:
	-$(RM) ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.d ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.o ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT.su ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.d ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_ASM_ARMv7M.o ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.d ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.o ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_RTT_printf.su ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.d ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.o ./workable_common/ThirdParty/SEGGER/SEGGER/SEGGER_SYSVIEW.su

.PHONY: clean-workable_common-2f-ThirdParty-2f-SEGGER-2f-SEGGER

