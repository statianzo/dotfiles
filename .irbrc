if File.exists? '.env'
  File.readlines('.env').
    map{|l| l.chomp }.
    reject{|l| l.empty?}.
    map{|l| l.split '='}.
    each {|k,v| ENV[k] ||= v}
end
IRB.conf[:USE_READLINE] = true
IRB.conf[:AUTO_INDENT]  = false

# Save History between irb sessions
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-save-history"

require 'irb/completion'
IRB.conf[:PROMPT_MODE] = :SIMPLE
