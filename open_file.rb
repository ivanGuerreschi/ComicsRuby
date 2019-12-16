#!/usr/bin/ruby

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# Email ivanguerreschi86@gmail.com
#
# Copyright (C) 2019  Ivan Guerreschi

module OpenFile
  def self.open
    name_file = 'comics.txt'
    begin
      File.open(name_file, 'r')
    end
  rescue Errno::ENOENT => e
    stderr.puts "File not found #{e}"
    file = File.new(name_file, 'w')
    file.close
  end
end
