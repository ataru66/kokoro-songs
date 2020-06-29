module TracksHelper
  def convert_mins(milliseconds)
    return '' unless milliseconds
    hours, milliseconds   = milliseconds.divmod(1000 * 60 * 60)
    minutes, milliseconds = milliseconds.divmod(1000 * 60)
    seconds, milliseconds = milliseconds.divmod(1000)
    if seconds.to_s.length == 1
      "#{minutes}:0#{seconds}"
    else
      "#{minutes}:#{seconds}"
    end
  end
end
