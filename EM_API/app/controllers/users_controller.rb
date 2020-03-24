class UsersController < ApplicationController
    def login
        payload = {user_id: 'thinkjoshi@gmail.com'}
        token = encode_token(payload)
        render json: {user: "Naresh", jwt: token}
    end


end
