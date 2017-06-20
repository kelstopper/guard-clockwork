require 'guard'
require 'guard/plugin'
require 'guard/clockwork/version'

module Guard
  class Clockwork < Plugin
    DEFAULT_CLOCKFILE = 'config/clock.rb'

    def initialize(options = {})
      @options = options
      @pid = nil
      @clockfile = options[:clockfile] || DEFAULT_CLOCKFILE
      super
    end

    def start
      stop
      UI.info 'Starting up clockwork...'
      UI.info cmd

      @pid = spawn({}, cmd)
    end

    def stop
      if @pid
        UI.info 'Stopping clockwork...'
        ::Process.kill :INT, @pid
        ::Process.wait @pid
        UI.info 'Stopped process clockwork'
      end
    rescue Errno::ESRCH
      UI.info 'Guard::Clockwork lost the subprocess!'
    ensure
      @pid = nil
    end

    # Called on Ctrl-Z signal
    def reload
      UI.info 'Restarting clockwork...'
      restart
    end

    # Called on Ctrl-/ signal
    def run_all
      true
    end

    # Called on file(s) modifications
    def run_on_changes(paths)
      restart
    end

    def restart
      stop
      start
    end

    private

    def cmd
      "bundle exec clockwork #{@clockfile}"
    end

  end
end
