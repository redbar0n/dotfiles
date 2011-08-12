# Output helpers
def error(text) STDERR.puts "!  #{text}" end
def info(text, prefix="*") STDOUT.puts "#{prefix}  #{text}" end
def info_cmd(text) info(text, ">") end
def info_rm(text) info(text, "x") end

desc "Symlink dotfiles to home dir"
task :link do
  DotFile.symlink!
end

desc "Info on cmd colors"
task :colors do
  info "Snow Leopard:"
  info "  Set the Terminal app to 32-bit in Get Info"
  info "  Install SIMBL: http://www.culater.net/software/SIMBL/SIMBL.php"
  info "  Download the terminal colors: https://github.com/downloads/evanphx/terminalcolours/TerminalColours-SL.tar.gz"
  info "  Download http://www.infinitered.com/settings/IR_Black.terminal.zip, double click and set as default"
  info "Lion:"
  info "  Download http://blog.toddwerth.com/entry_files/13/IR_Black.terminal.zip and install"

end

class DotFile
  class << self
    # Files in to ignore when symlinking.
    IGNORE = %w{Rakefile README.md .gitignore}.map(&:downcase)

    def each_file
      Dir["*"].each do |file|
        source = File.join(Dir.pwd, file)
        basename = File.basename(source).downcase
        yield new(source) unless IGNORE.include?(basename) or File.directory?(source)
      end
    end

    def symlink!
      each_file &:symlink!
    end
  end

  attr_accessor :source

  def initialize(source)
    self.source = source
  end

  def symlink!
    clear!

    if has_placeholders?
      replace_placeholders!
    else
      # info_cmd "ln -s #{source} #{destination}"
      info_cmd "Symlinking .#{basename}"
      FileUtils.ln_s(source, destination)
    end
  end

  private

  def basename
    @basename ||= File.basename(source)
  end

  def destination
    @destination ||= File.expand_path("~/.#{basename}")
  end

  def clear!
    if File.symlink?(destination)
      remove_symlink!
    elsif File.exists?(destination)
      backup_file!
    end
  end

  def remove_symlink!
    symlink_to = File.readlink(destination)
    info_rm "Removing symlink #{destination} --> #{symlink_to}" if symlink_to != source
    FileUtils.rm(destination)
  end

  def backup_file!
    info ".#{basename} exists. The file is moved to ~/.#{basename}.old."
    FileUtils.mv(destination, "#{destination}.old")
  end

  def contents
    @contents ||= (File.read(source) rescue "")
  end

  def has_placeholders?
    contents.include?('<.replace ')
  end

  def replace_placeholders!
    info ".#{basename} has <.replace> placeholders."

    contents.gsub!(/<\.replace (.+?)>/) do
      info "Replacing placeholder #{$1} in .#{basename}"
      File.read(File.expand_path("~/.#{$1}"))
    end

    File.open(destination, 'w') {|f| f.write contents }
    info_cmd "Wrote file ~/.#{basename}"
  rescue => e
    error "Could not replace `#{$&}`: #{e.message}"
    ""
  end
end
