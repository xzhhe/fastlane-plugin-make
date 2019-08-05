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

        cmds = ['make']
        cmds << "-C #{File.dirname(file)}"
        cmds << "-f #{File.basename(file)}"
        cmds << target if target
        envs.each do |k, v|
          cmds << "#{k.to_s}=#{v}"
        end if envs
        cmds << "-j#{jobs}" if jobs

        # Actions.lane_context[SharedValues::MAKE_OUTPUT] = Actions.sh(cmds.join(' '))
        Actions.sh(cmds.join(' '))
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

      def self.is_supported?(platform)
        true
      end
    end
  end
end