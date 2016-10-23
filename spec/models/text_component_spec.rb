require 'rails_helper'

RSpec.describe TextComponent, type: :model do

  describe '#destroy' do
    context 'given associated section' do
      subject { TextComponent.create(entry_section: EntrySection.create) }

      it 'cannot destroy component' do
        subject.destroy

        expect(subject.errors[:base]).to include 'Cannot delete record because a dependent entry section exists'
      end
    end
  end

end
