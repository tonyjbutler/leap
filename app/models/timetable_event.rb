# Leap - Electronic Individual Learning Plan Software
# Copyright (C) 2011 South Devon College

# Leap is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# Leap is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License
# along with Leap.  If not, see <http://www.gnu.org/licenses/>.

class TimetableEvent < SuperModel::Base

  attributes :title, :start, :end, :rooms, :teachers, :mark, :status

  def timetable_margin
   ((start.getutc - start.getutc.change(:hour => 8,:minute => 0, :sec => 0, :usec => 0)) / 50).floor
  end

  def timetable_height
    ((self.end - start) /56).floor
  end

end
