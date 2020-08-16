module API
  module V1
    class Users < Grape::API
      include API::V1::Defaults
      resource :users do
        desc "Return all users"
        get "" do
          User.all
        end
        desc "Return a user"
        params do
          requires :id, type: String, desc: "ID of the user"
        end
        get ":id" do
          User.where(id: permitted_params[:id]).first!
        end
        desc "create a user"
        post do
          User.create!(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        end
      end
    end
  end
end
