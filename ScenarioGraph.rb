# coding: utf-8
module ScenarioGraph

  def do_options(node_id, options)
    label = ''
    if $ShowId
      label << "(#{node_id})\\r"
    end

    options.each_index {|i|
      label << sprintf('%d. %s\l', i+1, options[i])
    }
    node node_id, shape:'ellipse', label:label
  end

  def options(node_id, lines)
    do_options(node_id, lines.split(/\n/))
  end

  def do_scenes(scene_id, items)
    label = '<table border="1">'
    n_nichime = nil
    
    if $ShowId
      label << "<tr><td colspan=\"2\" align=\"right\">#{scene_id}</td></tr>"
    end

    if items.size % 2 == 1
      items << ''
    end
    until items.empty?
      x = items.shift
      if x =~ /^(\d+)・/
        x = toKansuji($1) + '日目・' + $'
      end

      if !n_nichime && x =~ /.+・/ 
        n_nichime = x.split(/・/)[0]
      elsif n_nichime && x =~ /^・/
        x = n_nichime + x
      end

      label << '<tr>'
      label << '<td align="left">'
      label << x
      label << '</td>'
      label << '<td align="left">'
      label << items.shift
      label << '</td>'
      label << '</tr>'
    end
    label << '</table>'

    node scene_id, shape:'none', label:label

  end

  def scenes(scene_id, lines, options = nil, *routes)
    if (scene_id.class == Array)
      scene_id.each_index do |i|
        routes2 = routes.map {|x|
          if x.class == Array
            x[i]
          else
            x
          end
        }
        scenes_single(scene_id[i], lines, options, routes2)
      end
    else
      scenes_single(scene_id, lines, options, routes)
    end
  end

  def scenes_single(scene_id, lines, options = nil, routes)
    from = scene_id
    if !options
      do_scenes(scene_id, lines.split(/\n/))
    else
      choice_id = (scene_id.to_s + "opt").to_sym
      do_scenes(scene_id, lines.split(/\n/))
      do_options(choice_id, options.split(/\n/))

      route scene_id => choice_id

      from = choice_id
    end

    routes.each_index do |i|
      if routes[i]
        edge (from.to_s + '_' + routes[i].to_s).intern, label: (i+1)
      end
    end
  end

  def tiger(no)
    node_id = sprintf("tiger%d", no).to_sym
    node node_id, shape:'triangle', label:"#{no}"
  end


  def select(from, *to)
    to.each_index do |i|
      if to[i]
        k = (from.to_s + '_' + to[i].to_s).intern
        edge k, label: (i+1)
      end
    end
  end

  KansujiChars = ['零', '一','二', '三', '四', '五', '六', '七', '八', '九', '十']
  def toKansuji(d)
    d = d.to_i
    ret = ''
    if d <= 10
      ret = KansujiChars[d]
    elsif d < 20
      ret = '十' + KansujiChars[d - 10]
    else
      ret = KansujiChars[d / 10] + '十' + KansujiChars[d % 10]
    end
    ret
  end

end
