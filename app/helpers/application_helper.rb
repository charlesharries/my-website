module ApplicationHelper

  # If you want to use Pygments again, uncomment this
  # Define a new class to extend the Redcarpet HTML renderer
  # class HTMLwithPygments < Redcarpet::Render::HTML
	# 	def block_code(code, language)
  #     options = { encoding: 'utf-8' }
	# 		Pygments.highlight(code, lexer: language, options: options)
	# 	end

	# end

  # And replace 'Redcarpet::Render::HTML' with 'HTMLwithPygments'
  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      space_after_headers: true,
      footnotes: true)
    return markdown.render(text).html_safe
  end
  
  def page_title(title = "")
    if title.empty?
      "Charles Harries"
    else
      "CH | #{title}"
    end
  end
end
