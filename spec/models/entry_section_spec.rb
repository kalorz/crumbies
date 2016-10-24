require 'rails_helper'

RSpec.describe EntrySection, type: :model do

  context 'given associated component' do
    let(:component_types) { [TextComponent, MediaComponent] }

    describe '#destroy' do
      let(:story) { Journal.create.stories.create }

      it 'destroys the component' do
        component_types.each do |component_type|
          section = story.sections.create(component: component_type.new)

          expect { section.destroy }.to change(component_type, :count).by(-1)
        end
      end
    end

    context 'when destroying the associated component' do
      let(:section) { Journal.create.stories.create.sections.create }

      it 'cannot destroy component with associated section' do
        component_types.each do |component_type|
          component = component_type.create(entry_section: section)

          expect { component.destroy }.not_to change(component_type, :count)

          expect(component.errors[:base]).to include 'Cannot delete record because a dependent entry section exists'
        end
      end
    end
  end

end
