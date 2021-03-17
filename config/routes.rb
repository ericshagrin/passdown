Rails.application.routes.draw do

  get("/", { :controller => "apartments", :action => "index" })


  # Routes for the Interested buyer resource:

  # CREATE
  post("/insert_interested_buyer", { :controller => "interested_buyers", :action => "create" })
          
  # READ
  get("/interested_buyers", { :controller => "interested_buyers", :action => "index" })
  
  get("/interested_buyers/:path_id", { :controller => "interested_buyers", :action => "show" })
  
  # UPDATE
  
  post("/modify_interested_buyer/:path_id", { :controller => "interested_buyers", :action => "update" })
  
  # DELETE
  get("/delete_interested_buyer/:path_id", { :controller => "interested_buyers", :action => "destroy" })

  #------------------------------

  # Routes for the Photo resource:

  # CREATE
  post("/insert_photo", { :controller => "photos", :action => "create" })
          
  # READ
  get("/photos", { :controller => "photos", :action => "index" })
  
  get("/photos/:path_id", { :controller => "photos", :action => "show" })
  
  # UPDATE
  
  post("/modify_photo/:path_id", { :controller => "photos", :action => "update" })
  
  # DELETE
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

  #------------------------------

  # Routes for the Apartment resource:

  # CREATE
  post("/insert_apartment", { :controller => "apartments", :action => "create" })
          
  # READ
  get("/apartments", { :controller => "apartments", :action => "index" })
  
  get("/apartments/:path_id", { :controller => "apartments", :action => "show" })
  
  # UPDATE
  
  post("/modify_apartment/:path_id", { :controller => "apartments", :action => "update" })
  
  # DELETE
  get("/delete_apartment/:path_id", { :controller => "apartments", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
