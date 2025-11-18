#!bin/linux-x86_64/caparoc

#- You may have to change caparoc to something else
#- everywhere it appears in this file

< envPaths
#< /epics/common/xf31id1-ioc1-netsetup.cmd

## Generic EnvSet
epicsEnvSet("EPICS_BASE","/usr/lib/epics")
epicsEnvSet("MODBUS", "/usr/lib/epics")
epicsEnvSet("TOP","/nsls2/users/hxu/iocs/caparoc-ioc")

## Register all support components
dbLoadDatabase("$(TOP)/dbd/caparoc.dbd",0,0)
caparoc_registerRecordDeviceDriver(pdbbase) 

epicsEnvSet("SYSNAME","XF:31ID-ES")
epicsEnvSet("CTSYS","XF:31ID-CT")


### CAPAROC PM MB ###
epicsEnvSet("CAPAROC_ASYNPORT","CB")
epicsEnvSet("IP","xf31id1-ioLogik2.nsls2.bnl.local:502")
epicsEnvSet("DEV", "{IO}")

< caparoc_cb.cmd

iocInit()
