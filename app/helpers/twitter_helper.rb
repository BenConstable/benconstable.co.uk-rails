# Twitter helper
module TwitterHelper
    # Time constants
    ONE_MINUTE = 60
    ONE_HOUR = 3600
    ONE_DAY = 86400

    # From the given time, get a nicely formatted 'seconds/minutes/days ago'
    # string
    def ago(time)
        now = Time.new
        diff = (now - time)
        
        case
        when (diff < ONE_MINUTE)
            format_denomination('second', diff.to_i)
        when (diff < ONE_HOUR)
            format_denomination('minute', (diff / ONE_MINUTE).to_i)
        when (diff < ONE_DAY)
            format_denomination('hour', (diff / ONE_HOUR).to_i)
        else
            format_denomination('day', (diff / ONE_DAY).to_i)
        end
    end

    # Format the time as a string with the given increment text
    def format_denomination(increment, time)
        "#{time.to_s} #{increment}#{time > 1 ? 's' : ''} ago"
    end
end