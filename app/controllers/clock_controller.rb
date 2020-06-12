class ClockController < ApplicationController
  require 'time'
  def index
    @time = Time.current
    @tokyo = Time.now.in_time_zone('Tokyo')
    @rome = Time.now.in_time_zone('Rome')
    @moscow = Time.now.in_time_zone('Moscow')
    
    @melbourneOffset = @time.utc_offset
    tokyoOffset = @tokyo.utc_offset
    romeOffset = @rome.utc_offset
    moscowOffset = @moscow.utc_offset

    melbTime = melbCal(@melbourneOffset)

    @tokyoComp = offsetCalc(tokyoOffset, melbTime)
    @romeComp = offsetCalc(romeOffset, melbTime)
    @moscowComp = offsetCalc(moscowOffset, melbTime)

    @melbHour = @time.strftime('%H:%M')
    @tokyoHour = @tokyo.strftime('%H:%M')
    @romeHour = @rome.strftime('%H:%M')
    @moscowHour = @moscow.strftime('%H:%M')

    @melbTime = timeModeCalc(@time)
    @tokyoTime = timeModeCalc(@tokyo)
    @romeTime = timeModeCalc(@rome)
    @moscowTime = timeModeCalc(@moscow)


    @y = @rome.time.to_i
  
  end

  private

  def timeModeCalc(x)
    #business
    if (x.hour >= 9) and (x.hour < 18)
      x = "Business"
      return x
    #overtime
    elsif (x.hour >= 18) and (x.hour < 20)
      x = "Business Overtime"
      return x
    #person time
    elsif (x.hour >= 8) and (x.hour < 9)
      x = "Person Time"
      return x
    elsif (x.hour >= 20) and (x.hour < 23)
      x = "Person Time"
      return x
    else
      x = "Sleeping Time"
      return x
    end
  end

  def melbCal(x)
    x = x / 60
    x = x / 60
    return x
  end

  def offsetCalc(x, y)

    x = x / 60
    x = x / 60

    x = x - y

    return x
  end
end
