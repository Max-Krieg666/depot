module OrdersHelper
  def select_user(user, selected = nil)
    select_tag(user, options_for_select(
                       User.order('email').load.map{ |x| [x.email, x.id] } + [['', nil]],
                       [selected]))
  end

  def select_status(status, selected = nil)
    select_tag(status, options_for_select([['Оформлен', 0], ['Подтверждён', 1],
                                           ['Отменён', 2], ['Доставляется', 3],
                                           ['Завершён', 4]]))
  end
  def status_view(status)
    if status==0
      "Оформлен"
    elsif status==1
      "Подтверждён"
    elsif status==2
      "Отменён"
    elsif status==3
       "Доставляется"
    else
      "Завершён"
    end
  end
end