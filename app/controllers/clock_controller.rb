class ClockController < ApplicationController
  require 'time'
  def index
    @time = Time.current
    @tokyo = Time.now.in_time_zone('Tokyo')
    @rome = Time.now.in_time_zone('Rome')
    @moscow = Time.now.in_time_zone('Moscow')
    @la = Time.now.in_time_zone('America/Los_Angeles')
    
    @melbourneOffset = @time.utc_offset
    tokyoOffset = @tokyo.utc_offset
    romeOffset = @rome.utc_offset
    moscowOffset = @moscow.utc_offset
    laOffset = @la.utc_offset


    @twelveMelb = @time.strftime("%I:%M %p")
    @twelveTokyo = @tokyo.strftime("%I:%M %p")
    @twelveRome = @rome.strftime("%I:%M %p")
    @twelveMoscow = @moscow.strftime("%I:%M %p")
    @twelveLa = @la.strftime("%I:%M %p")

    melbTime = melbCal(@melbourneOffset)

    @tokyoComp = offsetCalc(tokyoOffset, melbTime)
    @romeComp = offsetCalc(romeOffset, melbTime)
    @moscowComp = offsetCalc(moscowOffset, melbTime)
    @laComp = offsetCalc(laOffset, melbTime)
    

    @melbHour = @time.strftime('%H:%M')
    @tokyoHour = @tokyo.strftime('%H:%M')
    @romeHour = @rome.strftime('%H:%M')
    @moscowHour = @moscow.strftime('%H:%M')
    @laHour = @la.strftime('%H:%M')
    

    @melbTime = timeModeCalc(@time)
    @tokyoTime = timeModeCalc(@tokyo)
    @romeTime = timeModeCalc(@rome)
    @moscowTime = timeModeCalc(@moscow)
    @laTime = timeModeCalc(@la)
    

    @testt = @moscow.day

    @y = @rome.time.to_i

    #won't work during new month
    @melbDay = dayCalc(@time.day, @time.day)
    @tokyoDay = dayCalc(@tokyo.day, @time.day)
    @romeDay = dayCalc(@rome.day, @time.day)
    @moscowDay = dayCalc(@moscow.day, @time.day)
    @laDay = dayCalc(@la.day, @time.day)




    @cities = City.all
    @city = City.find(1)



  
  end


  def twelveHour
  end


  private


  def dayCalc(x, y)
    logger.info x
    if x > y
      return 2
    elsif x == y
      return 1
    else
      return 0
    end
  end

  def timeModeCalc(x)
    logger.info x.hour
    #business
    if (x.hour >= 9) and (x.hour < 18)
      logger.info "bus"
      x = "Business"
      return x
    #overtime
    elsif (x.hour >= 18) and (x.hour < 20)
      logger.info "busover"
      x = "Business Overtime"
      return x
    #person time
    elsif (x.hour >= 8) and (x.hour < 9)  || (x.hour >= 20) and (x.hour < 23)
      logger.info "per"
      x = "Person Time"
      return x
    elsif (x.hour >= 0) and (x.hour < 8) || (x.hour >= 23) and (x.hour < 24)
      logger.info "21"
      x = "Sleeping Time"
      return x
    else
      logger.info "22"
      logger.info x.hour
    end
  end
#if (x.hour >= 23) and (x.hour < 24) || (x.hour >= 0) and (x.hour < 8) 
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
