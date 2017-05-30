module ApplicationHelper

  # Define a new class to extend the Redcarpet HTML renderer
  class HTMLwithPygments < Redcarpet::Render::HTML
		def block_code(code, language)
      options = { encoding: 'utf-8' }
			Pygments.highlight(code, lexer: language, options: options)
		end

	end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(HTMLwithPygments,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      space_after_headers: true,
      footnotes: true)
    return markdown.render(text).html_safe
  end
end
