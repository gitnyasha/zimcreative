module API
  module V1
    class Videos < Grape::API
      include API::V1::Defaults
      resource :videos do
        desc "Return all Videos"
        get "" do
          Video.all
        end
        desc "Return a Video"
        params do
          requires :id, type: String, desc: "ID of the Video"
        end
        get ":id" do
          Video.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
