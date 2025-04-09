/*
 * as5600.h
 *
 *  Created on: Apr 7, 2025
 *      Author: Konrad
 */

#ifndef SRC_AS5600_AS5600_H_
#define SRC_AS5600_AS5600_H_

#include <stdint.h>
#include "main.h"

#define AS5600_I2C_ADDR       (0x36 << 1)

#define AS5600_REG_RAW_ANGLE  0x0C
#define AS5600_REG_ANGLE      0x0E

#define AS5600_REG_STATUS     0x0B
#define AS5600_REG_STATUS_MD  5

void AS5600_init(I2C_HandleTypeDef *i2c);
uint8_t AS5600_status();
int16_t AS5600_read_angle();
int16_t AS5600_read_raw_angle();

#endif /* SRC_AS5600_AS5600_H_ */
