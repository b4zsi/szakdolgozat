class Api::V1::CalendarEventsController < ApplicationController

    before_action :authenticate_user!, only: [:create, :update, :destory]
    def index
        events = CalendarEvent.all
        render json: events, each_serializer: CalendarEventSerializer
    end

    def create
        event = CalendarEvent.new(calendar_event_params)
        if event.save
            render json: {message: "Verseny sikeresen hozzáadva."}, status: 200
        else
            render json: {error: event.errors.message}, status: 422
        end
    end

    def destroy
        @event = CalendarEvent.find(params[:id])
        if @event.destroy
            render json: {message:"Verseny sikeresen törölve."}, status: 200
        else
            render json: {message:"Hiba a verseny törlése közben."}, status:422
        end
    end

    def update
        @event = CalendarEvent.find(params[:id])

        if @event.update(calendar_event_params)
            render json: {message: "Verseny sikeresen módosítva."}, status: 200
        else 
            render json: {message:"Hiba a verseny törlése közben."}, status:422
        end
    end

    private
        def calendar_event_params
            params.require(:calendar_events).permit(:id,:title, :startDate, :endDate)
        end

end
