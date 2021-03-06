# $Id: __init__.py,v 1.6 2012/11/27 00:49:36 phil Exp $
#
# @Copyright@
# 
# 				Rocks(r)
# 		         www.rocksclusters.org
# 		         version 5.6 (Emerald Boa)
# 		         version 6.1 (Emerald Boa)
# 
# Copyright (c) 2000 - 2013 The Regents of the University of California.
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
# $Log: __init__.py,v $
# Revision 1.6  2012/11/27 00:49:36  phil
# Copyright Storm for Emerald Boa
#
# Revision 1.5  2012/05/06 05:49:47  phil
# Copyright Storm for Mamba
#
# Revision 1.4  2011/07/23 02:31:40  phil
# Viper Copyright
#
# Revision 1.3  2010/09/07 23:53:30  bruno
# star power for gb
#
# Revision 1.2  2010/02/24 00:49:11  mjk
# - nvidia driver auto updates, but still works fine if the cluster is
#   not on the network.  Each node polls/pulls from nvidia.com the latest
#   driver.  User can disable and control the driver manually.
#   No more Roll updates to refresh the nvidia driver
# - X11 modules controlled by viz_x11_modules attribute
# - DPMS added back in
# - rocks start|stop tile to turn wall on|off
# - usersguide fixes (still needs work)
# - add nvidia driver version to tile-banner
# - bump version to 5.3.1
#
# Revision 1.1  2010/02/23 18:37:59  mjk
# DPMS back in (cglx needs this)
#

import os
import rocks.tile
import rocks.commands

class command(rocks.tile.TileCommand, 
	rocks.tile.TileArgumentProcessor,
	rocks.commands.stop.command):
	pass

class Command(command):
	"""
	Turn off tiles using power management.
	
	<example cmd='stop tile'>
	</example>
	"""

	def run(self, params, args):

		for (name, display) in self.getTileNames(args):
			self.db.execute("""select n.name, t.name, t.x, t.y from
				nodes n, tiles t where
				n.id=t.node and n.name='%s' and t.name='%s'
				order by t.x, t.y""" % (name, display))

			for row in self.db.fetchall():
				os.system('ssh -xf %s xset -display :%s dpms force off' % (row[0], row[1]))
	
