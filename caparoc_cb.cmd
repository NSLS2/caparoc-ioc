
#######################################################################
# For TCP/IP use the following standard asyn command:
# drvAsynIPPortConfigure(const char *portName,
#                      const char *hostInfo,
#                      unsigned int priority,
#                      int noAutoConnect, 
#                      int noProcessEos)
#######################################################################
drvAsynIPPortConfigure("$(CAPAROC_ASYNPORT)", "$(IP)", 0, 0, 1)


#######################################################################
# The interpose driver is created with the command:
# modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType, .... Modbus link layer type: 0 = TCP/IP , 1 = RTU, 2 = ASCII
#                      int timeoutMsec, 
#                      int writeDelayMsec)
#######################################################################
modbusInterposeConfig("$(CAPAROC_ASYNPORT)", 0, 2000, 0)


#######################################################################
# Modbus port driver is created with the following command:
# drvModbusAsynConfigure(portName, 
#                        tcpPortName,
#                        slaveAddress, 
#                        modbusFunction, 
#                        modbusStartAddress, 
#                        modbusLength,
#                        dataType,
#                        pollMsec, 
#                        plcType);
#######################################################################

#######################################################################
##Modbus functions
# Function name                         Function code

# Read Coils                            1
# Read Discrete Inputs                  2
# Read Holding Registers                3
# Read Input Registers                  4
# Write Single Coil                     5
# Write Single Register                 6
# Write Multiple Coils                  15
# Write Multiple Registers              16
# Report Slave ID                       17
# Read/Write Multiple Registers         23
#######################################################################

#######################################################################
##Supported Modbus data types
# drvUser field 	        Description

# "INT16"               16-bit signed (2’s complement) integers. This data type extends the sign bit when converting to epicsInt32.
# "INT16SM"             16-bit binary integers, sign and magnitude format. In this format bit 15 is the sign bit, and bits 0-14 are the absolute value of the magnitude of the number. This is one of the formats used, for example, by Koyo PLCs for numbers such as ADC conversions.
# "BCD_UNSIGNED"        Binary coded decimal (BCD), unsigned. This data type is for a 16-bit number consisting of 4 4-bit nibbles, each of which encodes a decimal number from 0-9. A BCD number can thus store numbers from 0 to 9999. Many PLCs store some numbers in BCD format.
# "BCD_SIGNED"          4-digit binary coded decimal (BCD), signed. This data type is for a 16-bit number consisting of 3 4-bit nibbles, and one 3-bit nibble. Bit 15 is a sign bit. Signed BCD numbers can hold values from -7999 to +7999. This is one of the formats used by Koyo PLCs for numbers such as ADC conversions.
# "UINT16"              Unsigned 16-bit binary integers.
# "INT32_LE"            32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1).
# "INT32_LE_BS"         32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1). Bytes within each word are swapped.
# "INT32_BE"            32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1).
# "INT32_BE_BS"         32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1). Bytes within each word are swapped.
# "UINT32_LE"           Unsigned 32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1).
# "UINT32_LE_BS"        Unsigned 32-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1). Bytes within each word are swapped.
# "UINT32_BE"           Unsigned 32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1).
# "UINT32_BE_BS"        Unsigned 32-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1). Bytes within each word are swapped.
# "INT64_LE"            64-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3).
# "INT64_LE_BS"         64-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3). Bytes within each word are swapped.
# "INT64_BE"            64-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3).
# "INT64_BE_BS"         64-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3). Bytes within each word are swapped.
# "UINT64_LE"           Unsigned 64-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3).
# "UINT64_LE_BS"        Unsigned 64-bit integers, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3). Bytes within each word are swapped.
# "UINT64_BE"           Unsigned 64-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3).
# "UINT64_BE_BS"        Unsigned 64-bit integers, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3). Bytes within each word are swapped.
# "FLOAT32_LE"          32-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1).
# "FLOAT32_LE_BS"       32-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+1). Bytes within each word are swapped.
# "FLOAT32_BE"          32-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1).
# "FLOAT32_BE_BS"       32-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+1). Bytes within each word are swapped.
# "FLOAT64_LE"          64-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3).
# "FLOAT64_LE_BS"       64-bit floating point, little endian (least significant word at Modbus address N, most significant word at Modbus address N+3). Bytes within each word are swapped.
# "FLOAT64_BE"          64-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3).
# "FLOAT64_BE_BS"       64-bit floating point, big endian (most significant word at Modbus address N, least significant word at Modbus address N+3). Bytes within each word are swapped.
# "STRING_HIGH"         String data. One character is stored in the high byte of each register.
# "STRING_LOW"          String data. One character is stored in the low byte of each register.
# "STRING_HIGH_LOW"     String data. Two characters are stored in each register, the first in the high byte and the second in the low byte.
# "STRING_LOW_HIGH"     String data. Two characters are stored in each register, the first in the low byte and the second in the high byte.
# "ZSTRING_HIGH"        Zero terminated string data. One character is stored in the high byte of each register.
# "ZSTRING_LOW"         Zero terminated string data. One character is stored in the low byte of each register.
# "ZSTRING_HIGH_LOW"    Zero terminated string data. Two characters are stored in each register, the first in the high byte and the second in the low byte.
# "ZSTRING_LOW_HIGH"    Zero terminated string data. Two characters are stored in each register, the first in the low byte and the second in the high byte.
#######################################################################

