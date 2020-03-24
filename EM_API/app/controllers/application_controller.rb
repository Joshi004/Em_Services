class ApplicationController < ActionController::API
# "Authorization": `Bearer ${jwt-token}`s
    def auth_header
        p "Printing Request"
        p request.headers['Authorization'];
        request.headers['Authorization']
    end

    def encode_token (payload)
        JWT.encode(payload, nil, 'none' )
    end

    def decode_token
        if auth_header
            decoded = []
            token = auth_header.split(' ')[1]
            p "Decoding"
            decoded = JWT.decode token,nil,false
            p decoded
            return decoded
        else
            p "No Header found"
        end

    end

    def session_user
        decoded_hash = decode_token
        p "Return decoded hash is"
        p decoded_hash
        if decoded_hash.empty?
            nil
        else
            decoded_hash['user_id']
        end     
    end

end
