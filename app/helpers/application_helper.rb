module ApplicationHelper
	def full_title(page_title)
		 if admin_signed_in? 
		 	base_title = "3DPetMan"
		 	if current_admin.company
		 		base_title = current_admin.company.name + " @3DPetMan"
		 	end
		else
			"System Administrator @ 3DPetMan"
		end
		if page_title.empty?
			base_title
		else 
			"#{base_title} | #{page_title}"
		end
	end
	def header(text)
		content_for(:header) { text.to_s }
	end
	


end
