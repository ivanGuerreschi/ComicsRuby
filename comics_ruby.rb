#!/usr/bin/env ruby

# frozen_string_literal: true

# encoding: utf-8

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>
#
# Email ivanguerreschi86@gmail.com
#
# Copyright (C) 2019  Ivan Guerreschi

# Class for managing the comics text file
class Comics
  @comics_file = 'comics.txt'
  File.new(@comics_file, 'w') unless File.exist?(@comics_file)

  def self. print
    File.open(@comics_file, 'r').each_line do |line|
      date, number, name = line.split(':')
      puts "Date: #{date}"
      puts "Number: #{number}"
      puts "Name: #{name}"
    end
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.add(date, number, name)
    File.open(@comics_file, 'a+') do |file|
      file.puts "#{date}:#{number}:#{name}"
    end
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.delete(number)
    deleted_content = File.readlines(@comics_file).reject do |line|
      line =~ /:#{number}:/
    end
    File.open(@comics_file, 'w') do |file|
      deleted_content.each do |line|
        file.puts line
      end
    end
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.sort
    sort_content = File.readlines(@comics_file).sort
    File.open(@comics_file, 'w') do |file|
      sort_content.each do |line|
        file.puts line
      end
    end
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.search(search)
    File.open(@comics_file, 'r').each_line do |line|
      next unless line =~ /#{search}/

      date, number, name = line.split(':')
      puts "Date: #{date}"
      puts "Number: #{number}"
      puts "Name: #{name}"
    end
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.remove_blank_line
    File.write(@comics_file, File.readlines(@comics_file).reject do |line|
      line.strip.empty?
    end.join)
  rescue Errno::ENOENT => e
    warn "Caught the exception: #{e}"
  end

  def self.replace(old, new)
    new_content = File.read(@comics_file).gsub(old, new)
    File.open(@comics_file, 'w') do |file|
      file.puts new_content
    end
  rescue Errno::ENOENT => e
    warm "Caught the exception: #{e}"
  end
end

if $PROGRAM_NAME == __FILE__

  def menu
    puts <<-MENU
    [p] List of comics
    [i] Enter comic book
    [e] Delete comic
    [s] Search
    [r] Replace
    [o] Sort
    [b] Remove blanks line
    [q] Quit
    MENU
  end

  def puts_print
    comic = Comics
    comic.print
  end

  def puts_insert
    puts 'Enter date the comic'
    date = gets.chomp
    puts 'Enter comic number'
    number = gets.chomp
    puts 'Enter comic book title'
    name = gets.chomp
    comic = Comics
    comic.add(date, number, name)
  end

  def puts_delete
    puts 'Enter the comic number to be deleted'
    number = gets.chomp
    comic = Comics
    comic.delete(number)
  end

  def puts_search
    puts 'Search comics'
    search = gets.chomp
    comic = Comics
    comic.search(search)
  end

  def puts_remove_blank_line
    comic = Comics
    comic.remove_blank_line
  end

  def puts_sort
    comic = Comics
    comic.sort
  end

  def puts_replace
    puts 'Enter replace comic'
    old = gets.chomp
    puts 'Enter new comic'
    new = gets.chomp
    comic = Comics
    comic.replace(old, new)
  end

  loop do
    menu
    puts
    input_opt = gets.chomp
    if input_opt == 'p'
      puts_print
    elsif input_opt == 'i'
      puts_insert
    elsif input_opt == 'e'
      puts_delete
    elsif input_opt == 's'
      puts_search
    elsif input_opt == 'b'
      puts_remove_blank_line
    elsif input_opt == 'o'
      puts_sort
    elsif input_opt == 'r'
      puts_replace
    end
    break if input_opt == 'q'
  end
end
