# coding: utf-8
require "gviz"

def ScenarioGraph(dotfile, show_id = nil, &blk)
  sg = ScGraph.new(show_id)

  sg.instance_eval(&blk)
  sg.do_copy
  sg.gviz.nodeset.each do |n|
    if  n.id.to_s =~ /^tiger(\d+)/
      sg.tiger($1)
    end
    if n.id.to_s =~ /^flag(\d+)/
      sg.flag($1)
    end
  end
  sg.gviz.save(dotfile)
end


class ScGraph
  attr_reader :gviz
  def initialize(show_id)
    @gviz = Gviz.new
    @scenes = Hash.new
    @options = Hash.new
    @show_id = show_id
    @edge_seq = 0
    @copy = Hash.new
  end


  class Scenes
    def initialize(node_id, items)
      @id = node_id
      @scenes = []

      if !items.empty? && items[0].class == Array
        @scenes = items
      else
        n_nichime = nil
        until items.empty?
          x = items.shift
          if x =~ /^(\d+)・/
            x = ScGraph.toKansuji($1) + '日目・' + $'
          end

          if !n_nichime && x =~ /.+・/
            n_nichime = x.split(/・/)[0]
          elsif n_nichime && x =~ /^・/
            x = n_nichime + x
          end

          a = [x]
          if !items.empty?
            a << items.shift
          end

          @scenes << a
        end
      end

    end

    def copy(new_id)
      Scenes.new(new_id, @scenes)
    end

    def add(gviz, show_id)
      label = '<table border="1">'

      if show_id
        label << "<tr><td colspan=\"2\" align=\"right\">#{@id}</td></tr>"
      end
      @scenes.each do |a|
        label << '<tr>'
        if a.size == 1
          label << '<td align="left" colspan="2">'
          label << a[0]
          label << '</td>'
        else
          label << '<td align="left">'
          label << a[0]
          label << '</td>'
          label << '<td align="left">'
          label << a[1]
          label << '</td>'
        end
        label << '</tr>'

      end
      label << '</table>'
      gviz.node @id, shape:'none', label:label
    end

  end

  class Options
    def initialize(node_id, options)
      @id = node_id
      @options = options
    end

    def copy(new_id)
      Options.new(new_id, @options)
    end

    def add(gviz, show_id)
      label = ''
      if show_id
        label << "(#{@id})\\r"
      end

      @options.each_index {|i|
        label << sprintf('%d. %s\l', i+1, @options[i])
      }
      gviz.node @id, shape:'ellipse', label:label
    end
  end

  def do_routes(node_id, routes)
    routes.each_index do |i|
      if routes[i]
        @gviz.edge "#{node_id}_#{routes[i]}_#{i+1}".intern, label: (i+1).to_s
      end
    end
  end

  def options(node_id, lines, *routes)
    lines = lines.split(/\n/)
    o = Options.new(node_id, lines)
    @options[node_id] = o
    o.add(@gviz, @show_id)

    do_routes(node_id, routes)
  end

  def scenes(scene_id, lines, optlines = nil, *routes)
    lines = lines.split(/\n/)

    s = Scenes.new(scene_id, lines)
    @scenes[scene_id] = s

    s.add(@gviz, @show_id)
    if optlines
      opt_id = (scene_id.to_s + 'opt').intern
      options(opt_id, optlines, *routes)
      @gviz.add scene_id => opt_id
    end
  end

  def copy(base_id, new_id, *routes)
    @gviz.node new_id, label: "#{new_id}:\nto be copied from #{base_id}"
    @copy[new_id] = base_id
    unless routes.empty?
      from_id = if @scenes[base_id] then new_id.to_s + 'opt' else new_id end
      do_routes(from_id.intern, routes)
    end
  end

  def do_copy
    again = true
    while again && !@copy.empty?
      again = false
      @copy.each_pair do |to, from|
        f = @scenes[from] || @options[from]
        if f
          n = f.copy(to)
          n.add(@gviz, @show_id)
          @copy.delete(to)
          again = true
          if !@scenes[from]
            @options[to] = n
          else
            @scenes[to] = n

            optid = (from.to_s + 'opt').intern
            if @options[optid]
              newid = (to.to_s + 'opt').intern
              n = @options[optid].copy(newid)
              n.add(@gviz, @show_id)
              @gviz.route to => newid
            end
          end
        end
      end
    end
  end

  def tiger(no)
    node_id = sprintf("tiger%d", no).to_sym
    @gviz.node node_id, shape:'triangle', label:"#{no}"
  end

  def flag(no)
    node_id = sprintf("flag%d", no).to_sym
    @gviz.node node_id, label: "※#{no}", shape:'rectangle'
  end

  def route(*args)
    @gviz.route(*args)
  end

  def node(*args)
    @gviz.node(*args)
  end

  def edge(from, to, label=nil)
    @gviz.edge "#{from}_#{to}_#{@edge_seq}".intern, label: label
    @edge_seq += 1
  end

  KansujiChars = ['零', '一','二', '三', '四', '五', '六', '七', '八', '九', '十']
  def self.toKansuji(d)
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


__END__
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


  def select(from, *to)
    to.each_index do |i|
      if to[i]
        k = (from.to_s + '_' + to[i].to_s).intern
        edge k, label: (i+1)
      end
    end
  end
