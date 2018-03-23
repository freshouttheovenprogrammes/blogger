module ApplicationHelper
  def comma_seperated_links(list)
    return if list.count == 0

    list.collect do |item|
      link_to(item.name, url_for((item)))
    end.join(", ")

  end
end
