#!/usr/bin/ruby
require 'irb/completion'
require 'irb/ext/history'

IRB.conf[:AUTO_INDENT]   = true
IRB.conf[:SAVE_HISTORY]  = 1000
IRB.conf[:HISTORY_FILE]  = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE]   = :SIMPLE

def me(email='c@keathley.io')
  User.find_by(email: email)
end

def clear
  system('clear')
end
