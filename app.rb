require 'bundler'
Bundler.require

#indique le chemin des fichiers :
$:.unshift File.expand_path("./../lib", __FILE__)

require 'Application'
require 'Board'
require 'BoardCase'
require 'Game'
require 'Player'
require 'Show'

Application.game

