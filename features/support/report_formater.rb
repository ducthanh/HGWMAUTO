require 'rubygems' 
  class ABC
    def before_features(features)
  @step_count = get_step_count(features)

  # <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
  @builder.declare!(
    :DOCTYPE,
    :html, 
    :PUBLIC, 
    '-//W3C//DTD XHTML 1.0 Strict//EN',
    'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd'
  )

  @builder << '<html xmlns ="http://www.w3.org/1999/xhtml">'
    @builder.head do
    @builder.meta(:content => 'text/html;charset=utf-8')
    @builder.title 'HGWM'
    inline_css
    inline_js
  end
  @builder << '<body>'
  @builder << "<!-- Step count #{@step_count}-->"
  @builder << '<div class="cucumber">'
  @builder.div(:id => 'cucumber-header') do
    @builder.div(:id => 'label') do
      @builder.h1('HungryGoWhere Reports')
    end
    @builder.div(:id => 'summary') do
      @builder.p('',:id => 'totals')
      @builder.p('',:id => 'duration')
    end
  end
  end
  end