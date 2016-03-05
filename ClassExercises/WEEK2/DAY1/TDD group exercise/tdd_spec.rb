RSpec.describe "Movie Profile" do
  let (:movie){Movie.new}
  
  it "returns with no-nil value if the data fo the data fr" do
    expect(movie.addData("Tita", "vv","oo","ii","pp","kk").size).to eq(6)
  end

end



RSpec.describe "Person Profile" do
  let (:movie){Movie.new}
  
  it "returns with no-nil value if the data fo the data fr" do
    expect(person.rol(:director).size).to eq(6)
  end

end