require 'fastlane/action'
require_relative '../helper/make_helper'

module Fastlane
  module Actions
    module SharedValues
      MAKE_OUTPUT = :MAKE_OUTPUT
    end
    class MakeAction < Action
      def self.run(params)
        file = params[:file]
        target = params[:target]
        envs = params[:envs]
        jobs = params[:jobs]

        export_cmd = if envs
                       cmds = []
                       envs.each do |k, v|
                         cmds << "export #{k.to_s.strip}=#{v}"
                       end
                       cmds.join(';')
                     else
                       nil
                     end
        # puts "export_cmd:"
        # pp export_cmd

        cmds = ['make']
        cmds << "-C #{File.dirname(file)}"
        cmds << "-f #{File.basename(file)}"
        cmds << target if target
        cmds << "-j#{jobs}" if jobs
        make_cmd = cmds.join(' ')
        # puts "make_cmd:"
        # pp make_cmd

        cmds = [
          (export_cmd if export_cmd),
          make_cmd
        ].compact
        cmd = cmds.join(';')
        # puts "cmd:"
        # pp cmd

        Actions.sh(cmd)
      end

      def self.description
        "Linux GNU Makefile make wrapper"
      end

      def self.authors
        ["xiongzenghui"]
      end

      def self.return_value

      end

      def self.details
        "Linux GNU Makefile make wrapper"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :file,
            description: "where youer Makefile. if this: my_make, then: make -f my_make",
            optional: false,
            verify_block: ->(value) {
              UI.user_error!("file: #{value} not exist") unless File.exist?(value)
            }
          ),
          FastlaneCore::ConfigItem.new(
            key: :target,
            description: "which target will you to make, like: make <all>, defualt: make",
            optional: true
          ),
          FastlaneCore::ConfigItem.new(
            key: :envs,
            description: "setup make enviroment variables",
            optional: true,
            is_string: false
          ),
          FastlaneCore::ConfigItem.new(
            key: :jobs,
            description: "like make -j2",
            optional: true
          )
        ]
      end

      def self.category
        :building
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end