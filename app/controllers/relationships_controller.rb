class RelationshipsController < ApplicationController

    def new
        @relationship=Relationship.new(event_id: params[:event_id].to_i,user_id: current_user.id)
        redirect_to event_path(params[:event_id])
    end

    def destroy
        Relationship.where(event_id: params[:event_id].to_i,user_id:current_user.id).first.destroy
        redirect_to event_path(params[:event_id])
    end

    def create
        @relation = current_user.events.build(relation_params)
        if @relation.save
            flash[:notice]='Event Registeration created'
            redirect_to event_path
        else
            flash.now[:warning]='problem'
            render :action => :new
        end
    end

    private
    def relation_params
        params.require(:relationship).permit(:user_id,:event_id)
    end
    
end
