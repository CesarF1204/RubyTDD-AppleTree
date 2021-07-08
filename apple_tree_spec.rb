require_relative 'apple_tree'
RSpec.describe AppleTree do
    before(:each) do
        @appleTree1 = AppleTree.new(10, 20)
        @appleTree2 = AppleTree.new(5, 15)
        @appleTree3 = AppleTree.new(21, 42)
    end
    describe 'has proper access methods' do
        it 'has getters and setters for the age attribute' do
            expect(@appleTree1.age).to eq(10)
        end
        it 'has a getter method for height attribute' do
            expect{@appleTree1.height = 20}.to raise_error(NoMethodError)
            expect(@appleTree1.height).to eq(20)
        end
        it 'has a getter method for apple attribute' do
            expect{@appleTree3.apple_count = 99}.to raise_error(NoMethodError)
            expect(@appleTree3.apple_count).to eq(0)
        end
    end
    describe 'checking of methods' do
        before(:each) do
            @appleTree1.year_gone_by
            @appleTree2.year_gone_by
            @appleTree3.year_gone_by
        end
        context "year_gone_by method" do
            it 'adds one year to the age' do
                expect(@appleTree1.age).to eq(11)
                expect(@appleTree2.age).to eq(6)
                expect(@appleTree3.age).to eq(22)
            end
            it 'adds a 10% height' do
                expect(@appleTree1.height).to eq(22)
                expect(@appleTree2.height).to eq(16.5)
                expect(@appleTree3.height).to eq(46.2)
            end
            it 'adds apple count by 2' do
                expect(@appleTree1.apple_count).to eq(0)
                expect(@appleTree2.apple_count).to eq(2)
                expect(@appleTree3.apple_count).to eq(0)
            end
        end
        context 'pick_apple method' do
            before(:each) do
                @appleTree1.pick_apples
                @appleTree3.pick_apples
            end
            it 'all apples from appleTree1 and appleTree3 are removed' do
                expect(@appleTree1.apple_count).to eq(0)
                expect(@appleTree3.apple_count).to eq(0)
                expect(@appleTree2.apple_count).to eq(2)
            end
        end
    end
end