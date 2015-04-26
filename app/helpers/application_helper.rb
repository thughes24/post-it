module ApplicationHelper
  def fix_url(url)
    url.starts_with?('http://') ? url : "https://#{url}"
  end

  def time_friendly(x)
    str = x.to_s
    str_array = str.split
    hhmmss = str_array[1].split(':')
    yyyymmdd = str_array[0].split('-')
    years = yyyymmdd[0]
    months = month_to_str(yyyymmdd[1])
    days = yyyymmdd[2]
    hours = hhmmss[0]
    minutes = hhmmss[1]
    "#{hours}:#{minutes} #{am_or_pm(hours)} on #{days} #{months}, #{years}"
  end

  def am_or_pm(hour)
    hr = hour.to_i
    if hr > 12
      hr -= 12
      "PM"
    else 
      "AM"
    end
  end

  def month_to_str(month)
    case month.to_s
    when "01" then "Jan"
    when "02" then "Feb"
    when "03" then "Mar"
    when "04" then "Apr"
    when "05" then "May"
    when "06" then "Jun"
    when "07" then "Jul"
    when "08" then "Aug"
    when "09" then "Sep"
    when "10" then "Oct"
    when "11" then "Nov"
    when "12" then "Dec"
    end
  end
end
