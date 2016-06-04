
include( XRootDCommon )

#-------------------------------------------------------------------------------
# Shared library version
#-------------------------------------------------------------------------------
set( XRD_SSI_VERSION   1.0.0 )
set( XRD_SSI_SOVERSION 1 )
set( XRD_SSI_SHMAP_VERSION   1.0.0 )
set( XRD_SSI_SHMAP_SOVERSION 1 )

#-------------------------------------------------------------------------------
# The XrdSsi library
#-------------------------------------------------------------------------------
add_library(
  XrdSsi
  SHARED
                                       XrdSsi/XrdSsiAtomics.hh
                                       XrdSsi/XrdSsiBVec.hh
XrdSsi/XrdSsiClient.cc
                                       XrdSsi/XrdSsiCluster.hh
XrdSsi/XrdSsiCms.cc                    XrdSsi/XrdSsiCms.hh
XrdSsi/XrdSsiDebug.cc                  XrdSsi/XrdSsiDebug.hh
XrdSsi/XrdSsiDir.cc                    XrdSsi/XrdSsiDir.hh
                                       XrdSsi/XrdSsiErrInfo.hh
XrdSsi/XrdSsiEvent.cc                  XrdSsi/XrdSsiEvent.hh
XrdSsi/XrdSsiFile.cc                   XrdSsi/XrdSsiFile.hh
XrdSsi/XrdSsiFileReq.cc                XrdSsi/XrdSsiFileReq.hh
XrdSsi/XrdSsiLogger.cc                 XrdSsi/XrdSsiLogger.hh
XrdSsi/XrdSsiPacer.cc                  XrdSsi/XrdSsiPacer.hh
                                       XrdSsi/XrdSsiProvider.hh
                                       XrdSsi/XrdSsiRRInfo.hh
                                       XrdSsi/XrdSsiRRTable.hh
XrdSsi/XrdSsiRequest.cc                XrdSsi/XrdSsiRequest.hh
                                       XrdSsi/XrdSsiResponder.hh
                                       XrdSsi/XrdSsiResource.hh
XrdSsi/XrdSsiServReal.cc               XrdSsi/XrdSsiServReal.hh
                                       XrdSsi/XrdSsiService.hh
XrdSsi/XrdSsiSessReal.cc               XrdSsi/XrdSsiSessReal.hh
XrdSsi/XrdSsiSSRun.cc                  XrdSsi/XrdSsiSSRun.hh
                                       XrdSsi/XrdSsiSession.hh
XrdSsi/XrdSsiSfs.cc                    XrdSsi/XrdSsiSfs.hh
XrdSsi/XrdSsiSfsConfig.cc              XrdSsi/XrdSsiSfsConfig.hh
XrdSsi/XrdSsiStat.cc
                                       XrdSsi/XrdSsiStream.hh
XrdSsi/XrdSsiTaskReal.cc               XrdSsi/XrdSsiTaskReal.hh
                                       XrdSsi/XrdSsiTrace.hh
XrdSsi/XrdSsiUtils.cc                  XrdSsi/XrdSsiUtils.hh)

target_link_libraries(
  XrdSsi
  XrdCl
  XrdServer
  XrdUtils
  pthread )

set_target_properties(
  XrdSsi
  PROPERTIES
  VERSION   ${XRD_SSI_VERSION}
  SOVERSION ${XRD_SSI_SOVERSION}
  LINK_INTERFACE_LIBRARIES "" )

#-------------------------------------------------------------------------------
# The XrdSsiShMap library
#-------------------------------------------------------------------------------
add_library(
  XrdSsiShMap
  SHARED
XrdSsi/XrdSsiShMam.cc                  XrdSsi/XrdSsiShMam.hh
XrdSsi/XrdSsiShMap.icc                 XrdSsi/XrdSsiShMap.hh
XrdSsi/XrdSsiShMat.cc                  XrdSsi/XrdSsiShMat.hh)

target_link_libraries(
  XrdSsiShMap
  ${ZLIB_LIBRARY}
  pthread )

set_target_properties(
  XrdSsiShMap
  PROPERTIES
  VERSION   ${XRD_SSI_SHMAP_VERSION}
  SOVERSION ${XRD_SSI_SHMAP_SOVERSION}
  LINK_INTERFACE_LIBRARIES "" )

#-------------------------------------------------------------------------------
# Install
#-------------------------------------------------------------------------------
install(
  TARGETS XrdSsi XrdSsiShMap
  LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR} )
