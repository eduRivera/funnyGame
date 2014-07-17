require_relative '../allClass'

describe "Poster" do
	before :each do
	end
    it "if is it null return null" do
    	imdbReturn = nil
    	imdbSearch = double ("ImdbFals")
    	imdbSearch.stub(:poster).and_return(imdbReturn)
        poster = MoviePoster.new(imdbSearch)
    	expect(poster.for).to eq(nil)
    end

    it "if is it have a URL return URL" do
    	imdbReturn = "http://"
    	imdbSearch = double ("ImdbFals")
    	imdbSearch.stub(:poster).and_return(imdbReturn)
        poster = MoviePoster.new(imdbSearch)
    	expect(poster.for).to eq(["http://"])
    end

    it "if is it have a one value null and one value with URL, only return URL" do
    	imdbReturn = [nil, "http://"]
    	imdbSearch = double ("ImdbFals")
    	imdbSearch.stub(:poster).and_return(imdbReturn)
        poster = MoviePoster.new(imdbSearch)
    	expect(poster.for).to eq("http://")
    end
end