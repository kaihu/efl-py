# Copyright 2013 Kai Huuhko <kai.huuhko@gmail.com>
#
# This file is part of Python-Eyesight.
#
# Python-Eyesight is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# Python-Eyesight is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with this Python-Eyesight.  If not, see <http://www.gnu.org/licenses/>.

cdef extern from "Eyesight.h":
    ctypedef enum Eyesight_Backend:
        EYESIGHT_BACKEND_NONE
        EYESIGHT_BACKEND_IMG
        EYESIGHT_BACKEND_PDF
        EYESIGHT_BACKEND_PS
        EYESIGHT_BACKEND_TXT

    ctypedef enum Eyesight_Orientation:
        EYESIGHT_ORIENTATION_PORTRAIT   = 0    # Portrait orientation
        EYESIGHT_ORIENTATION_LANDSCAPE  = 90   # Landscape orientation
        EYESIGHT_ORIENTATION_UPSIDEDOWN = 180  # Upside-down orientation
        EYESIGHT_ORIENTATION_SEASCAPE   = 270  # Seascape orientation

    ctypedef enum Eyesight_Link_Action_Kind:
        EYESIGHT_LINK_ACTION_UNKNOWN          #
        EYESIGHT_LINK_ACTION_GOTO             # go to destination in the same file
        EYESIGHT_LINK_ACTION_GOTO_REMOTE_FILE # go to destination in a remote file
        EYESIGHT_LINK_ACTION_LAUNCH           # launch app or open docuent
        EYESIGHT_LINK_ACTION_URI              # URI
        EYESIGHT_LINK_ACTION_NAMED            # named action
        EYESIGHT_LINK_ACTION_MOVIE            # movie action
        EYESIGHT_LINK_ACTION_RENDITION        #
        EYESIGHT_LINK_ACTION_SOUND            # sound action
        EYESIGHT_LINK_ACTION_JAVASCRIPT       # JaveScript action
        EYESIGHT_LINK_ACTION_OCG_STATE        # Set-OCG-State action

    ctypedef enum Eyesight_Movie_Operation:
        EYESIGHT_MOVIE_OPERATION_PLAY
        EYESIGHT_MOVIE_OPERATION_PAUSE
        EYESIGHT_MOVIE_OPERATION_RESUME
        EYESIGHT_MOVIE_OPERATION_STOP
