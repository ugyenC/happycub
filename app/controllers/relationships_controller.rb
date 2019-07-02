class RelationshipsController < ApplicationController

    def index
        @relation=Relationship.all
    end

    def new
        @relation = Relationship.new
        @user= current_user.id
        @event=Event.find(params[:event_id])

    def create
        @relation = Relationship.new(relation_params)
        @relation.save

    end

    private
    def relation_params
        params.require(:relationship).permit(:user_id,:event_id)
    end
    end
end
