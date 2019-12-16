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

module Print
  def self.print
    File.open('comics.txt', 'r').each_line do |line|
      date, number, name = line.split(':')
      puts "Date: #{date}"
      puts "Number: #{number}"
      puts "Name: #{name}"
    end
  end
end
