module Paperclip
  class FlashContents < Processor
    def initialize file, options = {}, attachment = nil
      @file           = file
      @options        = options
      @instance       = attachment.instance
      @current_format = File.extname(attachment.instance.avatar_file_name)
      @basename       = File.basename(@file.path, @current_format)
      @whiny          = options[:whiny].nil? ? true : options[:whiny]
    end

    def picture_from_swfextract_command
      type = begin
        Paperclip.run("/usr/local/bin/swfextract", ":file | grep -- -j | awk '{print $5}'", :file => "#{@file.path}")
      rescue Cocaine::CommandLineError => e
        Rails.logger.error("Error while determining content type: #{e}")
      end
      if type.match(/\(.*?\)/)
        type = ""
      end
      type.split(/[:;\s]+/)[0]
    end

    
    def make
      begin
        @file
      rescue StandardError => e
        raise Paperclip::Error, "There was an error processing the file contents for #{@file.path} - #{e}" if @whiny
      end
    end
  end
end