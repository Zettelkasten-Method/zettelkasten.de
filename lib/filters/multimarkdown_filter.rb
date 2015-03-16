require "systemu"

class MultiMarkdownFilter < Nanoc::Filter
  identifier :mmd
  type :text
  
  def run(content, args = {})
    output = ''
    stderr = ''
    status = systemu(
      [ 'multimarkdown' ],
      'stdin'  => content,
      'stdout' => output,
      'stderr' => stderr)

    unless status.success?
      $stderr.puts stderr
      raise RuntimeError, "MultiMarkdown filter failed with status #{status}"
    end
    
    output.force_encoding('UTF-8')
  end
end
