TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = caparoc
# caparoc.dbd will be created and installed
DBD += caparoc.dbd

# caparoc.dbd will be made up from these files:
caparoc_DBD += base.dbd

# Include dbd files from all support applications:
caparoc_DBD += asyn.dbd
caparoc_DBD += drvAsynIPPort.dbd
caparoc_DBD += modbusSupport.dbd
caparoc_DBD += devIocStats.dbd asSupport.dbd reccaster.dbd caPutLog.dbd

# Add all the support libraries needed by this IOC
caparoc_LIBS += asyn modbus devIocStats autosave reccaster caPutLog

# caparoc_registerRecordDeviceDriver.cpp derives from caparoc.dbd
caparoc_SRCS += caparoc_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
caparoc_SRCS_DEFAULT += caparocMain.cpp
caparoc_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#caparoc_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
caparoc_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

