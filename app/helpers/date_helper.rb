module DateHelper
  def self.prettify(date)
    date.strftime('%b %d, %Y')
  end
end
