require 'rails_helper'

RSpec.describe EntrySection, type: :model do

  describe '#destroy' do
    context 'given associated component' do
      subject! { Journal.create.entries.create.sections.create(component: TextComponent.new) }

      it 'destroys the component' do
        expect { subject.destroy }.to change(TextComponent, :count).by(-1)
      end
    end
  end

end
