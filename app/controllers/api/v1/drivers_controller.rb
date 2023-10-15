class Api::V1::DriversController < ApplicationController
    def index
        @drivers = Driver.all

        render json: @drivers, each_serializer: DriverSerializer
    end

    def show
         drivers = Driver.where(series_id: params[:id])
         #drivers = Driver.find(params[:id])

        #note to self: a find_by csak az elso elofordulast adja vissza, a where az osszeset
        # if drivers.profile_picture.attached?
            # image_data = drivers.profile_picture.download
            # base64_encoded_image = Base64.strict_encode64(image_data)
            # render json: { drivers: drivers.as_json.merge(profile_picture: base64_encoded_image) }
         render json: drivers, each_serializer: DriverSerializer
         #render json: drivers, Serializer: DriverSerializer
        # render json: { @drivers: driver.attributes.merge(profile_picture: Base64.strict_encode64(driver.profile_picture)) }, each_serializer: DriverSerializer
        # else
            # render json: { error: "Profile picture not found" }, status: :not_found
        # end
    end


    private

    def driver_params
        params.require(:drivers).permit(:id)
    end

end