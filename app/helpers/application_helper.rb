module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Yes, Listen To This"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def month_select
    [
      ['January'],
      ['February'],
      ['March'],
      ['April'],
      ['May'],
      ['June'],
      ['July'],
      ['August'],
      ['September'],
      ['October'],
      ['November'],
      ['December']
    ]
  end

  def day_select
    [
      ['1'],
      ['2'],
      ['3'],
      ['4'],
      ['5'],
      ['6'],
      ['7'],
      ['8'],
      ['9'],
      ['10'],
      ['11'],
      ['12'],
      ['13'],
      ['14'],
      ['15'],
      ['16'],
      ['17'],
      ['18'],
      ['19'],
      ['20'],
      ['21'],
      ['22'],
      ['23'],
      ['24'],
      ['25'],
      ['26'],
      ['27'],
      ['28'],
      ['29'],
      ['30'],
      ['31']
    ]
  end

  def year_select
    [
      ['2018'],
      ['2019'],
      ['2020'],
      ['2021']
    ]
  end

end
