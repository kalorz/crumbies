require 'rails_helper'

RSpec.describe StoryPart, type: :model do

  context 'given associated component' do
    let(:component_types) { [TextComponent, MediaComponent] }

    describe '#destroy' do
      let(:story) { Journal.create.stories.create }

      it 'destroys the component' do
        component_types.each do |component_type|
          part = story.parts.create(component: component_type.new)

          expect { part.destroy }.to change(component_type, :count).by(-1)
        end
      end
    end

    context 'when destroying the associated component' do
      let(:part) { Journal.create.stories.create.parts.create }

      it 'cannot destroy component with associated story part' do
        component_types.each do |component_type|
          component = component_type.create(story_part: part)

          expect { component.destroy }.not_to change(component_type, :count)

          expect(component.errors[:base]).to include 'Cannot delete record because a dependent story part exists'
        end
      end
    end
  end

end
