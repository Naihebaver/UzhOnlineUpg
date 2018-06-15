module PagesHelper
	def custom_format(time)


    st = Time.now.beginning_of_day
    nd = Time.now.end_of_day

    case 
    when time.between?(st, nd)
      "Today, #{time.strftime('%H:%M')}"
    when time.between?(st - 1.day, nd - 1.day)
      "Yesterday, #{time.strftime('%H:%M')}"
    when time.between?(st - 6.day, nd - 2.day)
      time.strftime('%A, %H:%M')
    else 
      time.strftime('%d.%m.%y %H:%M')
    end


	end
end