class PasswordController < ApplicationController
    Error = Class.new(StandardError)
    LengthError = Class.new(Error)
    InvalidParam = Class.new(Error)
  
    MIN_LENGTH = 20.freeze
  	MAN_LENGTH = 100.freeze
    MIN_SPECIAL = 10.freeze
  
    def show
        validate_length!
        validate_params!
      
        digits    = Array.new(digits_param) { |i| ('0'..'9').to_a.sample }
        lowercase = Array.new(lowercase_param) { |i| ('a'..'z').to_a.sample }
        uppercase = Array.new(uppercase_param) { |i| ('A'..'Z').to_a.sample }
      
        resto = Array.new(length_param - digits_param - lowercase_param - uppercase_param) { |i| ('0'..'z').to_a.sample }
        
        password = (digits + lowercase + uppercase + resto).shuffle.join
      
        render json: {
            password: password
        }
      
    rescue ArgumentError, LengthError, InvalidParam => e
      render json: { error: e.message, status: 403 }, status: 403
    end

    private

    def length_param
        params[:length].to_i
    end
    def lowercase_param
        params[:lowercase].to_i
    end
    def uppercase_param
        params[:uppercase].to_i
    end
    def digits_param
        params[:digits].to_i
    end
  
    def validate_length!
      raise(LengthError, "Length Error!") if length_param < MIN_LENGTH || length_param > MAN_LENGTH || length_param < (digits_param + lowercase_param + uppercase_param)
    end
  
    def validate_params!
      raise(InvalidParam,"Invalid Parameter") if [lowercase_param, uppercase_param, digits_param].any? {|o| o < MIN_SPECIAL || o > MAN_LENGTH}
    end
end


# Write a REST API that allows users to generate random passwords following these rules and requirements:

# The REST API endpoint should be /generate-password
# The parameters are received via query string
# The parameters are:
# length: the total length of the password
# lowercase: the number of lowercase letters that the password must have
# uppercase: the number of uppercase letters that the password must have
# digits: the number of digits the password must have
# Return a 403 HTTP error when:
# The total number of password characters received as parameters is less than 20
# The number of lowercase letters is lower than 10
# The number of uppercase letters is lower than 10
# The number of digits is lower than 10

# Feel free to use any programming language and framework.

# Focus on properly implementing all input validation. This will help us understand what you expect from a source code you're reviewing during an assessment.

# The following is an example call to the REST API, where "..." is the randomly generated password:

# $ curl 'http://localhost/generate-password?lowercase=10&uppercase=10&digits=10&length=50'

# {"password": "..."}


# Optional requirements:

# Include a README.md for REST API consumers
# Create a Dockerfile
# Unit tests for the password generation function 
# Kubernetes deployment yaml

# The result for this challenge needs to be uploaded as a secret gist and the link to it should be sent in a reply to the email where you got this document.