# Channel Error Reset
# Function 16 (Write Multiple Registers), address 272, 16 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_ERR_RST", "$(CAPAROC_ASYNPORT)", 0, 16, 272, 4, "UINT16", 100, "caparoc")
#drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_ERR_RST", "$(CAPAROC_ASYNPORT)", 0, 6, 272, 1, "UINT16", 100, "caparoc")

# Error Counter Reset
# Function 16 (Write Multiple Registers), address 288, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_ERR_CNT_RST", "$(CAPAROC_ASYNPORT)", 0, 16, 288, 13, "UINT16", 100, "caparoc")

# CB Module Count
# Function 3 (Read Holding Registers), address 8192, 1 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_MOD_NUM", "$(CAPAROC_ASYNPORT)", 0, 3, 8192, 1, "UINT16", 100, "caparoc")

# Channel Count
# Function 3 (Read Holding Registers), address 8193, 16 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_CHAN_NUM", "$(CAPAROC_ASYNPORT)", 0, 3, 8193, 4, "UINT16", 100, "caparoc")

# Min Nominal Current
# Function 3 (Read Holding Registers), address 8224, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_MIN_NOM_I", "$(CAPAROC_ASYNPORT)", 0, 3, 8224, 13, "UINT16", 100, "caparoc")

# Max Nominal Current
# Function 3 (Read Holding Registers), address 8288, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_MAX_NOM_I", "$(CAPAROC_ASYNPORT)", 0, 3, 8288, 13, "UINT16", 100, "caparoc")


drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_SYS_STS", "$(CAPAROC_ASYNPORT)", 0, 3, 24576, 1, "UINT16", 100, "caparoc")
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_PS_FUNC", "$(CAPAROC_ASYNPORT)", 0, 3, 28672, 1, "UINT16", 100, "caparoc")

# Input Voltage, Current
# Function 3 (Read Holding Registers), address 24577, 10 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_SYS_INP1", "$(CAPAROC_ASYNPORT)", 0, 3, 24577, 2, "UINT16", 100, "caparoc")
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_SYS_INP2", "$(CAPAROC_ASYNPORT)", 0, 3, 24581, 5, "UINT16", 100, "caparoc")

# Status
# Function 3 (Read Holding Registers), address 24592, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_CHAN_STS", "$(CAPAROC_ASYNPORT)", 0, 3, 24592, 13, "UINT16", 100, "caparoc")

# Output Current
# Function 3 (Read Holding Registers), address 24656, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_I_LOAD", "$(CAPAROC_ASYNPORT)", 0, 3, 24656, 13, "UINT16", 100, "caparoc")

# Error Counter
# Function 3 (Read Holding Registers), address 24720, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_ERR_CNT", "$(CAPAROC_ASYNPORT)", 0, 3, 24720, 13, "UINT16", 100, "caparoc")



# Global Switch-on Delay
# Function 3 (Read Holding Registers), address 49152, 1 words, data_type = UINT16,
#drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_GSOD_RB", "$(CAPAROC_ASYNPORT)", 0, 3, 49152, 1, "UINT16", 100, "caparoc")
# Function 16 (Write Multiple Registers), address 49152, 1 words, data_type = UINT16,
#drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_GSOD", "$(CAPAROC_ASYNPORT)", 0, 16, 49152, 1, "UINT16", 100, "caparoc")

# Control Channel
# Function 3 (Read Holding Registers), address 49168, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_CTRL_CHAN_STS", "$(CAPAROC_ASYNPORT)", 0, 3, 49168, 13, "UINT16", 100, "caparoc")
# Function 16 (Write Multiple Registers), address 49168, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_CTRL_CHAN_CMD", "$(CAPAROC_ASYNPORT)", 0, 16, 49168, 13, "UINT16", 100, "caparoc")

# Nominal Current
# Function 3 (Read Holding Registers), address 49232, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_NOM_I_RB", "$(CAPAROC_ASYNPORT)", 0, 3, 49232, 13, "UINT16", 100, "caparoc")
# Function 16 (Write Multiple Registers), address 49232, 64 words, data_type = UINT16,
drvModbusAsynConfigure("$(CAPAROC_ASYNPORT)_NOM_I_SP", "$(CAPAROC_ASYNPORT)", 0, 16, 49232, 13, "UINT16", 100, "caparoc")

# Load database
dbLoadRecords("$(TOP)/db/caparoc_cb.db","Sys=$(SYSNAME), Dev=$(DEV), ASYNPORT=$(CAPAROC_ASYNPORT)")



