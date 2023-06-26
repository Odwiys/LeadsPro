module ApplicationHelper
	def popup(attributes = {}, &block)
		# opening wrapper
		content_tag(:div, nil, class: 'popup-overlay', data: {
			popup_target: 'popupContent'
		}) do 
			# main content
			content_tag(:div, nil, class: 'popup-content') do 
				# close button div
				content_tag(:div, 
					# close button icon
					content_tag(:button,
					content_tag(:i, nil, class: 'fa fa-times'), class: 'close-button', data: {action: 'click->popup#close'}
				)) +
				# title
				content_tag(:h2, attributes[:title], class: 'p-3 text-center mx-auto box mb-3 title-box') + 

				# content
				capture(&block)
			end
		end
	end
end
