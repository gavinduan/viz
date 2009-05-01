# --------------------------------------------------- -*- Makefile -*- --
# $Id: x86_64.mk,v 1.20 2009/05/01 19:07:30 mjk Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		       version 5.2 (Chimichanga)
# 
# Copyright (c) 2000 - 2009 The Regents of the University of California.
# All rights reserved.	
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2. Redistributions in binary form must reproduce the above copyright
# notice unmodified and in its entirety, this list of conditions and the
# following disclaimer in the documentation and/or other materials provided 
# with the distribution.
# 
# 3. All advertising and press materials, printed or electronic, mentioning
# features or use of this software must display the following acknowledgement: 
# 
# 	"This product includes software developed by the Rocks(r)
# 	Cluster Group at the San Diego Supercomputer Center at the
# 	University of California, San Diego and its contributors."
# 
# 4. Except as permitted for the purposes of acknowledgment in paragraph 3,
# neither the name or logo of this software nor the names of its
# authors may be used to endorse or promote products derived from this
# software without specific prior written permission.  The name of the
# software includes the following terms, and any derivatives thereof:
# "Rocks", "Rocks Clusters", and "Avalanche Installer".  For licensing of 
# the associated name, interested parties should contact Technology 
# Transfer & Intellectual Property Services, University of California, 
# San Diego, 9500 Gilman Drive, Mail Code 0910, La Jolla, CA 92093-0910, 
# Ph: (858) 534-5815, FAX: (858) 534-7345, E-MAIL:invent@ucsd.edu
# 
# THIS SOFTWARE IS PROVIDED BY THE REGENTS AND CONTRIBUTORS ``AS IS''
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# @Copyright@
#
# $Log: x86_64.mk,v $
# Revision 1.20  2009/05/01 19:07:30  mjk
# chimi con queso
#
# Revision 1.19  2009/02/13 17:49:55  mjk
# new drivers
#
# Revision 1.18  2008/10/18 00:56:19  mjk
# copyright 5.1
#
# Revision 1.17  2008/05/31 02:57:37  mjk
# - SAGE is back and works (mostly)
# - DMX building from source (in progress)
# - Updated nvidia driver
#
# Revision 1.16  2008/03/06 23:42:01  mjk
# copyright storm on
#
# Revision 1.15  2007/10/09 21:09:30  mjk
# new driver
#
# Revision 1.14  2007/08/02 16:51:13  mjk
# new version
#
# Revision 1.13  2007/06/23 04:04:04  mjk
# mars hill copyright
#
# Revision 1.12  2007/04/06 22:15:21  mjk
# new driver
#
# Revision 1.11  2006/09/11 22:50:36  mjk
# monkey face copyright
#
# Revision 1.10  2006/08/10 00:12:13  mjk
# 4.2 copyright
#
# Revision 1.9  2006/01/09 20:44:45  mjk
# update nvidia driver
#
# Revision 1.8  2005/10/12 18:11:17  mjk
# final copyright for 4.1
#
# Revision 1.7  2005/09/16 01:04:55  mjk
# updated copyright
#
# Revision 1.6  2005/07/18 23:09:52  mjk
# new driver
#
# Revision 1.5  2005/05/24 21:24:08  mjk
# update copyright, release is not any closer
#
# Revision 1.4  2005/03/17 17:52:14  mjk
# new drivers for pci express cards (no ia64 update)
#
# Revision 1.3  2004/07/16 17:10:36  mjk
# builds
#
# Revision 1.2  2004/07/16 17:02:35  mjk
# *** empty log message ***
#
# Revision 1.1  2004/07/16 16:55:00  mjk
# *** empty log message ***
#

VERSION		= 180
NVIDIA_VERSION	= $(VERSION).29-pkg2
NVIDIA_ARCH	= $(ARCH)
