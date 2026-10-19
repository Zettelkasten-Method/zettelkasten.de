module NanocSite
  class GraphvizFiguresFilter < Nanoc::Filter
    identifier :graphviz_figures

    def run(content, params={})
      GraphvizFigure.with_figures(content)
    end
  end
end
