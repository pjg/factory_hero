require 'spec_helper'

describe 'Refinements' do

  describe '#symbolize' do
    before do
      class Test
        using Symbolize

        def test
          'Test'.symbolize
        end
      end
    end

    it 'symbolizes the string' do
      expect(Test.new.test).to eq :test
    end

    after do
      Object.send :remove_const, 'Test'
    end
  end

end
