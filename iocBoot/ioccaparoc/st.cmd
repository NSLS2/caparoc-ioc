#!../../bin/linux-x86_64/caparoc

#- You may have to change caparoc to something else
#- everywhere it appears in this file

#< envPaths

## Register all support components
dbLoadDatabase("../../dbd/caparoc.dbd",0,0)
caparoc_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadRecords("../../db/caparoc.db","user=hxu")

iocInit()

## Start any sequence programs
#seq snccaparoc,"user=hxu"
