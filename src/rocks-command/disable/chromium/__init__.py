# $Id: __init__.py,v 1.8 2011/07/23 02:31:39 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.4.3 (Viper)
# 
# Copyright (c) 2000 - 2011 The Regents of the University of California.
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
# 	Development Team at the San Diego Supercomputer Center at the
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
# $Log: __init__.py,v $
# Revision 1.8  2011/07/23 02:31:39  phil
# Viper Copyright
#
# Revision 1.7  2010/09/07 23:53:28  bruno
# star power for gb
#
# Revision 1.6  2009/06/11 23:34:02  mjk
# - 32/64 bit chromium
# - cleaning up the usersguide
#
# Revision 1.5  2009/06/03 20:15:31  mjk
# - kill gdm-binary to reset X server
# - bezel commands are chromium specific
#
# Revision 1.4  2009/05/01 19:07:31  mjk
# chimi con queso
#
# Revision 1.3  2008/10/18 00:56:20  mjk
# copyright 5.1
#
# Revision 1.2  2008/03/06 23:42:02  mjk
# copyright storm on
#
# Revision 1.1  2007/08/21 19:24:13  mjk
# *** empty log message ***
#

import rocks.commands.disable
import os

class command(rocks.commands.disable.command):
	MustBeRoot = 0

class Command(command):
	"""
	Disable Chromium for all dynamically linked OpenGL applications.
	
	<example cmd="disable chromium">
	</example>
	"""
	

	def run(self, params, args):
	
		crlibs64 = os.path.join(os.environ['HOME'], '.crlibs')
		crlibs32 = os.path.join(os.environ['HOME'], '.crlibs32')
		
		if os.path.exists(crlibs64):
			os.system('rm -rf %s' % crlibs64)
		if os.path.exists(crlibs32):
			os.system('rm -rf %s' % crlibs32)
