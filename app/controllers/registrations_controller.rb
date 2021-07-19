class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)


      resource.class.transaction do
        resource.save
        yield resource if block_given?
        if resource.persisted?
          @payment = Payment.new({email: params["user"]["email"],
            token: params[:payment]["token"], user_id: resource.id})
            print "Hello!"
            print @payment.user_id
          flash[:error] = "Please check registration errors" unless @payment.valid?

          begin
            @payment.process_payment
            @payment.save
          rescue Exception => e
            flash[:error] = e.message

            puts "Status is: #{e.http_status}"
            puts "Type is: #{e.error.type}"
            puts "Charge ID is: #{e.error.charge}"
            # The following fields are optional
            puts "Code is: #{e.error.code}" if e.error.code
            puts "Decline code is: #{e.error.decline_code}" if e.error.decline_code
            puts "Param is: #{e.error.param}" if e.error.param
            puts "Message is: #{e.error.message}" if e.error.message

            resource.destroy
            puts 'Payment failed'
            render :new and return
          end

          if resource.active_for_authentication?
            set_flash_message:notice, :signed_up if is_flashing_format?
            sign_up(resource_name, resource)
            respond_with resource, location: after_sign_up_path_for(resource)
          else
            set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
            expire_data_after_sign_in!
            respond_with resource, location: after_inactive_sign_up_path_for(resource)
          end
        else
          clean_up_passwords resource
          set_minimum_password_length
          respond_with resource
        end
      end
  end


  protected

  def configure_permitted_parameters
    devise_parameters_sanitizer.for(:sign_UP).push(:payment)
  end

end
