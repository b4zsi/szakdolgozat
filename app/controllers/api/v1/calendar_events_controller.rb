class Api::V1::CalendarEventsController < ApplicationController

    #A felhasználó autentikációját végzi mielőtt bármilyen műveletet végrehajtana
    before_action :authenticate_user!, only: [:create, :update, :destroy]

    # GET /api/v1/calendar_events
    # Visszaadja az összes naptár eseményt egy JSON formátumban
    def index
        events = CalendarEvent.all
        render json: events
    end

    # POST /api/v1/calendar_events/create
    # Létrehoz egy új naptár eseményt, ha nem sikerült a létrehozás, akkor hibaüzenetet ad vissza
    def create
        event = CalendarEvent.new(calendar_event_params)
        if event.save
            render json: {message: "Verseny sikeresen hozzáadva."}, status: 200
        else
            render json: {error: event.errors.message}, status: 422
        end
    end

    # DELETE /api/v1/calendar_events/:id
    # Törli a megadott azonosítójú naptár eseményt, ha nem sikerült a törlés, akkor hibaüzenetet ad vissza
    def destroy
        @event = CalendarEvent.find(params[:id])
        if @event.destroy
            render json: {message:"Verseny sikeresen törölve."}, status: 200
        else
            render json: {message:"Hiba a verseny törlése közben."}, status:422
        end
    end

    # PUT /api/v1/calendar_events/:id
    # Módosítja a megadott azonosítójú naptár eseményt, ha nem sikerült a módosítás, akkor hibaüzenetet ad vissza
    def update
        @event = CalendarEvent.find(params[:id])

        if @event.update(calendar_event_params)
            render json: {message: "Verseny sikeresen módosítva."}, status: 200
        else
            render json: {message:"Hiba a verseny törlése közben."}, status:422
        end
    end

    #Azt mondja meg, hogy mely paraméterek engedélyezettek a requestben
    private
        def calendar_event_params
            params.require(:calendar_events).permit(:id,:title, :startDate, :endDate)
        end

end
