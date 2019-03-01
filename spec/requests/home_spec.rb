require 'spec_helper'

describe "Home", type: :request do
	let (:base_title) {"C3 Church Kelowna/Revelstoke - You Becoming You!"}

	describe "index" do
		before {visit root_path}
		it "should have title 'Home'" do
			expect(page).to have_title "Home | #{base_title}"
		end
		it "should have content 'Locations'" do
			expect(page).to have_content "Locations"
		end
	end

	describe "media" do
		before {visit media_path}
		it "should have title 'Media'" do
			expect(page).to have_title "Media | #{base_title}"
		end
	end
	describe "nextsteps" do
		before {visit nextstep_path}
		it "should have title 'Next Steps'" do
			expect(page).to have_title "Next Steps | #{base_title}"
		end
	end
end
