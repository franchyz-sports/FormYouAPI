module UsersHelper
  def is_admin?
    return true
  end

  def is_teacher?
    return true
  end

  def is_student?
    return true
  end
  
  def decode_token
    token = request.headers['Authorization'].split[1]
    @decoded_token = JWT.decode token, nil, false
    puts 'dddddddddddddd'
    puts @decoded_token
  end
  
  def check_auth
    if (request.headers['Authorization'] == nil)
      render json: 'token is missing'
    end
  end

  def check_admin
    if @decoded_token[0]['scp'] != 'admin'
      render json: 'you are not an admin'
    end
  end
end
