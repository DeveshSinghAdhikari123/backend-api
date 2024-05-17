class SessionsController < ApplicationController


# APi Tested by curl curl -i -X POST -H "Content-Type: application/json" -d '{"user": {"email":"devesh123@gmail.com","password": "test123"}}' http://localhost:3000/sessions

 def create
   user = User.find_by(email: params["user"]["email"]).try(:authenticate, params["user"]["password"])
   
   if user
   	session[:user_id] = user.id
	    render json: {
	     status: :created,
	     logged_in: true,
	     user: user,	
	     msg: "Succesful loged in..."
	    }
   else
   	 render json: {status: 401}
   end
 end

end	