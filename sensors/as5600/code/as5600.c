/*
 * as5600.c
 *
 *  Created on: Apr 7, 2025
 *      Author: Konrad
 */

#include "as5600.h"

static I2C_HandleTypeDef *i2c_instance;

void AS5600_init(I2C_HandleTypeDef *i2c) {
	i2c_instance = i2c;
}

static void AS5600_read_register(uint8_t reg, void *data, uint8_t len) {
	HAL_I2C_Mem_Read(i2c_instance, AS5600_I2C_ADDR, reg, I2C_MEMADD_SIZE_8BIT,
			(uint8_t*) data, len, HAL_MAX_DELAY);
}

static int16_t AS5600_read(uint8_t reg) {
	if (!(AS5600_status() & (1 << AS5600_REG_STATUS_MD)))
		return -1;

	int16_t angle;
	uint8_t buf[2];
	AS5600_read_register(reg, &buf, 2);
	angle = ((int16_t) buf[0] << 8) | buf[1];

	return angle;
}

uint8_t AS5600_status() {
	uint8_t status;
	AS5600_read_register(AS5600_REG_STATUS, &status, 1);

	return status;
}

int16_t AS5600_read_angle() {
	return AS5600_read(AS5600_REG_ANGLE);
}

int16_t AS5600_read_raw_angle() {
	return AS5600_read(AS5600_REG_RAW_ANGLE);
}
